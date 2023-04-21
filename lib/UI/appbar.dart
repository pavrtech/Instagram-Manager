import "package:flutter/material.dart";

import "../screen/HomePage.dart";

class appBar extends StatefulWidget {
  const appBar({super.key});

  @override
  State<appBar> createState() => _appBarState();
}

class _appBarState extends State<appBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.deepPurple.shade300,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text("Insta Utility",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 16.0,
                      )),
                  //backgroundColor: Colors.deepPurple.shade300,
                  background: Image.asset(
                    "assets/instagram-hex-colors-gradient-background.png",
                    fit: BoxFit.cover,
                  )),
            ),
          ];
        },
        body: Home(),
      ),
    );
  }
}
