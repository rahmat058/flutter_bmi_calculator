import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ResultScreen extends StatelessWidget {
  final bmiModel;

  // Constructor calling
  ResultScreen({this.bmiModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            Container(
                width: 200,
                height: 200,
                child: bmiModel.isNormal ? SvgPicture.asset("assets/images/enjoy.svg", fit: BoxFit.contain,) : SvgPicture.asset("assets/images/sad.svg", fit: BoxFit.contain,)
            ),

            SizedBox (
              height: 20,
            ),
            Text("Your BMI is ${bmiModel.bmi.round()}", style: TextStyle(color: Colors.pinkAccent, fontSize: 25, fontWeight: FontWeight.w700),),
            Text("${bmiModel.comments}", style: TextStyle(color: Colors.grey, fontSize: 20, fontWeight: FontWeight.w500),),

            SizedBox (
              height: 20,
            ),

            bmiModel.isNormal ?
            Text("Hurray! your BMI is normal", style: TextStyle(color: Colors.green, fontSize: 20, fontWeight: FontWeight.w700),) :
            Text("Sadly! your BMI is normal", style: TextStyle(color: Colors.redAccent, fontSize: 20, fontWeight: FontWeight.w700),),

            SizedBox (
              height: 20,
            ),

            Container(
              width: double.infinity,
              padding: EdgeInsets.only(left: 16, right: 16),
              child: FlatButton.icon(
                onPressed: () {
                    Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios, color: Colors.white,),
                label: Text("Let Calculate Again"),
                color: Colors.pinkAccent,
                textColor: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
