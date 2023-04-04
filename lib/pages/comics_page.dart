import 'package:flutter/material.dart';
import 'package:marvel_universe/models/comics_response.dart';
import 'package:marvel_universe/repository/marvel_repository.dart';

class ComicsPage extends StatefulWidget {
  const ComicsPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ComicsPage> createState() => _ComicsPageState();
}

class _ComicsPageState extends State<ComicsPage> {
  late MarvelRepository marvelRepository;
  var comicsResponse = ComicsResponse();

  @override
  void initState() {
    marvelRepository = MarvelRepository();
    super.initState();
    getComics();
  }

  void getComics() async {
    comicsResponse = await marvelRepository.getComics();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GridView.builder(
          padding: const EdgeInsets.all(8.0),
          itemCount: (comicsResponse.data == null || comicsResponse.data?.results == null) ? 0
          : comicsResponse.data?.results?.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3/4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 30
          ),
          itemBuilder: (BuildContext context, int index) {
            var comic = comicsResponse.data!.results![index];
            return GridTile(
                child: GestureDetector(
                  onTap: () {},
                  child: Column(
                    children: <Widget>[
                      Expanded(child: Image.network("${comic.thumbnail?.path}/portrait_uncanny.${comic.thumbnail?.extension}")),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        comic.title!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                )
            );
          }
      ),
    );
  }
}
