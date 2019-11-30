# ff_contact_avatar
A highly configurable Column widget for displaying a contact avatar with name and short message.  Library also includes the ability the create a ListView using the FFContactAvatarList Widget or using the convenience functions `fromModelList` (to create a ListView directly, suited to a small number or items) and `fromModelListWithBuilder` (to create a ListView using the .builder approach, suited to a large number of items).


![](demo.png)

## Add dependency
```
dependencies:
  ff_contact_avatar: ^0.1.1
```

## Basic use (Single Avatar item)
To manually configure each item, simply create FFContactAvatar objects using the approach below...
```
import 'package:flutter/material.dart';
import 'package:ff_contact_avatar/ff_contact_avatar.dart';
...
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FFContactAvatar(
              name: 'Ed Roberts',
              message: 'He\'s a man',
              showBadge: true,
            ),
            SizedBox(height: 10),
            FFContactAvatar(
              name: 'Mr Ed',
              message: 'He\'s a horse',
              image: Image.network(
                  '<URL of file here or swap for Image.asset(...)'),
              showBadge: true,
            ),
          ],
        ),
      ),
    );
```

## Basic use with Theme
To use a specific theme for each item, specifying it using the inline option below...
```
...
            FFContactAvatar(
              name: 'Ed Roberts',
              message: 'He\'s a man',
              showBadge: true,
              theme: FFContactAvatarTheme(
                backgroundColor: Colors.blueAccent,
                avatarElevation: 20.0,
              ),
            ),
...
```

## Simple ListView creation
If you need a list for only a small number of items, it is recommended to create a list of FFContactAvatarModel objects to store the data, before creating the ListView directly from the list of models...
```
...
final List<FFContactAvatarModel> models = [
    FFContactAvatarModel(
      name: 'Ed Roberts',
      message: 'He\s a man',
      showBadge: true,
    ),
    FFContactAvatarModel(
      name: 'Mr Ed',
      message: 'He\s a horse',
      showBadge: false,
      image: Image.network(
          'https://upload.wikimedia.org/wikipedia/commons/8/81/Mister_Ed.JPG'),
    ),
    FFContactAvatarModel(
      name: 'Mrs Roberts',
      message: 'Ed\'s Wife',
    ),
    FFContactAvatarModel(
      name: 'Mrs Horse',
      message: 'Also Ed\'s Wife',
      showBadge: true,
    ),
  ];
...
return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Output a ListView using the manual data set (NO builder)
            Text('Sample using full ListView'),
            Expanded(
              child: FFContactAvatarList.fromModelList(
                models,
                scrollDirection: Axis.horizontal,
                onSelectAvatar: (index) {
                  print('Index ' + index.toString() + ' selected.');
                },
              ),
            ),
            SizedBox(
              height: 1,
              child: Container(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
...
```

## Creating a ListView Builder 
Using ListView.builder approach is recommended when you need to display a large number of items in a ListView.  This approach allows the builder to handle displaying only those items that need to be visible to the user, deriving better performance.
```
//
// Create the list of data as before ... it just needs to be a List<FFContactAvatarModel> object
//
return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Output a ListView using the .builder approach (using long list of generated data)
            Text('Sample using ListView.Builder'),
            Expanded(
              child: FFContactAvatarList.fromModelListWithBuilder(
                longList,
                context: context,
                scrollDirection: Axis.horizontal,
                onSelectAvatar: (index) {
                  print('Index ' + index.toString() + ' selected.');
                },
              ),
            ),
          ],
        ),
      ),
    );
``` 

## Theme
The avatar has a Theme class which can be used to define the majority of appearance settings for the avatar.
* backgroundColor: The background color for the CircleAvatar when initials are being displayed (i.e. no image) (default = blueGrey)
* foregroundColor: The color to use for the text of initials (default = white)
* badgeColor: The color to use for the notification badge circle (default = red)
* avatarRadius: The radius of the CircleAvatar widget (default = 31)
* initialsTextStyle: The default text style for initials (default = bold, 26pt with 1.4 letter spacing)
* nameTextStyle: The default text style for the name (default = bold, 13pt)
* messageTextStyle: The default text style for the message (default = normal, 11pt)
* verticalPadding: The space to include between each vertical component (default = 2.0)
* avatarElevation: The elevation to be used for drop shadow effect (default = 4.0)
* itemExtent: The extent (cross-axis width/height) for each item (only applies to ListView) (default = 80)
* listPadding: The padding (as an EdgeInsets object) to use in the ListView (default = EdgeInsets.all(16.0))

## FFContactAvatarModel
The Model object is provided to encapsulate the creation of data in a way that is compatible with the easy creation of FFContactAvatar and related List Widgets.

The following parameters are available:
```
  final String name;        // Name value 
  final String message;     // Message value
  final Image image;        // Optional image value
  final bool showBadge;     // Bool value (should notification badge be displayed, default = false
  final VoidCallback onTap; // onTap handler (void callback)
```

## FFContactAvatar Attributes
* theme: A FFContactAvatarTheme theme object
* image: An Image object for the image to display in the CircleAvatar
* name: A String of the contact name to display (will also be used to create the initials if no image is provided, with a maximum initials length of 2)
* message: A string of the message to display
* showBadge: A bool value indicating if the notification badge should be displayed (default = false)
* onTap: A void callback function triggered when the circle avatar is tapped
* model: A FFContactAvatarModel object which can be used to provide the name, message, image and showBadge options instead of specifying individually.

## FFContactAvatarList Attributes
* models: A List<FFContactAvatarModel> object which provides the data to use.
* scrollDirection: An Axis attribute which specifies the direction of the ListView (e.g. Axis.horizontal)
* theme: An FFContactAvatarTheme object which can specific the theme of ALL items in the ListView
* onSelectAvatar: A callback function (which requires a int type index parameter) that will be called when a child of the ListView is tapped, with the index representing the zero-based index of the selected item. 

## FFContactAvatarList Convenience Functions
The static function `fromModelList` can be called to easily create a ListView using standard theme and options...
```
static StatelessWidget fromModelList(
    List<FFContactAvatarModel> models, {
    Axis scrollDirection = Axis.horizontal,
    FFContactAvatarListSelected onSelectAvatar,
  })
```

The static function `fromModelListWithBuilder` can be called to easily create a ListViewBuilder using standard theme and options...
```
static StatelessWidget fromModelListWithBuilder(
    List<FFContactAvatarModel> models, {
    Axis scrollDirection = Axis.horizontal,
    FFContactAvatarListSelected onSelectAvatar,
    @required BuildContext context,
  })
```