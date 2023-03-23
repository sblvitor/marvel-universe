import 'package:flutter/material.dart';

class ComicsPage extends StatefulWidget {
  const ComicsPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ComicsPage> createState() => _ComicsPageState();
}

class _ComicsPageState extends State<ComicsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
    );
  }
}
