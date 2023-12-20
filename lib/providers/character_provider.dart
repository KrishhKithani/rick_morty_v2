import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:rick_morty_v2/models/character.dart';
import 'package:rick_morty_v2/models/character_list.dart';
CharacterList? characterList;
List<Character>? character ;

final characterProvider = FutureProvider.autoDispose((ref) async{
  final dio = Dio();
  const url = 'https://rickandmortyapi.com/api/character';

  final response = await dio.get(url);
  characterList = CharacterList.fromJson(response.data);
  character = characterList?.results;
  return character;
}
);
