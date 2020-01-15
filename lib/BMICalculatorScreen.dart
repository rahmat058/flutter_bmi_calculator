import 'package:bmi_calculator/BMIModel.dart';
import 'package:bmi_calculator/ResultScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BMICalculatorScreen extends StatefulWidget {
  @override
  _BMICalculatorScreenState createState() => _BMICalculatorScreenState();
}

class _BMICalculatorScreenState extends State<BMICalculatorScreen> {
  double _heightOfUser = 100.0;
  double _weightOfUser = 40.0;

  double _bmi = 0.0;
  BMIModel _bmiModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.only(top: 100, bottom: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 200,
                height: 200,

                child: SvgPicture.asset("assets/images/heart.svg", fit: BoxFit.contain,),
              ),
              SizedBox (
                height: 8,
              ),
              Text("BMI Calculator", style: TextStyle(color: Colors.red[200], fontSize: 34, fontWeight: FontWeight.w700),),
              Text("We care about your health", style: TextStyle(color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w400),),
              SizedBox (
                height: 32,
              ),
              Text("Height (cm)", style: TextStyle(color: Colors.grey, fontSize: 25, fontWeight: FontWeight.w500),),
              Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Slider(
                  min: 80.0,
                  max: 250.0,

                  onChanged: (height) {
                    setState(() {
                      _heightOfUser = height;
                    });
                  },
                  value: _heightOfUser,
                  divisions: 100,
                  activeColor: Colors.pinkAccent,
                  label: "$_heightOfUser",
                ),
              ),

              Text("$_heightOfUser (cm)", style: TextStyle(color: Colors.redAccent, fontSize: 20, fontWeight: FontWeight.w900),),

              SizedBox(
                height: 20,
              ),

              Text("Weight (kg)", style: TextStyle(color: Colors.grey, fontSize: 25, fontWeight: FontWeight.w500),),
              Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Slider(
                  min: 30.0,
                  max: 120.0,

                  onChanged: (weight) {
                    setState(() {
                      _weightOfUser = weight;
                    });
                  },
                  value: _weightOfUser,
                  divisions: 100,
                  activeColor: Colors.pinkAccent,
                  label: "$_weightOfUser",
                ),
              ),
              Text("$_weightOfUser (cm)", style: TextStyle(color: Colors.redAccent, fontSize: 20, fontWeight: FontWeight.w900),),

              SizedBox(
                height: 25,
              ),

              Container(
                width: double.infinity,
                padding: EdgeInsets.only(left: 16, right: 16),
                child: FlatButton.icon(
                    onPressed: () {
                      setState(() {
                        _bmi = _weightOfUser/((_heightOfUser/100)*(_heightOfUser/100));

                        if(_bmi >= 18.5 && _bmi <= 25) {
                          _bmiModel = BMIModel(bmi: _bmi, isNormal: true, comments: "Your BMI is totally fit");
                        } else if (_bmi < 18.5) {
                          _bmiModel = BMIModel(bmi: _bmi, isNormal: false, comments: "You are Underweighted");
                        } else if(_bmi > 25 && _bmi <= 30) {
                          _bmiModel = BMIModel(bmi: _bmi, isNormal: false, comments: "You are Overweighted");
                        } else {
                          _bmiModel = BMIModel(bmi: _bmi, isNormal: false, comments: "You are Obessed");
                        }
                        
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => ResultScreen(bmiModel: _bmiModel)
                        ));
                      });
                    },
                    icon: Icon(Icons.favorite, color: Colors.white,),
                    label: Text("Calculate"),
                  color: Colors.pinkAccent,
                  textColor: Colors.white,
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}
