import 'package:flutter/material.dart';
import 'package:star_wars/charecter_list_wiev.dart';

class RoteModel extends StatefulWidget {
  const RoteModel({super.key});

  @override
  State<RoteModel> createState() => _RoteModelState();
}

class _RoteModelState extends State<RoteModel> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        setState(() {
          Navigator.of(context).push(PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return CharecterList();
            },
          ));
        });
      },
      child:
          Text('Continue', style: TextStyle(color: Colors.red, fontSize: 60)),
    );
  }
}
