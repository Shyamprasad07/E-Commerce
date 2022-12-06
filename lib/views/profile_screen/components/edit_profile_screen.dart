// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';
import 'dart:ui';

import 'package:get/get.dart';

import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/controllers/profile_controller.dart';
import 'package:emart_app/widgets_common/bg_widget.dart';
import 'package:emart_app/widgets_common/custum_textfield.dart';
import 'package:emart_app/widgets_common/our_button.dart';

class EditProfileScreen extends StatelessWidget {
  final dynamic data;
  const EditProfileScreen({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     var controller = Get.find<ProfileController>();
    
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(),
        body: Obx(
          ()=> Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              
              // if data image Url and controller path is empty
              data['imageUrl'] == '' && controller.profileImgPath.isEmpty 
               ? Image.asset(
                      imgProfile2,
                      width: 100,
                      fit: BoxFit.cover,
                    ).box.roundedFull.clip(Clip.antiAlias).make()


                    // if data is not empty but contoller path is empty
                    :data["imageUrl"] !='' && controller.profileImgPath.isEmpty 

                    ?Image.network(data['imageUrl'], width: 100,
                    fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make()

                    //if both are empty
                     : Image.file(File(controller.profileImgPath.value),
                    width: 100,
                    fit: BoxFit.cover,
                    ).box.roundedFull.clip(Clip.antiAlias).make(),
                    10.heightBox,
                    ourButton(
                      color: redColor,onPress: (){
                        
                        controller.changeImage(context);
                      },textColor: whiteColor,title: "Change"),
                      const Divider(),
                      20.heightBox,
                      customTextField(
                        controller: controller.nameController,
                        hint: nameHint, title: name,isPass: false,
                      ),
                      10.heightBox,
                      customTextField(
                        controller: controller.oldpassController,
                        hint: passwordHint, title: oldpass,isPass: true,
                      ),
                      10.heightBox,
                      customTextField(
                        controller: controller.newpassController,
                        hint: passwordHint, title: newpass,isPass: true,
                      ),
                      20.heightBox,
                     controller.isloading.value ? const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(redColor),
                     ): SizedBox(
                        width: context.screenWidth -60,
                        child: ourButton( color: redColor,onPress: () async{


                          controller.isloading(true);
                          // if image is not selected
                           if (controller .profileImgPath.value.isNotEmpty){
                            await controller.uploadProfileImage();
                           }
                           else{
                            controller.profileImgageLink = data['imageUrl'];
                           }
                           // if old pasword matches data base
                           if (data['password'] == controller.oldpassController.text) {
                           await controller.changeAuthPassword(
                            email: data['email'],
                            password: controller.oldpassController.text,
                            newpassword: controller.newpassController.text
                           );


                              await controller.updateProfile(
                          imgUrl: controller.profileImgageLink,
                          name: controller.nameController.text,
                          password: controller.newpassController.text
                         );
                         VxToast.show(context, msg: "Updated");
                           }
                          else{
                            VxToast.show(context, msg: "Wrong old password");
                            controller.isloading(false);
                          }


                        

                        },textColor: whiteColor,title: "Save")),
            ],
          ).box.white.shadowSm.padding(const EdgeInsets.all(16)).margin(const EdgeInsets.only(top:50,left: 12,right: 12)).rounded.make(),
        ),
      ),
    );
  }
}
