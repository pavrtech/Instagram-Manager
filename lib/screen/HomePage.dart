import 'dart:convert';
import "package:flutter/material.dart";
import 'package:http/http.dart' as http;
import 'package:sweet_nav_bar/sweet_nav_bar.dart';
import 'ReelDownload.dart';
import 'about.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Widget> _items = [
    const Text('Home'),
    const Text('Business'),
    const Text('School'),
  ];

  int cIndex = 0;
  final iconLinearGradiant = List<Color>.from([
    const Color.fromARGB(255, 251, 2, 197),
    const Color.fromARGB(255, 72, 3, 80)
  ]);

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
    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      reelUrl = responseBody["videos"][0]["url"];
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
      appBar: AppBar(
        title: const Text(
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
          child: const Icon(
            Icons.menu, // add custom icons also
          ),
        ),
        toolbarHeight: 90,
      ),
      bottomNavigationBar: SweetNavBar(
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.8),
              blurRadius: 10,
              offset: const Offset(0, 5))
        ],
        paddingGradientColor: const LinearGradient(colors: [
          Color.fromARGB(255, 72, 3, 80),
          Color.fromARGB(255, 72, 3, 80)
        ]),
        currentIndex: cIndex,
        paddingBackgroundColor: Colors.transparent,
        items: [
          SweetNavBarItem(
              sweetActive: const Icon(Icons.home),
              sweetIcon: const Icon(
                Icons.home_outlined,
              ),
              sweetLabel: 'Home',
              iconColors: iconLinearGradiant,
              sweetBackground: Colors.red),
          SweetNavBarItem(
              sweetIcon: const Icon(Icons.download), sweetLabel: 'Business'),
          SweetNavBarItem(
              sweetIcon: const Icon(Icons.person_2), sweetLabel: 'School'),
        ],
        onTap: (index) {
          setState(() {
            cIndex = index;
          });
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 10,
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                height: 200,
                width: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.grey.shade300,
                    width: 0.5,
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50.0,
                    ),
                    GradientText(
                      "Unlock the full potential of Instagram",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 21.5,
                      ),
                      colors: const [
                        Colors.blue,
                        Colors.red,
                        Colors.teal,
                        Colors.purple,
                      ],
                    ),
                    const Text(
                      "with just a tap-download reels,",
                      style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      "stories, and browse profiles like ",
                      style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    const Text(
                      "with our cutting-edge app.",
                      style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
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
                      borderSide: const BorderSide(
                        //color: Colors.deepPurple,
                        color: Colors.grey,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    hintText: "Paste the link here"),
              ),
            ),
            Container(
              height: 40,
            ),
            Center(
              child: SizedBox(
                height: 50,
                width: 370,
                child: ElevatedButton.icon(
                  label: const Text("Click here to Download",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  icon: const Icon(
                    Icons.download,
                    size: 35,
                  ),
                  onPressed: () async {
                    await callApi(imageId);
                    navigateToNewPage(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromRGBO(87, 106, 230, 1),
                    onPrimary: Colors.white,
                    elevation: 10, // Elevation
                    shadowColor: Colors.black, // Shadow Color
                  ),
                ),
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
                      label: const Text("How To Use",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      icon: const Icon(
                        Icons.help,
                        size: 35,
                      ),
                      onPressed: () {},
                      //child: Text("Download Reel"),
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromRGBO(185, 99, 100, 1),
                        onPrimary: Colors.white,
                        elevation: 10, // Elevation
                        shadowColor: Colors.black, // Shadow Color
                      ),
                    )),
                Container(
                  width: 10,
                ),
                SizedBox(
                    height: 50,
                    width: 185,
                    child: ElevatedButton.icon(
                      label: const Text("DP Downloader",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      icon: const Icon(
                        Icons.person_2_outlined,
                        size: 35,
                      ),
                      onPressed: () {},
                      //child: Text("Download Reel"),
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromRGBO(185, 167, 117, 1),
                        onPrimary: Colors.white,
                        elevation: 10, // Elevation
                        shadowColor: Colors.black, // Shadow Color
                      ),
                    )),
                const SizedBox(
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
