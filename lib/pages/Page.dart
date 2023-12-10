import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:puzzle_15/pages/mainPage.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _PageState();
}

class _PageState extends State<Page1> {

  @override
  void initState() {
    Future.delayed(Duration(seconds: 5), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainPage()));
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(

          children: [
            Align(
                alignment: Alignment.center,
                child: Text("Puzzle 15\nGame",textAlign: TextAlign.center ,style: TextStyle(
                  color: Color(0xff5340EF),
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.italic,
                ),)),
            Padding(
              padding: const EdgeInsets.only(bottom: 100.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: CircularProgressIndicator(
                 color:  Color(0xff5340EF),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
