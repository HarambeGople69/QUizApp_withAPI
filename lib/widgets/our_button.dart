import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OurButton extends StatelessWidget {
  final String title;
  final Color color;
  final Function function;
  const OurButton({
    Key? key,
    required this.title,
    required this.color,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: ScreenUtil().setSp(5),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          ScreenUtil().setSp(10),
        ),
        child: SizedBox(
          height: ScreenUtil().setSp(50),
          width: MediaQuery.of(context).size.width * 0.85,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(color),
            ),
            onPressed: () {
              function();
            },
            child: Text(
              title,
              style: TextStyle(
                fontSize: ScreenUtil().setSp(20),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
