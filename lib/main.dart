import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/services/provider.dart';
import 'package:provider/provider.dart';

import 'pages/homepage.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => Manage(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), completed);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Powered By:",
            style: TextStyle(
              fontSize: ScreenUtil().setSp(35),
              fontWeight: FontWeight.w700,
            ),
          ),
          Container(
            width: ScreenUtil().setSp(400),
            height: ScreenUtil().setSp(400),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/logo.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void completed() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return HomePage();
    }));
  }
}
