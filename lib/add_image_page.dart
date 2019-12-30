import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

class AddImagePage extends StatefulWidget {
  AddImagePage({Key key}) : super(key: key);
  // final ContentInstance contentInstance;

  @override
  _AddImagePageState createState() => _AddImagePageState();
}

class _AddImagePageState extends State<AddImagePage> {
  File _image;
  //AnimationController _controller;
  
  getImageFile(ImageSource source) async {
    // Clicking or Picking from Gallery 
    var image = await ImagePicker.pickImage(source: source);
    // Cropping the image
    File croppedFile = await ImageCropper.cropImage(
      sourcePath: image.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        // CropAspectRatioPreset.ratio3x2,
        // CropAspectRatioPreset.original,
        // CropAspectRatioPreset.ratio4x3,
        // CropAspectRatioPreset.ratio16x9
      ],
      //maxWidth: 512,
      //maxHeight: 512,
    );
    // Compress the image
    var result = await FlutterImageCompress.compressAndGetFile(
      croppedFile.path,
      croppedFile.path,
      quality: 50,
    );

    setState(() {
      _image = result;
      print(_image.lengthSync());
    });
  }

  @override
  Widget build(BuildContext context) {
    print(_image?.lengthSync());
    return Scaffold(
      appBar: AppBar(
        title: Text("Click | Pick | Crop | Compress"),
      ),
      body: Center(
        child: _image == null
            ? Text("Image")
            : Image.file(
                _image,
                // height: 200,
                // width: 200,
              ),
      ),
      
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton.extended(
            label: Text("Camera"),
            onPressed: () => getImageFile(ImageSource.camera),
            heroTag: UniqueKey(),
            icon: Icon(Icons.camera),
          ),
          SizedBox(
            width: 20,
          ),
          FloatingActionButton.extended(
            label: Text("Gallery"),
            onPressed: () => getImageFile(ImageSource.gallery),
            heroTag: UniqueKey(),
            icon: Icon(Icons.photo_library),
          )
        ],
      ),
    );
  }
}
  
    // return new Scaffold(
    //   appBar: new AppBar(
    //     title: new Text(widget.title,
    //     style: new TextStyle(
    //       color: Colors.white
    //     ),
    //     ),
    //   ),
    //   body: 
    // // return Scaffold(
    // //     body: Stack(children: <Widget>[
    // //   new Image.asset(
    // //     _bg,
    // //     width: size.width,
    // //     height: size.height,
    // //     fit: BoxFit.fill,
    // //   ),
    // //   Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
    // //     Column(
    // //       children: <Widget>[
    // //         new Container(
    // //             height: padding.top, width: size.width, color: Colors.white),
    // //         new FlatButton(
    // //           materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    // //           child: Stack(
    // //             alignment: Alignment.center,
    // //             children: <Widget>[
    // //               Row(
    // //                   mainAxisAlignment: MainAxisAlignment.start,
    // //                   children: <Widget>[Icon(Icons.arrow_back_ios)]),
    // //               Center(
    // //                 child: new Text(
    // //                   "",
    // //                   style: new TextStyle(
    // //                     color: BeColors.primary,
    // //                   ),
    // //                   textAlign: TextAlign.center,
    // //                 ),
    // //               )
    // //             ],
    // //           ),
    // //           color: Colors.white,
    // //           onPressed: () {
    // //             Navigator.pop(context);
    // //           },
    // //         ),
    // //       ],
    // //     ),
    // //     Column(
    // //       crossAxisAlignment: CrossAxisAlignment.stretch,
    // //       children: <Widget>[
    // //         new Text('завантажте фото або зображення',
    // //             style: TextStyle(color: Colors.white))
    // //       ],
    // //     ),
    // //     Expanded(
    // //       child: 
    // new GestureDetector(
    //         onTap: () => imagePicker.showDialog(context),
    //         child: new Center(
    //           child: _image == null
    //               ? new Stack(
    //                   children: <Widget>[
    //                     new Center(
    //                       child: new CircleAvatar(
    //                         radius: 80.0,
    //                         backgroundColor: const Color(0xFF778899),
    //                       ),
    //                     ),
    //                     new Center(
    //                       child: new Image.asset("assets/basic/picture.png"),
    //                     ),
    //                   ],
    //                 )
    //               : new Container(
    //                   height: 160.0,
    //                   width: 160.0,
    //                   decoration: new BoxDecoration(
    //                     color: const Color(0xff7c94b6),
    //                     image: new DecorationImage(
    //                       image: new ExactAssetImage(_image.path),
    //                       fit: BoxFit.cover,
    //                     ),
    //                     border: Border.all(color: Colors.red, width: 5.0),
    //                     borderRadius:
    //                         new BorderRadius.all(const Radius.circular(80.0)),
    //                   ),
    //                 ),
    //         ),
    //       ));

    //       // child: new Center(
    //       //     child: new IconButton(
    //       //   padding: EdgeInsets.all(0),
    //       //   icon: Icon(Icons.add_circle, size: size.width * 0.2),
    //       //   color: BeColors.primary,
    //       //   onPressed: () {
    //       //     print('Image added');
    //       //     // Navigator.push(
    //       //     //   context,
    //       //     //   MaterialPageRoute(
    //       //     //       builder: (context) => ChooseInstancePage()),
    //       //     // );
    //       //   },
    //       // )),
    // //     ),
    // //     Column(
    // //         crossAxisAlignment: CrossAxisAlignment.stretch,
    // //         children: <Widget>[
    // //           new FlatButton(
    // //             materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    // //             child: new Column(
    // //                 mainAxisAlignment: MainAxisAlignment.center,
    // //                 children: <Widget>[
    // //                   new Text(
    // //                     'ДАЛІ',
    // //                     style: new TextStyle(
    // //                       color: Colors.white,
    // //                     ),
    // //                   ),
    // //                   new Container(height: padding.bottom),
    // //                 ]),
    // //             color: BeColors.primary,
    // //             onPressed: () {
    // //               // Navigator.push(
    // //               //   context,
    // //               //   MaterialPageRoute(
    // //               //       builder: (context) => AddInfoPage()),
    // //               // );
    // //             },
    // //           )
    // //         ])
    // //   ])
    // // ]));
    // }
  

  // @override
  // userImage(File _image) {
  //   setState(() {
  //     this._image = _image;
  //   });
  // }
// }