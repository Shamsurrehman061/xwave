


import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class PickMedia{


  getMedia(ImageSource source)async
  {
    final pickedImage = await ImagePicker().pickImage(source: source);

    var map = Map();
    if(pickedImage != null)
      {
        var decodedImage = await decodeImageFromList(await pickedImage.readAsBytes());
        map['path'] = pickedImage.path;
        map['height'] = decodedImage.height;
        map['width'] = decodedImage.width;
        return map;
      }
    else
      {
        return;
      }
  }

  getProfileImage(ImageSource source)async
  {
    final pickedImage = await ImagePicker().pickImage(source: source);

    if(pickedImage != null)
    {
      return pickedImage.path;
    }
    else
    {
      return;
    }
  }


  getVideo(ImageSource source)async{

    final pickedVideo = await ImagePicker().pickVideo(source: source);


    if(pickedVideo != null)
      {
        return pickedVideo.path;
      }

  }


}