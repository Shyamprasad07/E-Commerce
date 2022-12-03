import 'package:emart_app/consts/consts.dart';
Widget featuredButton({String? title, icon}){
  return Row(
    children: [
      Image.asset(icon,width: 60,fit: BoxFit.fill,), 
      10.heightBox,
      title!.text.fontFamily(semibold).color(darkFontGrey).make(),
    ],
  ).box.width(200).white.padding(const EdgeInsets.all(4)).margin(const EdgeInsets.symmetric(horizontal:4)).roundedSM.outerShadowSm.make();
}