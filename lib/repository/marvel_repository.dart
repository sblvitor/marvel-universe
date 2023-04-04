import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:marvel_universe/models/comics_response.dart';

import '../models/characters_response.dart';
import 'package:dio/dio.dart';

class MarvelRepository {
  //late final CharactersResponse _characterResponse;

  //get characters => _characterResponse;

  final _publicApiKey = dotenv.env['MARVEL_PUBLIC_KEY'];
  final _privateApiKey = dotenv.env['MARVEL_PRIVATE_KEY'];

  Future<CharactersResponse> getCharacters(int offset) async {
    var dio = Dio();

    var ts = DateTime.now();
    var hash = generateMd5(ts.toString() + _privateApiKey.toString() + _publicApiKey.toString());
    var response = await dio.get(
        "https://gateway.marvel.com:443/v1/public/characters?offset=$offset&ts=$ts&apikey=$_publicApiKey&hash=$hash"
    );
    return CharactersResponse.fromJson(response.data);
  }

  Future<CharactersResponse> searchCharacters(String query) async {
    var dio = Dio();

    var ts = DateTime.now();
    var hash = generateMd5(ts.toString() + _privateApiKey.toString() + _publicApiKey.toString());
    var response = await dio.get(
        "https://gateway.marvel.com:443/v1/public/characters?nameStartsWith=$query&ts=$ts&apikey=$_publicApiKey&hash=$hash"
    );
    return CharactersResponse.fromJson(response.data);
  }

  Future<ComicsResponse> getComics() async {
    var dio = Dio();

    var ts = DateTime.now();
    var hash = generateMd5(ts.toString() + _privateApiKey.toString() + _publicApiKey.toString());
    var response = await dio.get(
      "https://gateway.marvel.com:443/v1/public/comics?ts=$ts&apikey=$_publicApiKey&hash=$hash"
    );

    return ComicsResponse.fromJson(response.data);
  }

  String generateMd5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }
}