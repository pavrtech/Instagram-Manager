import "package:curved_navigation_bar/curved_navigation_bar.dart";
import "package:flutter/material.dart";
import "package:reeldownloader/UI/appbar.dart";
import "package:reeldownloader/screen/HomePage.dart";

class navBar extends StatefulWidget {
  const navBar({super.key});

  @override
  State<navBar> createState() => _navBarState();
}

class _navBarState extends State<navBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color.fromRGBO(87, 106, 230, 1),
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.transparent,
          color: Color.fromRGBO(89, 102, 221, 1),
          //buttonBackgroundColor: Colors.deepPurpleAccent,
          animationDuration: Duration(milliseconds: 300),
          items: [
            Icon(
              Icons.home,
            ),
            Icon(Icons.download),
            Icon(Icons.person_2),
          ]),
      body: Home(),
    );
  }
}
