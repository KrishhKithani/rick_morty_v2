import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_morty_v2/models/character.dart';
import '../models/character_list.dart';


// final numberProvider = StateProvider<int>((ref) =>  2);

final apiDataProvider = Provider((ref) => ApiData());

class ApiData{
  int abc= 0;
  void increment(){
    abc++;
  }
  void printabc(){
  print(abc.toString());
  }
  Future<List<Character>?> fetchData ()async {
    await Future.delayed(const Duration(seconds: 5));
    final dio = Dio();
    const url = 'https://rickandmortyapi.com/api/character';
    final response = await dio.get(url);
    CharacterList characterList = CharacterList.fromJson(response.data);
    return characterList.results;
  }
}