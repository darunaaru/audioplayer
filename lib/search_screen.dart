import 'package:flutter/material.dart';


class SearchScreen extends StatelessWidget {

  List<String> images = [
    "https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png",
    "https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png",
    "https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png",
    "https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png"
    "https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png"
    "https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png"
    "https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.all(12.0),
            child: GridView.builder(
              itemCount: images.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0
              ),
              itemBuilder: (BuildContext context, int index){
                return Image.network(images[index]);
              },
            )),
    );
  }
}
