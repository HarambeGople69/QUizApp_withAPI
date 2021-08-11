import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/models/api_response_model.dart';
import 'package:myapp/network/network_calls.dart';
import 'package:myapp/services/provider.dart';
import 'package:myapp/widgets/our_button.dart';
import 'package:myapp/widgets/our_sized_box.dart';
import 'package:provider/provider.dart';

class QuizPlay extends StatefulWidget {
  final int index;
  const QuizPlay({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  _QuizPlayState createState() => _QuizPlayState();
}

class _QuizPlayState extends State<QuizPlay> {
  QuizHelper? futureQuiz;
  // int currentIndex = 0;
  int score = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  fetchData() async {
    if (widget.index == 1) {
      futureQuiz = await Networkclass().callFilmData();
    } else if (widget.index == 2) {
      futureQuiz = await Networkclass().callMathData();
    } else if (widget.index == 3) {
      futureQuiz = await Networkclass().callMusicData();
    } else if (widget.index == 4) {
      futureQuiz = await Networkclass().callComputerData();
    } else if (widget.index == 5) {
      futureQuiz = await Networkclass().callSportData();
    }

    mixChoices();
    // print(futureQuiz!
    //     .results![Provider.of<Manage>(context, listen: false).currentIndex]
    //     .question);
  }

  mixChoices() {
    setState(() {
      futureQuiz!
          .results![Provider.of<Manage>(context, listen: false).currentIndex]
          .incorrectAnswers!
          .add(futureQuiz!
              .results![
                  Provider.of<Manage>(context, listen: false).currentIndex]
              .correctAnswer!);
      futureQuiz!
          .results![Provider.of<Manage>(context, listen: false).currentIndex]
          .incorrectAnswers!
          .shuffle();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Manage>(builder: (context, manage, child) {
      return Scaffold(
        backgroundColor: Colors.purple[300],
        body: SafeArea(
          child: futureQuiz != null
              ? Center(
                  child: (manage.currentIndex < 9)
                      ? Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: ScreenUtil().setSp(15),
                            vertical: ScreenUtil().setSp(15),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                futureQuiz!
                                    .results![manage.currentIndex].question!,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: ScreenUtil().setSp(30),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              OurSizedBox(),
                              Column(
                                children: futureQuiz!
                                    .results![manage.currentIndex]
                                    .incorrectAnswers!
                                    .map((e) {
                                  return OurButton(
                                      title: e,
                                      color: Colors.pink[100]!,
                                      function: () {
                                        setState(() {
                                          if (futureQuiz!
                                                  .results![manage.currentIndex]
                                                  .correctAnswer ==
                                              e) {
                                            manage.increaseScore();
                                            print("Correct ans");
                                          } else {
                                            print("Incorrect ans");
                                          }
                                          if (manage.currentIndex < 9) {
                                            manage.increaseIndex();
                                            mixChoices();
                                          }
                                          ;
                                        });
                                      });
                                }).toList(),
                              )
                            ],
                          ),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${manage.score}/${manage.currentIndex}",
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(40),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                manage.clear();
                                Navigator.pop(context);
                              },
                              child: Text("Play again"),
                            ),
                          ],
                        ),
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      );
    });
  }
}
