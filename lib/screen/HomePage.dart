import 'dart:convert';
import 'dart:io';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import "package:flutter/material.dart";
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'ReelDownload.dart';
import 'about.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Controller for updating imageId variable when user enter text.

  final myController = TextEditingController();
  late String imageId;
  @override
  void initState() {
    super.initState();
    myController.addListener(() {
      imageId = myController.text;
    });
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  /*
                Handing reels urls
  ----- reelUrl will container the reel url return by api;
  ----- apiUrl will contain our basic api url;
  ----- responseUrl will contain apiUrl + reelId;
   */

  dynamic reelUrl;

  String apiUrl =
      "https://us-central1-instareelsdownloader-76cc1.cloudfunctions.net/api/insta?id=";

  String responseUrl = "";

  Future<String> callApi(String imageId) async {
    responseUrl = apiUrl + imageId;
    final response = await http.get(
      Uri.parse(responseUrl),
    );
    print(responseUrl);
    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      print(responseBody["videos"][0]["url"]);
      reelUrl = responseBody["videos"][0]["url"];
      print(reelUrl);
      return (reelUrl);
    } else {
      return ("Error: ${response.statusCode} ${response.reasonPhrase}");
    }
  }

  void navigateToNewPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => VideoDownloader(
                videoUrl: reelUrl,
                name: "$imageId.mp4",
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      //drawer: NavDrawer(),
      appBar: AppBar(
        title: Text(
          "INST NXT",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NavDrawer()),
            ); /* Write listener code here */
          },
          child: Icon(
            Icons.menu, // add custom icons also
          ),
        ),
        toolbarHeight: 90,
      ),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 10,
            ),
            Center(
              child: Container(
                height: 200,
                width: 390,

                // width: 200,

                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color.fromRGBO(226, 68, 123, 1),
                        Color.fromRGBO(87, 106, 230, 1),
                      ],
                    )

                    //color: Colors.blue,
                    /*image: Image.asset(
                        "assets/instagram-hex-colors-gradient-background.png")*/
                    ),
                child: Column(
                  children: [
                    Container(
                      height: 50,
                    ),
                    Text(
                      "Unlock the full potential of Instagram with",
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      "just a tap - download reels, stories, and",
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      "browse profiles like a pro with our cutting",
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      "-edge app.",
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 40,
            ),
            Container(
              padding: const EdgeInsets.all(2.0),
              margin: const EdgeInsets.all(10.0),
              child: TextField(
                controller: myController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      //color: Colors.deepPurple,
                      color: Colors.grey,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  labelText: "Paste Link Here.............",
                ),
              ),
            ),
            Container(
              height: 40,
            ),
            /*ElevatedButton(
              onPressed: () async {
                await callApi(imageId);
                navigateToNewPage(context);
              },
              //child: Text("Download Reel"),
              style: ElevatedButton.styleFrom(
                primary: Colors.deepPurple,
                onPrimary: Colors.white,
                elevation: 10, // Elevation
                shadowColor: Colors.deepPurpleAccent, // Shadow Color
              ),
              child: const Text(
                'Download Reel',
                style: TextStyle(fontSize: 18),
              ),
            ),*/
            Center(
              child: Container(
                height: 50,
                width: 370,
                child: ElevatedButton.icon(
                  label: Text("Click here to Download",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  icon: Icon(
                    Icons.download,
                    size: 35,
                  ),
                  onPressed: () async {
                    await callApi(imageId);
                    navigateToNewPage(context);
                  },
                  //child: Text("Download Reel"),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(87, 106, 230, 1),
                    onPrimary: Colors.white,
                    elevation: 10, // Elevation
                    shadowColor: Colors.black, // Shadow Color
                  ),
                  /*child: const Text(
                    'Click here to Download',
                    style: TextStyle(fontSize: 18),
                  ),*/
                ),

                // width: 200,
                /*
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.blue,
                ),*/

                //child: Text("   \n  Here"),
              ),
            ),
            Container(
              height: 40,
            ),
            Center(
                child: Row(
              children: [
                Container(
                  width: 5,
                ),
                Container(
                    height: 50,
                    width: 185,
                    child: ElevatedButton.icon(
                      label: Text("How To Use",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      icon: Icon(
                        Icons.help,
                        size: 35,
                      ),
                      onPressed: () {},
                      //child: Text("Download Reel"),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(185, 99, 100, 1),
                        onPrimary: Colors.white,
                        elevation: 10, // Elevation
                        shadowColor: Colors.black, // Shadow Color
                      ),
                      /*child: const Text(
                        'Click here to Download',
                        style: TextStyle(fontSize: 18),
                      ),*/
                    )),
                Container(
                  width: 10,
                ),
                Container(
                    height: 50,
                    width: 185,
                    child: ElevatedButton.icon(
                      label: Text("DP Downloader",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      icon: Icon(
                        Icons.person_2_outlined,
                        size: 35,
                      ),
                      onPressed: () {},
                      //child: Text("Download Reel"),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(185, 167, 117, 1),
                        onPrimary: Colors.white,
                        elevation: 10, // Elevation
                        shadowColor: Colors.black, // Shadow Color
                      ),
                      /*child: const Text(
                        'Click here to Download',
                        style: TextStyle(fontSize: 18),
                      ),*/
                    )),
                Container(
                  width: 5,
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
