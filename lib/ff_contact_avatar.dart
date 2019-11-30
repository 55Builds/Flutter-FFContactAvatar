library flutter_ff_contact_avatar;

import 'package:flutter/material.dart';
import 'dart:math' show min;

import 'package:ff_contact_avatar/ff-contact-avatar-theme.dart';
export 'package:ff_contact_avatar/ff-contact-avatar-theme.dart';

// ignore: must_be_immutable
class FFContactAvatar extends StatelessWidget {
  final Image image;
  final String name;
  final String message;
  final bool showBadge;

  FFContactAvatarTheme theme;

  FFContactAvatar({
    FFContactAvatarTheme theme,
    this.image,
    this.name,
    this.message,
    this.showBadge = false,
  }) {
    this.theme = (theme == null) ? FFContactAvatarTheme.defaultTheme : theme;
  }

  static const double avatarRadius = 31;

  String _getInitials() {
    var nameParts = name.split(" ").map((elem) {
      return elem[0];
    });

    if (nameParts.length == 0) {
      return "";
    }

    int numberOfParts = min(2, nameParts.length);
    return nameParts.join().substring(0, numberOfParts);
  }

  CircleAvatar _makeImageAvatar() {
    return CircleAvatar(
      radius: avatarRadius,
      backgroundImage: this.image.image,
    );
  }

  CircleAvatar _makeInitialsAvatar() {
    return CircleAvatar(
      radius: avatarRadius,
      child: Text(
        _getInitials(),
        style: theme.initialsTextStyle,
      ),
      backgroundColor: theme.backgroundColor,
      foregroundColor: theme.foregroundColor,
    );
  }

  Widget _makeCircleAvatar() {
    CircleAvatar ca =
        (image != null) ? _makeImageAvatar() : _makeInitialsAvatar();

    Color badgeColor = showBadge ? theme.badgeColor : Colors.transparent;

    return Material(
      elevation: theme.avatarElevation,
      borderRadius: BorderRadius.circular(avatarRadius),
      child: Stack(
        children: <Widget>[
          ca,
          Positioned(
            top: 1,
            right: 1,
            width: 16,
            height: 16,
            child: Container(
              decoration: BoxDecoration(
                color: badgeColor,
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox _makePadding() {
    return SizedBox(
      height: theme.verticalPadding,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _makeCircleAvatar(),
        _makePadding(),
        Text(
          name,
          style: theme.nameTextStyle,
        ),
        _makePadding(),
        Text(
          message,
          style: theme.messageTextStyle,
        ),
      ],
    );
  }
}
