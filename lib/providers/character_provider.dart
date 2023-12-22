
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_morty_v2/models/character.dart';
import 'package:rick_morty_v2/models/character_list.dart';
import 'package:rick_morty_v2/providers/api_data.dart';
//CharacterList? characterList;
//List<Character>? character ;
final api = ApiData();

final characterProvider = FutureProvider.autoDispose<List<Character>?>((ref){
  print('++++++++++++++++++= API CALL DONE');


  // ref.listen<StateController<ApiData>>(apiDataProvider.state, (previous, next) {
  //
  //   next.state;
  // });


  //final api = ref.read(apiDataProvider);
  // ref.watch(provider)
  // ref.read(provider)
  // ref.refresh(provider)
  // ref.notifyListeners()
  // ref.exists(provider)
  // ref.invalidate(provider)
  // ref.invalidateSelf()
  // ref.keepAlive()
  // ref.onAddListener(() { })
  // ref.onDispose(() { })
  // ref.onCancel(() { })
  // ref.

  api.printabc();
  api.increment();
  api.printabc();

  return ApiData().fetchData();
}
);
