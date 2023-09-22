import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:star_wars/data_Models/flims_model.dart';

class FilmsView extends StatefulWidget {
  const FilmsView({super.key});

  @override
  State<FilmsView> createState() => _VehiclesView();
}

class _VehiclesView extends State<FilmsView> {
  List<Film>? _items;
  final _baseUrl = 'https://swapi.dev/api/films/';
  late final Dio dio;

  @override
  void initState() {
    super.initState();
    dio = Dio();
    fetchItem();
  }

  Future<void> fetchItem() async {
    final response = await dio.get(_baseUrl);
    if (response.statusCode == HttpStatus.ok) {
      final datas = response.data["results"];
      if (datas is List) {
        setState(() {
          _items = datas.map((e) => Film.fromJson(e)).toList();
        });
        if (kDebugMode) {
          print(_items?.length ?? -1);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Star Wars Vehicles'),
          centerTitle: true,
        ),
        body: _items == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: _items?.length,
                itemBuilder: (context, index) {
                  return Column(
                    verticalDirection: VerticalDirection.down,
                    children: [
                      const Card(
                        margin: EdgeInsets.all(30),
                        child: SizedBox(
                          height: 300,
                          width: 300,
                          child: Placeholder(
                              child: Text(
                            'Image',
                            style: TextStyle(color: Colors.red, fontSize: 35),
                          )),
                        ),
                      ),
                      Card(
                          margin: EdgeInsets.all(20),
                          color: Color.fromARGB(255, 0, 0, 0),
                          borderOnForeground: true,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "Flims: ${_items?[index].title ?? ''}",
                                style: const TextStyle(fontSize: 20),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text("episode: ${_items?[index].episodeId ?? ''}",
                                  style: const TextStyle(fontSize: 20),
                                  overflow: TextOverflow.ellipsis),
                            ],
                          )),
                      Card(
                          margin: EdgeInsets.all(20),
                          color: Color.fromARGB(255, 0, 0, 0),
                          borderOnForeground: true,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "Date:${_items?[index].releaseDate ?? ''}",
                                overflow: TextOverflow.clip,
                                style: const TextStyle(fontSize: 20),
                              ),
                            ],
                          )),
                      Container(
                        height: 1,
                        width: 312,
                        color: Colors.red,
                      )
                    ],
                  );
                },
              ));
  }
}
