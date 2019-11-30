import 'package:flutter/material.dart';

class FFContactAvatarTheme {
  final Color backgroundColor;
  final Color foregroundColor;
  final Color badgeColor;
  final double avatarRadius;
  final TextStyle initialsTextStyle;
  final TextStyle nameTextStyle;
  final TextStyle messageTextStyle;
  final double verticalPadding;
  final double avatarElevation;
  final double itemExtent;
  final EdgeInsets listPadding;

  FFContactAvatarTheme({
    this.backgroundColor = Colors.blueGrey,
    this.foregroundColor = Colors.white,
    this.badgeColor = Colors.red,
    this.avatarRadius = 31,
    this.initialsTextStyle = kInitialTextStyle,
    this.nameTextStyle = kNameTextStyle,
    this.messageTextStyle = kMessageTextStyle,
    this.verticalPadding = 2,
    this.avatarElevation = 4,
    this.itemExtent = 80,
    this.listPadding = kListPadding,
  });

  static const TextStyle kInitialTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 26,
    letterSpacing: 1.4,
  );

  static const TextStyle kNameTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 13.0,
  );

  static const TextStyle kMessageTextStyle = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 11.0,
  );

  static const EdgeInsets kListPadding = EdgeInsets.all(16.0);

  static final FFContactAvatarTheme defaultTheme = FFContactAvatarTheme(
    backgroundColor: Colors.blueGrey,
    foregroundColor: Colors.white,
    badgeColor: Colors.red,
    avatarRadius: 31,
    initialsTextStyle: kInitialTextStyle,
    nameTextStyle: kNameTextStyle,
    messageTextStyle: kMessageTextStyle,
    verticalPadding: 2,
    avatarElevation: 4,
    itemExtent: 80,
    listPadding: kListPadding,
  );
}
