import 'package:emart_app/views/splash_screen.dart/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'consts/consts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //for getx material app into get material app
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: appname,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
          // to set app bar icons color
          iconTheme: IconThemeData(
            color: darkFontGrey,
          ),
          // st elevation to 0
          elevation: 0.0,
          backgroundColor: Colors.transparent, 
        ),
        fontFamily: regular,
      ),
      home: const SplashScreen(),
    );
  }
}
