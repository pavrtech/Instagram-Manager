import "package:flutter/material.dart";

class downloadPage extends StatefulWidget {
  const downloadPage({super.key});

  @override
  State<downloadPage> createState() => _downloadPageState();
}

class _downloadPageState extends State<downloadPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        leading: Icon(Icons.arrow_back_ios),
        title: Text(
          'Downloads',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.normal),
        ),
      ),
      body: GridView.builder(
          itemCount: 5,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 300,
                width: 80,
                //color: Colors.blue,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue),
              ),
            );
          }),
    );
  }
}

