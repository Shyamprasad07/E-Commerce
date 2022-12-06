import 'package:emart_app/consts/consts.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController{
  var profileImgPath = "".obs;

  // textField
  var nameController = TextEditingController();
  var passController = TextEditingController();
  changeImage(context) async{
    try {
      final img = await ImagePicker().pickImage(source:ImageSource.gallery,imageQuality: 70);
    if(img == null) return; 
      profileImgPath.value = img.path;
    } on PlatformException catch (e) {
      VxToast.show(context, msg: e.toString());
      
    }
  }
}