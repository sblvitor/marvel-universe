import 'package:flutter/material.dart';
import 'package:marvel_universe/models/characters_response.dart';
import 'package:marvel_universe/pages/character_details_page.dart';
import 'package:marvel_universe/repository/marvel_repository.dart';

class CharactersPage extends StatefulWidget {
  const CharactersPage({super.key, required this.title});

  final String title;

  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  late MarvelRepository marvelRepository;
  var charactersResponse = CharactersResponse();
  var loading = false;
  final _scrollController = ScrollController();
  int offset = 0;
  var atBottom = false;

  @override
  void initState() {
    _scrollController.addListener(() {
      var positionToGetMore = _scrollController.position.maxScrollExtent * 0.7;
      if (_scrollController.position.pixels > positionToGetMore) {
        getCharacters();
      }
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        setState(() {
          atBottom = true;
        });
      } else {
        setState(() {
          atBottom = false;
        });
      }
    });
    marvelRepository = MarvelRepository();
    super.initState();
    getCharacters();
  }

  void getCharacters() async {
    if (loading) return;
    if (charactersResponse.data == null ||
        charactersResponse.data?.results == null) {
      setState(() {
        loading = true;
      });
      charactersResponse = await marvelRepository.getCharacters(offset);
      loading = false;
    } else {
      setState(() {
        loading = true;
      });
      offset = offset + charactersResponse.data!.count!;
      var tempList = await marvelRepository.getCharacters(offset);
      charactersResponse.data?.results?.addAll(tempList.data!.results!);
      loading = false;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.filter_list))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: (charactersResponse.data == null ||
                    charactersResponse.data!.results == null)
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    controller: _scrollController,
                    itemCount: charactersResponse.data?.results?.length,
                    itemBuilder: (BuildContext context, int index) {
                      var character = charactersResponse.data?.results?[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        elevation: 16,
                        clipBehavior: Clip.hardEdge,
                        color: Colors.white10,
                        child: InkWell(
                            splashColor: Colors.red.withAlpha(50),
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (_) =>
                                  CharacterDetailsPage(character: character!)));
                            },
                            child: ThumbnailPlusInfos(
                                imageUrl: "${character?.thumbnail?.path}/portrait_uncanny.${character?.thumbnail?.extension}",
                                name: "${character?.name}",
                                description: "${character?.description}")),
                      );
                    },
                  ),
          ),
          if (atBottom) const BottomCircularProgressBar()
        ],
      ),
    );
  }
}

class ThumbnailPlusInfos extends StatefulWidget {
  const ThumbnailPlusInfos(
      {super.key,
      required this.imageUrl,
      required this.name,
      required this.description});

  final String imageUrl;
  final String name;
  final String description;

  @override
  State<ThumbnailPlusInfos> createState() => _ThumbnailPlusInfosState();
}

class _ThumbnailPlusInfosState extends State<ThumbnailPlusInfos> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
              tag: widget.name,
              child: Image.network(widget.imageUrl, width: 100)),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                child: _CharacterInfo(
                    nome: widget.name, description: widget.description),
              )
          )
        ],
      ),
    );
  }
}

class _CharacterInfo extends StatefulWidget {
  const _CharacterInfo({required this.nome, required this.description});

  final String nome;
  final String description;

  @override
  State<_CharacterInfo> createState() => _CharacterInfoState();
}

class _CharacterInfoState extends State<_CharacterInfo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          widget.nome,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const Padding(padding: EdgeInsets.only(bottom: 8.0)),
        Text(
          widget.description,
          maxLines: 6,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: Colors.white70),
          textAlign: TextAlign.start,
        )
      ],
    );
  }
}

class BottomCircularProgressBar extends StatefulWidget {
  const BottomCircularProgressBar({Key? key}) : super(key: key);

  @override
  State<BottomCircularProgressBar> createState() =>
      _BottomCircularProgressBarState();
}

class _BottomCircularProgressBarState extends State<BottomCircularProgressBar> {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 15,
      height: 15,
      child: CircularProgressIndicator(),
    );
  }
}
