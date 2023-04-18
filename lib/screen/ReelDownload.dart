import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class VideoDownloader extends StatefulWidget {
  late String videoUrl;
  late String name;
  VideoDownloader({Key? key, required this.videoUrl, required this.name})
      : super(key: key);

  @override
  VideoDownloaderState createState() => VideoDownloaderState();
}

class VideoDownloaderState extends State<VideoDownloader> {
  bool _isDownloading = false;
  String _progressString = '0';
  String buttonLabel = "Download Video";
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
              child: Text(buttonLabel),
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
      const directory = "/storage/emulated/0/Download";
      String videoPath = '$directory/$videoName';

      await dio.download(widget.videoUrl, videoPath,
          onReceiveProgress: (receivedBytes, totalBytes) {
        if (totalBytes != -1) {
          setState(() {
            _progressString =
                '${((receivedBytes / totalBytes) * 100).toStringAsFixed(0)}% downloaded';
          });
        }
      });
      setState(() {
        _isDownloading = false;
        _progressString = 'Video downloaded successfully!';
        buttonLabel = "Completed";
      });
    } catch (e) {
      setState(() {
        _isDownloading = false;
        _progressString = 'Error downloading video.';
        buttonLabel = "Retry";
      });
    }
  }
}
