import 'dart:convert';
import 'dart:io';
import "package:flutter/material.dart";
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'ReelDownload.dart';

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
      appBar: AppBar(
        title: const Text("Reel Downloader"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(2.0),
              margin: const EdgeInsets.all(10.0),
              child: TextField(
                controller: myController,
                decoration: const InputDecoration(
                  labelText: "Enter the reel id",
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                await callApi(imageId);
                navigateToNewPage(context);
              },
              child: Text("Download Reel"),
            ),
          ],
        ),
      ),
    );
  }
}
