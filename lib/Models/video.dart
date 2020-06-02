import 'package:flutter/material.dart';
import 'package:youtubeapp/Models/channel.dart';

class Video {
  AssetImage thumbnail;
  int viewCount;
  DateTime uploadDate;
  String videoTitle;
  Channel channel;

  Video(AssetImage thumbnail, int viewCount, DateTime uploadDate,
      String videoTitle, Channel channel) {
    this.thumbnail = thumbnail;
    this.viewCount = viewCount;
    this.uploadDate = uploadDate;
    this.videoTitle = videoTitle;
    this.channel = channel;
  }

  String getViewCount() {
    String viewString = this.viewCount.toString();
    String value = '';
    if (viewString.length >= 10) {
      value = 'B';
      viewString = compressViews([11, 12], viewString);
    } else if (viewString.length >= 7) {
      value = 'M';
      viewString = compressViews([8, 9], viewString);
    } else if (viewString.length >= 4) {
      value = 'K';
      viewString = compressViews([5, 6], viewString);
    }
    return viewString + value;
  }

  String compressViews(List<int> numbers, String viewString) {
    if (viewString.length == numbers[0]) {
      viewString = viewString.substring(0, 3);
    } else if (viewString.length == numbers[1]) {
      viewString = viewString.substring(0, 2);
    } else {
      String newString = viewString.substring(0, 1);
      viewString = newString + "." + viewString.substring(1, 2);
    }
    return viewString;
  }

  String getTimeSinceUpload() {
    return this.uploadDate.toString();
  }
}
