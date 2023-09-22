import 'package:flutter/material.dart';

import 'package:star_wars/Starships_view.dart';
import 'package:star_wars/FilmsView_view.dart';

import 'package:star_wars/charecter_list_wiev.dart';
import 'package:star_wars/planets_view.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Container(
              height: 1000,
              child: Image.asset(
                "lib/assets/welcome.gif",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 100,
            child: Padding(
                padding: EdgeInsets.only(top: 40),
                child: ColoredBox(
                    color: Colors.black,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _goTextButton('Characters', 0),
                          _goTextButton('planets', 1),
                          _goTextButton('Starships', 2),
                          _goTextButton('Films', 3),
                        ]))),
          )
        ],
      ),
    );
  }

  TextButton _goTextButton(String text, int i) {
    return TextButton(
      onPressed: () {
        setState(() {
          Navigator.of(context).push(PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return _catagory[i];
            },
          ));
        });
      },
      child: Text('$text',
          style: const TextStyle(
            color: Colors.red,
            fontSize: 16,
          )),
    );
  }

  List _catagory = [
    CharecterList(),
    PlanetsView(),
    StarshipsView(),
    FilmsView(),
  ];
}
