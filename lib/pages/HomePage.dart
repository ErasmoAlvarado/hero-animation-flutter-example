import 'package:flutter/material.dart';
import 'dart:math' as math;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Hero Example'),
        ),
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            Color tileColor = RamdonColor();
            return AvatarTile(context, index, tileColor);
          },
        ));
  }

  Widget AvatarTile(BuildContext context, int index, Color tilecolor) {
    return ListTile(
      leading: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Scaffold(
                      body: Center(
                        child: Hero(
                          tag: 'e$index',
                          child: Container(
                            height: 300,
                            width: 400,
                            color: tilecolor,
                          ),
                        ),
                      ),
                    )),
          );
        },
        child: Hero(
          tag: 'e$index',
          child: CircleAvatar(
            backgroundColor: tilecolor,
          ),
        ),
      ),
      title: Text("hello world ${index + 1}"),
      subtitle: Text("goodbye world ${index + 1}"),
    );
  }
}

Color RamdonColor() {
  return Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
      .withOpacity(1.0);
}
