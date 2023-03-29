import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../models/characters_response.dart';
import 'package:dio/dio.dart';

class CharactersRepository {
  //late final CharactersResponse _characterResponse;

  //get characters => _characterResponse;

  Future<CharactersResponse> getCharacters(int offset) async {
    var dio = Dio();

    var ts = DateTime.now();
    var publicApiKey = dotenv.env['MARVEL_PUBLIC_KEY'];
    var privateApiKey = dotenv.env['MARVEL_PRIVATE_KEY'];
    var hash = generateMd5(ts.toString() + privateApiKey.toString() + publicApiKey.toString());
    var response = await dio.get(
        "https://gateway.marvel.com:443/v1/public/characters?offset=$offset&ts=$ts&apikey=$publicApiKey&hash=$hash"
    );
    return CharactersResponse.fromJson(response.data);
  }

  Future<CharactersResponse> searchCharacters(String query) async {
    var dio = Dio();

    var ts = DateTime.now();
    var publicApiKey = dotenv.env['MARVEL_PUBLIC_KEY'];
    var privateApiKey = dotenv.env['MARVEL_PRIVATE_KEY'];
    var hash = generateMd5(ts.toString() + privateApiKey.toString() + publicApiKey.toString());
    var response = await dio.get(
        "https://gateway.marvel.com:443/v1/public/characters?nameStartsWith=$query&ts=$ts&apikey=$publicApiKey&hash=$hash"
    );
    return CharactersResponse.fromJson(response.data);
  }

  String generateMd5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }
}