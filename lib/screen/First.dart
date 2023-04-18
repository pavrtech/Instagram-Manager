import 'dart:convert';
import 'dart:io';
import "package:flutter/material.dart";
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'Second.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String imageId;
  String apiUrl =
      "https://us-central1-instareelsdownloader-76cc1.cloudfunctions.net/api/insta?id=CqdJBLgD8lO";

  String? responseurl;
  Future<String> callApi() async {
    final response = await http.get(
      Uri.parse(apiUrl),
    );

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      print(responseBody["videos"][0]["url"]);
      responseurl = responseBody["videos"][0]["url"];
      return (responseBody["videos"][0]["url"]);
    } else {
      return ("Error: ${response.statusCode} ${response.reasonPhrase}");
    }
  }

  Future<void> downloadVideo(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      final bytes = response.bodyBytes;
      final dir = await getApplicationDocumentsDirectory();
      final file = File('${dir.path}/video.mp4');
      await file.writeAsBytes(bytes);
    } catch (e) {
      print('Error downloading video: $e');
    }
  }

  void navigateToNewPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => VideoDownloader(
                videoUrl: "http://bit.ly/3KIWzdm",
                name: imageId,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Heeeelllloooo"),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              navigateToNewPage(context);
            },
            child: Text('Go to new page'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          print("skldlknf"),
        },
      ),
    );
  }
}
