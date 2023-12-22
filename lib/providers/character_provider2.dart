
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_morty_v2/models/character.dart';
import 'package:rick_morty_v2/models/character_list.dart';



class CharacterProviderNotifier
    extends StateNotifier<AsyncValue<List<Character>>> {

  CharacterProviderNotifier() : super(const AsyncValue.loading()){
    fetchData();
  }

  Future<void> fetchData() async {
    state = const AsyncValue.loading();
    try {
      final dio = Dio();
      const url = 'https://rickandmortyapi.com/api/character';
      final response = await dio.get(url);
      CharacterList characterList = CharacterList.fromJson(response.data);
      state = AsyncValue.data(characterList.results);
    } catch (error , S) {
      state =  AsyncValue.error(error,S );
    }
  }
  // Future<void> fetch() async {
  //   print('fetch called');
  //   state = const AsyncValue.loading();
  //   state = await AsyncValue.guard(() => fetchData());
  // }
}

  final characterListProvider = StateNotifierProvider<
      CharacterProviderNotifier,
      AsyncValue<List<Character>>>(
        (ref) => CharacterProviderNotifier(),
  );

