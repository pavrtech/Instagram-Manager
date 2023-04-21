import "package:flutter/material.dart";

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey[200],
      appBar: AppBar(
        toolbarHeight: 90,
        leading: Icon(Icons.arrow_back_ios),
        //backgroundColor: Colors.blue.shade500,
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 50,
          ),
          /*Container(
            height: 250,
            width: 600,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.lightBlueAccent],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/profile.png'),
                ),
                SizedBox(height: 10),
                Text(
                  'John Doe',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'john.doe@example.com',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),*/
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text(
                      'Settings',
                      style: TextStyle(
                        fontSize: 22,
                        //color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {},
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.favorite, color: Colors.red),
                    title: Text(
                      'Follow us',
                      style: TextStyle(
                        fontSize: 22,
                        //color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {},
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.info, color: Colors.black),
                    title: Text(
                      'About us',
                      style: TextStyle(
                        fontSize: 22,
                        //color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {},
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.star, color: Colors.yellow.shade400),
                    title: Text(
                      'Feedback',
                      style: TextStyle(
                        fontSize: 22,
                        //color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {},
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.share, color: Colors.blue),
                    title: Text(
                      'Share',
                      style: TextStyle(
                        fontSize: 22,
                        // color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {},
                  ),
                  Divider()
                ],
              ),
            ),
          ),
          Container(
            height: 5,
          ),
          Column(
            children: [
              Text("Created With "),
              Icon(
                Icons.favorite,
                color: Colors.red,
              ),
              Text("By"),
              Container(
                  height: 150,
                  child: Image.asset("assets/images/PAVR_logo.png")),
              Container(
                height: 50,
              ),
            ],
          )
        ],
      ),
    );
  }
}


