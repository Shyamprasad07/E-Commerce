import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/lists.dart';
import 'package:emart_app/views/catagory_screen/category_details.dart';
import 'package:emart_app/widgets_common/bg_widget.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
      appBar: AppBar(
        title: categories.text.fontFamily(bold).white.make(),
      ),
      body: Container(padding: const EdgeInsets.all(12),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: 9,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisExtent: 200,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
               Image.asset(categoryImages[index],height: 120,width: 200,fit: BoxFit.cover,),
               10.heightBox,
               "${categoriesList[index]}".text.color(darkFontGrey).align(TextAlign.center).make(),
            ],
          ).box.white.rounded.clip(Clip.antiAlias).outerShadowSm.make().onTap(() {
            Get.to(()=>CategoryDetails(title: categoriesList[index]));
            });
        },
      ),),
    ));
  }
}
