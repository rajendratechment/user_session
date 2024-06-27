import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../network/Server.dart';
import '../network/model/Album.dart';

class HomeScreen extends StatelessWidget {
  final String title;

  const HomeScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    var server = context.read<Server>();
    Future<Album> apiForAlum = server.fetchSingleAlbum();
    Future<List<Album>> apiForAlumList = server.fetchListAlbum();
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: FutureBuilder<List<Album>>(
          future: apiForAlumList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                  padding: const EdgeInsets.all(8),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 50,
                      color: Colors.amber[100],
                      child: Center(child: Text('[${snapshot.data?[index].id}] ${snapshot.data?[index].title}')),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) => const Divider(),
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ));
  }
}
