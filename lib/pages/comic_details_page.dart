import 'package:flutter/material.dart';
import 'package:marvel_universe/models/comic_model.dart';

class ComicDetailsPage extends StatefulWidget {
  const ComicDetailsPage({Key? key, required this.comic}) : super(key: key);

  final Comics comic;

  @override
  State<ComicDetailsPage> createState() => _ComicDetailsPageState();
}

class _ComicDetailsPageState extends State<ComicDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Comic Details"),
      ),
      body: Container(),
    );
  }
}
