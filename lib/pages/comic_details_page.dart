import 'package:flutter/material.dart';
import 'package:marvel_universe/models/comic_model.dart';

class ComicDetailsPage extends StatefulWidget {
  const ComicDetailsPage({Key? key, required this.comic}) : super(key: key);

  final Comics comic;

  @override
  State<ComicDetailsPage> createState() => _ComicDetailsPageState();
}

class _ComicDetailsPageState extends State<ComicDetailsPage> {

  String getDescription() {
    if(widget.comic.description == null || widget.comic.description == ""){
      if(widget.comic.textObjects != null) {
        if(widget.comic.textObjects!.isNotEmpty) {
          return widget.comic.textObjects![0].text!;
        } else {
          return "No description available";
        }
      } else {
        return "No description available";
      }
    } else {
      return widget.comic.description!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Comic Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                    "${widget.comic.thumbnail?.path}.${widget.comic.thumbnail?.extension}",
                    width: 150
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Text(widget.comic.title!.toUpperCase(),
                    style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Text("Pages: ${widget.comic.pageCount}", style: const TextStyle(color: Colors.white70)),
            const SizedBox(
              height: 32,
            ),
            const Text("Summary",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22)
            ),
            const SizedBox(
              height: 8,
            ),
            Text(getDescription(),
              style: const TextStyle(color: Colors.white),
              textAlign: TextAlign.justify,
            )
          ],
        ),
      ),
    );
  }
}
