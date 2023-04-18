import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class VideoDownloader extends StatefulWidget {
  final String videoUrl;
  final String name;
  VideoDownloader({Key? key, required this.videoUrl, required this.name})
      : super(key: key);

  @override
  _VideoDownloaderState createState() => _VideoDownloaderState();
}

class _VideoDownloaderState extends State<VideoDownloader> {
  bool _isDownloading = false;
  late String _progressString = "1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Downloader'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_isDownloading)
              const CircularProgressIndicator(
                value: null,
              ),
            if (_progressString != null) Text(_progressString),
            ElevatedButton(
              onPressed: () {
                downloadVideo();
              },
              child: Text('Download Video'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> downloadVideo() async {
    Dio dio = Dio();
    setState(() {
      _isDownloading = true;
      _progressString = 'Downloading video...';
    });

    try {
      String videoName = widget.name;
      final directory = "/storage/emulated/0/Download/";
      String videoPath = '$directory/$videoName';

      print(videoPath);
      // final appDocDir = await getExternalStorageDirectory();
      // Directory appDocDir = await getExternalStorageDirectory();
      // String appDocPath = appDocDir.path;
      // String videoPath = '$appDocPath/$videoName';
      await dio.download(widget.videoUrl, videoPath,
          onReceiveProgress: (receivedBytes, totalBytes) {
        if (totalBytes != -1) {
          setState(() {
            _progressString =
                '${((receivedBytes / totalBytes) * 100).toStringAsFixed(0)}% downloaded';
            print(_progressString);
          });
        }
      });
      setState(() {
        _isDownloading = false;
        _progressString = 'Video downloaded successfully!';
        print(_progressString);
      });
    } catch (e) {
      setState(() {
        _isDownloading = false;
        _progressString = 'Error downloading video.';
      });
      print(e);
    }
  }
}
