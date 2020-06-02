import 'package:flutter/material.dart';
import 'package:youtubeapp/Models/video.dart';
import 'package:youtubeapp/constants/colors.dart';
import 'package:youtubeapp/constants/text_styles.dart';
import 'widgets/video_card.dart';
import 'package:youtubeapp/Models/channel.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  Container(
                    width: 40,
                    child: Image(
                      image: AssetImage("assets/youtube_logo.png"),
                    ),
                  ),
                  Text(
                    "YouTube",
                    style: youtube,
                  ),
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.only(left: 100, bottom: 15),
                width: 260,
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Icon(Icons.videocam),
                      Icon(Icons.search),
                      Container(
                        height: 30,
                        width: 30,
                        child: CircleAvatar(
                            backgroundImage: channel.profilePicture),
                      )
                    ],
                  ),
                )),
          ],
          backgroundColor: tabBarColor,
        ),
        body: TabBarView(
          children: <Widget>[
            Container(
              color: backgroundColor,
              child: ListView(
                children: getVideos(false),
              ),
            ),
            Container(
              color: Colors.orange,
            ),
            Container(
              color: Colors.red,
            ),
            Container(
              color: Colors.green,
            ),
            Container(
              color: Colors.blueAccent,
            ),
          ],
        ),
        bottomNavigationBar: TabBar(
          labelStyle: tabTextStyle,
          tabs: tabList,
          labelColor: tabBarSelectedIconsColor,
          unselectedLabelColor: tabBarUnselectedIconsColor,
          indicatorColor: Colors.transparent,
        ),
        backgroundColor: tabBarColor,
      ),
    );
  }

  List<Widget> getVideos(bool isSUbscriptionPage) {
    List<Video> videos = makeVideos();
    List<Widget> cards = [];
    cards.add(
      Container(
        color: Colors.blue,
        height: 140.0,
      ),
    );
    for (Video video in videos) {
      cards.add(
        VideoCard(
          video: video,
        ),
      );
    }
    return cards;
  }

  Channel channel =
      new Channel("Kalle Hallden", AssetImage("assets/profilepics/5.jpg"));

  List<String> videoTitles = [
    "One Day Builds: YouTube Clone With FLutter!",
    "How To Get Started In Game Development",
    "I Practiced Touch Typing Every Day For 30 Days",
    "How To Overcome Coders Block",
    "Super Quick Python Project Ideas For Beginners!",
  ];

  List<Video> makeVideos() {
    List<Video> vids = [];
    for (int i = 0; i < 5; i++) {
      vids.add(
        new Video(
          AssetImage("assets/thumbnails/" + i.toString() + ".jpg"),
          120000,
          DateTime.now().subtract(
            new Duration(days: 400),
          ),
          videoTitles[i],
          channel,
        ),
      );
    }
    return vids;
  }

  List<Widget> tabList = [
    Tab(
      icon: Icon(Icons.home),
      text: 'Home',
    ),
    Tab(
      icon: Icon(Icons.explore),
      text: 'Explore',
    ),
    Tab(
      icon: Icon(Icons.subscriptions),
      text: 'Subscriptions',
    ),
    Tab(
      icon: Icon(Icons.email),
      text: 'Inbox',
    ),
    Tab(
      icon: Icon(Icons.video_library),
      text: 'Library',
    ),
  ];
}
