import 'dart:developer';

import 'package:be_alive/models/contentInstance.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

import 'package:be_alive/parameters.dart';

// Menu of possible instances
const _instances = {
  'Dreams': 'МРІЯ',
  'Targets': 'МЕТА',
  'GoodDreams': 'ДОБРА СПРАВА',
  'Motivations': 'МОТИВАЦІЯ'
};

class CreateInstance extends StatefulWidget {
  @override
  _CreateInstanceState createState() => _CreateInstanceState();
}

class _CreateInstanceState extends State<CreateInstance> {
  ContentInstance _newInstance;
  String _instance = "";
  File _image;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    EdgeInsets padding = MediaQuery.of(context).padding;
    String _bg = 'assets/background.png';
    double _buttonHeight = size.height * 0.05;

    // 1st step to choose instance
    Widget chooseInstanceWidget = Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: List<Widget>.generate(5, (int index) {
          if (index == 0) {
            return Padding(
                padding: EdgeInsets.only(
                    top: size.height * 0.05, bottom: size.height * 0.05),
                child: Center(
                  child: Text(
                    'оберіть тип',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ));
          } else {
            return Padding(
                padding: EdgeInsets.only(
                    left: size.width * 0.1,
                    right: size.width * 0.1,
                    bottom: size.height * 0.05),
                child: FlatButton(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  child: Text(
                    _instances.values.toList()[index - 1].toString(),
                    style: TextStyle(
                      color: BeColors.primary,
                    ),
                  ),
                  color: Colors.white,
                  onPressed: () {
                    setState(() {
                      _instance =
                          _instances.values.toList()[index - 1].toString();
                      _newInstance = ContentInstance(
                          _instances.keys.toList()[index - 1].toString());
                    });
                  },
                ));
          }
        }));

    getImageFile(ImageSource source) async {
      var result;
      var image = await ImagePicker.pickImage(source: source);

      if (image != null) {
        // Cropping the image
        File croppedFile = await ImageCropper.cropImage(
            sourcePath: image.path,
            aspectRatioPresets: [CropAspectRatioPreset.square]);
        // Compress the image
        result = await FlutterImageCompress.compressAndGetFile(
          croppedFile.path,
          croppedFile.path,
          quality: 50,
        );
      }
      setState(() {
        _image = result;
      });
    }

    // 2th step to create image
    Widget makeImageWidget = Stack(children: [
      Center(
          child: Container(
              height: size.width * 0.5,
              width: size.width * 0.5,
              decoration: BoxDecoration(
                  color: BeColors.white.withOpacity(0.05),
                  shape: BoxShape.circle),
              child: null)),
      Center(
          child: Container(
              height: size.width * 0.38,
              width: size.width * 0.38,
              decoration: BoxDecoration(
                  color: BeColors.white.withOpacity(0.1),
                  shape: BoxShape.circle),
              child: null)),
      Center(
          child: Container(
              height: size.width * 0.27,
              width: size.width * 0.27,
              decoration: BoxDecoration(
                  color: BeColors.white.withOpacity(0.15),
                  shape: BoxShape.circle),
              child: null)),
      GestureDetector(
          onTap: () => getImageFile(ImageSource.gallery),
          child: Center(
              child: Container(
                  height: size.width * 0.5,
                  width: size.width * 0.5,
                  decoration: BoxDecoration(
                      color: BeColors.transparent, shape: BoxShape.circle),
                  child: Icon(Icons.add_circle,
                      size: size.width * 0.17, color: BeColors.white))))
    ]);

    // 3th step to specify details
    Widget instanceImage =
        _image != null ? Image.file(_image) : Text('No Image found!');
    Widget fillInstanceWidget = Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
      instanceImage,
      Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Form(
          child: Column(
                  children: <Widget>[
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          labelText: 'Text',
                          fillColor: Colors.white,
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          labelStyle: TextStyle(color: Colors.white),
                          prefixIcon: Icon(BeIcons.be_pencil, color: BeColors.white)),
                      onSaved: (input) => null,
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          labelText: 'Hashtag',
                          fillColor: Colors.white,
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          labelStyle: TextStyle(color: Colors.white),
                          prefixIcon:
                              Icon(BeIcons.be_hashtag, color: BeColors.white)),
                      onSaved: (input) => null,
                    )
                  ]),
        ),
        Container()
                ],
              ),
      )
    ]);

    return Scaffold(
        body: Stack(children: <Widget>[
      Image.asset(
        _bg,
        width: size.width,
        height: size.height,
        fit: BoxFit.fill,
      ),
      SingleChildScrollView(
        child: Container(
          height: size.height,
          width: size.width,
          child: Column(
            mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                    height: padding.top,
                    width: size.width,
                    color: Colors.white),
                FlatButton(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pop(context, null);
                  },
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.arrow_back_ios),
                        Text(
                          "СТВОРИТИ $_instance",
                          style: TextStyle(
                            color: BeColors.primary,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Container()
                      ]),
                ),
                Expanded(
                    child: Container(
                  height: size.height - padding.top,
                  width: size.width,
                  child: AnimatedCrossFade(
                    duration: const Duration(seconds: 1),
                    firstChild: chooseInstanceWidget,
                    secondChild: AnimatedCrossFade(
                      duration: const Duration(seconds: 1),
                      firstChild: makeImageWidget,
                      secondChild: fillInstanceWidget,
                      crossFadeState: _image == null
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                    ),
                    crossFadeState: _instance == ""
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                  ),
                )),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      FlatButton(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'ДАЛІ',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Container(height: padding.bottom),
                            ]),
                        color: BeColors.primary,
                        onPressed: () {},
                      )
                    ])
              ]),
        ),
      )
    ]));
  }
}
