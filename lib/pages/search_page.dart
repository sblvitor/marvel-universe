import 'package:flutter/material.dart';
import 'package:marvel_universe/pages/character_details_page.dart';

import '../models/characters_response.dart';
import '../repository/marvel_repository.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(
                    context: context,
                    delegate: CustomSearchDelegate());
              },
              icon: const Icon(Icons.search)
          )
        ],
      ),
      body: const Center(
        child: Text("Search for characters!",
        style: TextStyle(color: Colors.white, fontSize: 24)),
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {

  List<String> searchResults = [
    'Spider-Man',
    'Thor',
    'Captain America'
  ];

  @override
  List<Widget>? buildActions(BuildContext context) => [IconButton(
      onPressed: () {
        if(query.isEmpty) {
          close(context, null);
        } else {
          query = '';
        }
      },
      icon: const Icon(Icons.clear)),
  ];

  @override
  Widget? buildLeading(BuildContext context)  => IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back));

  @override
  Widget buildResults(BuildContext context) {
    // Tentando adicionar à lista de sugestoes (usar shared preferences talvez)
    /*if(!searchResults.contains(query)){
      searchResults.add(query);
    }*/
    return QuerySearch(query: query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = searchResults.where((searchResult) {
      final result = searchResult.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();

    return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          final suggestion = suggestions[index];
          return ListTile(
            title: Text(suggestion,
                style: const TextStyle(color: Colors.white)
            ),
            onTap: () {
              query = suggestion;
              showResults(context);
            },
          );
        });
  }

}

class QuerySearch extends StatefulWidget {
  const QuerySearch({Key? key, required this.query}) : super(key: key);

  final String query;

  @override
  State<QuerySearch> createState() => _QuerySearchState();
}

class _QuerySearchState extends State<QuerySearch> {
  var marvelRepository = MarvelRepository();
  var charactersResponse = CharactersResponse();
  var loading = false;

  @override
  void initState() {
    super.initState();
    searchCharacters();
  }

  void searchCharacters() async {
    setState(() {
      loading = true;
    });
    charactersResponse = await marvelRepository.searchCharacters(widget.query);
    loading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return loading
      ? const Center(child: CircularProgressIndicator())
      : ListView.builder(
        itemCount: (charactersResponse.data == null ||
            charactersResponse.data!.results == null)
            ? 0
            : charactersResponse.data!.results!.length,
        itemBuilder: (context, int index) {
          var character = charactersResponse.data!.results![index];
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) =>
                  CharacterDetailsPage(character: character)));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 2,
                      child: Image.network("${character.thumbnail?.path}/standard_fantastic.${character.thumbnail?.extension}")
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        character.name!,
                        style: const TextStyle(color: Colors.white, fontSize: 22),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
