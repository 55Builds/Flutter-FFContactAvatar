import 'package:flutter/material.dart';
import 'ff_contact_avatar.dart';
import 'ff_contact_avatar_model.dart';

typedef void FFContactAvatarListSelected(int index);

class FFContactAvatarList extends StatelessWidget {
  final List<FFContactAvatarModel> models;
  final Axis scrollDirection;
  final FFContactAvatarTheme theme;
  final FFContactAvatarListSelected onSelectAvatar;

  FFContactAvatarList({
    this.models,
    this.scrollDirection,
    this.theme,
    this.onSelectAvatar,
  });

  static StatelessWidget fromModelList(
    List<FFContactAvatarModel> models, {
    Axis scrollDirection = Axis.horizontal,
    FFContactAvatarListSelected onSelectAvatar,
  }) {
    return FFContactAvatarList(
      models: models,
      scrollDirection: scrollDirection,
      theme: FFContactAvatarTheme.defaultTheme,
      onSelectAvatar: onSelectAvatar,
    );
  }

  static StatelessWidget fromModelListWithBuilder(
    List<FFContactAvatarModel> models, {
    Axis scrollDirection = Axis.horizontal,
    FFContactAvatarListSelected onSelectAvatar,
    @required BuildContext context,
  }) {
    FFContactAvatarTheme theme = FFContactAvatarTheme.defaultTheme;

    return ListView.builder(
      scrollDirection: scrollDirection,
      itemCount: models.length,
      itemBuilder: (context, index) {
        return models[index].asContactAvatar(
          FFContactAvatarTheme.defaultTheme,
          onTap: () {
            onSelectAvatar(index);
          },
        );
      },
      itemExtent: theme.itemExtent,
      padding: theme.listPadding,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: scrollDirection,
      itemExtent: theme.itemExtent,
      padding: theme.listPadding,
      children: models.map((model) {
        var index = models.indexOf(model);
        return model.asContactAvatar(
          theme,
          onTap: () {
            onSelectAvatar(index);
          },
        );
      }).toList(),
    );
  }
}
