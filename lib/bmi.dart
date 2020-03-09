import 'package:flutter/material.dart';
import 'result.dart';

class BmiCalculator extends StatefulWidget {
  @override
  _BmiCalculatorState createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  double _prsnHt = 100;
  double prsnKg = 30;
  double res = 0;
  String ret = '';
  bool check = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  width: 250,
                  height: 250,
                  child: Image.asset(
                    "assets/images/img.png",
                    fit: BoxFit.contain,
                  )),
              SizedBox(
                height: 20,
              ),
              Text(" Body Mass Index Calculator",
                  style: TextStyle(
                      color: Colors.orangeAccent[200],
                      fontSize: 32,
                      fontWeight: FontWeight.w900)),
              SizedBox(
                height: 1,
              ),
              Text(" Check your BMI and know about your HEALTH",
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                      fontWeight: FontWeight.w300)),
              SizedBox(
                height: 20,
              ),
              Text(" HEIGHT (cm)",
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 30,
                      fontWeight: FontWeight.w200)),
              Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Slider(
                  min: 80,
                  max: 250,
                  onChanged: (height) {
                    setState(() {
                      _prsnHt = height;
                    });
                  },
                  value: _prsnHt,
                  divisions: 100,
                  activeColor: Colors.orange,
                  label: "$_prsnHt",
                ),
              ),
              Text(
                "$_prsnHt cm",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.orangeAccent),
              ),
              SizedBox(
                height: 25,
              ),
              Text(" Weight (kg)",
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 30,
                      fontWeight: FontWeight.w200)),
              Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Slider(
                  min: 25,
                  max: 120,
                  onChanged: (height) {
                    setState(() {
                      prsnKg = height;
                    });
                  },
                  value: prsnKg,
                  divisions: 100,
                  activeColor: Colors.orange,
                  label: "$prsnKg",
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "$prsnKg kg",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.orangeAccent),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: FlatButton.icon(
                    onPressed: () {
                      setState(() {
                        res = prsnKg / ((_prsnHt / 100) * (_prsnHt / 100));
                        res = res.ceilToDouble();

                        if (res >= 18.5 && res <= 25) {
                          ret = "You are Perfectly Fir Bro!! ";
                          check = true;
                        } else if (res > 25 && res <= 30) {
                          ret = "You are Over Weight Bro!! ";
                          check = false;
                        } else if (res < 18.5) {
                          ret = "You are Underweigth Bro!! ";
                          check = false;
                        } else {
                          ret = "You are Obese Bro!! ";
                          check = false;
                        }

                        // print("BMI: $res \n Status: $check \n Comment: $ret");
                      });
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  OutputScreen(res, check, ret)));
                    },
                    icon: Icon(
                      Icons.add_circle_outline,
                      color: Colors.white,
                    ),
                    label: Text(
                      "CALCULATE",
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    )),
                color: Colors.orangeAccent,
                padding: EdgeInsets.only(left: 12, right: 12),
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
