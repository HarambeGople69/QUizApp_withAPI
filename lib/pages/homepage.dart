import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/models/api_response_model.dart';
import 'package:myapp/pages/quiz_play.dart';
import 'package:myapp/widgets/our_button.dart';
import 'package:myapp/widgets/our_sized_box.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String computer = "https://opentdb.com/api.php?amount=10&category=18";
  QuizHelper quizHelper = QuizHelper();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchAllQuiz();
  }

  fetchAllQuiz() async {
    var response = await http.get(Uri.parse(computer));
    var body = response.body;
    var json = jsonDecode(body);
    print(json);
    setState(() {
      quizHelper = QuizHelper.fromJson(json);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.purple[300],
        body: SafeArea(
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setSp(15),
              vertical: ScreenUtil().setSp(15),
            ),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                CircleAvatar(
                  radius: ScreenUtil().setSp(
                    50,
                  ),
                  backgroundImage: AssetImage(
                    "images/icon.jpg",
                  ),
                ),
                OurSizedBox(),
                Text(
                  "Select category:",
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(
                      30,
                    ),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                OurSizedBox(),
                OurButton(
                  title: "Film",
                  color: Colors.red[500]!,
                  function: () {
                    // print(quizHelper.results![0].question);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return QuizPlay(
                        index: 1,
                      );
                    }));
                  },
                ),
                OurSizedBox(),
                OurButton(
                  title: "Math",
                  color: Colors.amber[500]!,
                  function: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return QuizPlay(
                        index: 2,
                      );
                    }));
                  },
                ),
                OurSizedBox(),
                OurButton(
                  title: "Music",
                  color: Colors.blue[500]!,
                  function: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return QuizPlay(
                        index: 3,
                      );
                    }));
                  },
                ),
                OurSizedBox(),
                OurButton(
                  title: "Computer",
                  color: Colors.green[500]!,
                  function: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return QuizPlay(
                        index: 4,
                      );
                    }));
                  },
                ),
                OurSizedBox(),
                OurButton(
                  title: "Sports",
                  color: Colors.orange[500]!,
                  function: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return QuizPlay(
                        index: 5,
                      );
                    }));
                  },
                ),
                OurSizedBox(),
              ],
            ),
          ),
        ));
  }
}
