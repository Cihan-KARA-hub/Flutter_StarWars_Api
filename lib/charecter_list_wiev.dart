import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:star_wars/data_Models/character_models.dart';

class CharecterList extends StatefulWidget {
  const CharecterList({Key? key}) : super(key: key);

  @override
  _CharacterListState createState() => _CharacterListState();
}

class _CharacterListState extends State<CharecterList> {
  List<Character>? _items;
  final _baseUrl = 'https://swapi.dev/api/people/';
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
          _items = datas.map((e) => Character.fromJson(e)).toList();
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
          centerTitle: true,
          title: const Text('Star Wars Characters'),
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
                          child: Placeholder(),
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
                                _items?[index].name ?? '',
                                style: const TextStyle(fontSize: 20),
                              ),
                              Text(
                                _items?[index].birthYear ?? '',
                                style: const TextStyle(fontSize: 20),
                              ),
                              Text(
                                _items?[index].skinColor ?? '',
                                style: const TextStyle(fontSize: 20),
                              ),
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
                                _items?[index].height ?? '',
                                style: const TextStyle(fontSize: 20),
                              ),
                              Text(
                                _items?[index].gender ?? '',
                                style: const TextStyle(fontSize: 20),
                              ),
                              Text(
                                _items?[index].mass ?? '',
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
