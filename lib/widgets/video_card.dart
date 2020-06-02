import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtubeapp/Models/video.dart';
import 'package:youtubeapp/constants/text_styles.dart';

class VideoCard extends StatelessWidget {
  VideoCard({this.video});

  final Video video;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      child: Column(
        children: <Widget>[
          Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: video.thumbnail,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, top: 10, bottom: 10),
            child: Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      height: 35.0,
                      child: CircleAvatar(
                        backgroundImage: video.channel.profilePicture,
                      ),
                    ),
                    Container()
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'video title',
                        style: videoTitleStyle,
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Text(
                              video.channel.channelName,
                              style: videoInfoStyle,
                            ),
                            Text(
                              '.',
                              style: videoInfoStyle,
                            ),
                            Text(
                              '12k' + ' views',
                              style: videoInfoStyle,
                            ),
                            Text(
                              '.',
                              style: videoInfoStyle,
                            ),
                            Text(
                              '2hrs' + ' ago',
                              style: videoInfoStyle,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
