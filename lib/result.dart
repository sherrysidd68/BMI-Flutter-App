import 'package:flutter/material.dart';

class OutputScreen extends StatelessWidget {
  double bmi;
  bool check = true;
  String ret = '';
  OutputScreen(this.bmi, this.check, this.ret);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 150,
            ),
            Container(
                width: double.infinity,
                height: 200,
                child: check
                    ? Image.asset(
                        "assets/images/healthy.png",
                        fit: BoxFit.contain,
                      )
                    : Image.asset(
                        "assets/images/unhealth.png",
                        fit: BoxFit.contain,
                      )),
            SizedBox(
              height: 30,
            ),
            Text(" Your Body Mass Index is $bmi",
                style: TextStyle(
                    color: Colors.orangeAccent[200],
                    fontSize: 32,
                    fontWeight: FontWeight.w900)),
            SizedBox(
              height: 5,
            ),
            Text("$ret",
                style: TextStyle(
                    color: Colors.black38,
                    fontSize: 18,
                    fontWeight: FontWeight.w900)),
            SizedBox(
              height: 40,
            ),
            Container(
              color: Colors.orangeAccent,
              padding: EdgeInsets.only(left: 12, right: 12),
              width: 300,
              child: FlatButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.keyboard_return,
                    color: Colors.white,
                  ),
                  label: Text("Return",
                      style: TextStyle(fontSize: 26, color: Colors.white))),
            )
          ],
        ),
      ),
    );
  }
}
