import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_morty_v2/providers/character_provider.dart';
import 'package:rick_morty_v2/providers/character_provider2.dart';
import '../widgets/image_viewer.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    final receivedData = ref.watch(characterListProvider);
    return receivedData.when(
      skipLoadingOnReload: false,
      loading: () {
        return const Scaffold( body :Center(child: CircularProgressIndicator()));
      },
      error: (error, stack){
        return Scaffold(
          body: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'There is an error${error.toString()}',
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                  ElevatedButton(onPressed: (){
                    ref.read(characterListProvider.notifier).fetchData();
                  }, child: const Text('Retry'))
                  // OutlinedButton(
                  //     onPressed: fetchData, child: const Text('Retry'))
                ],
              )),
        );
      },
      data: (characters) {
        return  ListView.builder(
          itemCount: characters.length ,
          itemBuilder: (BuildContext context, int index) {

            // if (index == characters!.length && isLoadingMore) {
            //   return const Padding(
            //     padding: EdgeInsets.all(16.0),
            //     child: Center(
            //       child: CircularProgressIndicator(),
            //     ),
            //   );
            // }
            return Card(
              color: const Color.fromRGBO(108, 112, 112, 100),
              child: Row(mainAxisSize: MainAxisSize.max, children: [
                const SizedBox(width: 10),
                Container(
                    width: MediaQuery.of(context).size.width / 2.4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(80)),
                    child: ImageViewer(url: characters[index].image)),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      Text((characters[index].id).toString()),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/charDetails',
                              arguments: characters[index].url);
                        },
                        child: Text(
                          characters[index].name,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor:
                            (characters[index].status == "unknown")
                                ? Colors.white54
                                : (characters[index].status == "Alive")
                                ? Colors.green
                                : Colors.red,
                            radius: 6,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: Text(
                              '${characters[index].status} - ${characters[index].species}',
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Last Known Location :',
                        style: TextStyle(color: Colors.grey),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/locationDetails',
                              arguments: characters[index].location.url);
                        },
                        child: Text(characters[index].location.name,
                            style: const TextStyle(color: Colors.white)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text('First Seen in :',
                          style: TextStyle(color: Colors.grey)),
                      Text(characters[index].origin.name,
                          style: const TextStyle(color: Colors.white)),
                      const SizedBox(
                        height: 5,
                      )
                    ],
                  ),
                ),
              ]),
            );
          },
        );
      },
    );
  }
}
