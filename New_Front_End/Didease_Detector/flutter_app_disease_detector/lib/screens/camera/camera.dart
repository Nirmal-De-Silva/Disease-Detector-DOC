import 'dart:io';
import 'package:image_picker/image_picker.dart  ';
import 'package:flutter/material.dart';


class Camera extends StatefulWidget {
  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {

  File _image;
  final imagePicker = ImagePicker();

  Future getImage() async{
    Image.network('https://github.com/flutter/plugins/raw/master/packages/video_player/video_player/doc/demo_ipod.gif?raw=true');

    final image = await imagePicker.getImage(source: ImageSource.gallery);
    setState((){
      _image = File(image.path);
      print(_image);
      print("...................................");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/layout2.png'),
            
            fit: BoxFit.cover,          
            
          ),
          ),

          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
          title: Text('Doc Disease'),
          backgroundColor: Colors.green[500],
          elevation: 0.0,
          actions: <Widget>[
            
          ],


          ),
          
          
          body: Center(
            
            child: _image == null ? Text("No Imge Selected") : Image.file(_image,width: 400, height: 350,),),
            
            
            floatingActionButton: FloatingActionButton(
              onPressed: 
              getImage,
              
              backgroundColor: Colors.white,
              child : Icon(
                Icons.camera_alt,
                color: Colors.green,),
              
            ),
            
            
            
          ),
          
      
    );
  }
}