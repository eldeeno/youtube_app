import 'package:flutter/material.dart';

class Channel {
  String channelName;
  AssetImage profilePicture;

  Channel(String channelName, AssetImage profilePicture) {
    this.channelName = channelName;
    this.profilePicture = profilePicture;
  }
}
