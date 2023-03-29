import 'package:flutter/material.dart';
import 'package:marvel_universe/models/character_model.dart';

class CharacterDetailsPage extends StatefulWidget {
  const CharacterDetailsPage({Key? key, required this.character}) : super(key: key);

  final CharacterModel character;

  @override
  State<CharacterDetailsPage> createState() => _CharacterDetailsPageState();
}

class _CharacterDetailsPageState extends State<CharacterDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Character Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Aparições:",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      " - Quadrinhos: ${widget.character.comics?.available}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: Colors.white, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      " - Séries: ${widget.character.series?.available}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: Colors.white, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      " - Estórias: ${widget.character.stories?.available}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: Colors.white, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      " - Eventos: ${widget.character.events?.available}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
                const Padding(padding: EdgeInsets.only(right: 8.0)),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Hero(
                      tag: widget.character.name!,
                      child: Image.network(
                        "${widget.character.thumbnail?.path}/detail.${widget.character.thumbnail?.extension}",
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              widget.character.name!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              widget.character.description!,
              maxLines: 10,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.white70, fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            const Divider(
              color: Colors.white70,
            ),
          ],
        ),
      ),
    );
  }
}
