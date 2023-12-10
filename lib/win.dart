import 'package:flutter/material.dart';

class Win extends StatefulWidget {
  const Win({super.key});

  @override
  State<Win> createState() => _WinState();
}

class _WinState extends State<Win> {
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
              child: Container(
                color: Color(0xff5340EF),
                height: 300,
                width: 300,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text("you won",style: TextStyle(color: Colors.white,fontSize: 30),),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 100.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 60,
                  width: 200,
                  child: ElevatedButton(
                    onPressed: (){
                     Navigator.pop(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("play again",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
                        SizedBox(width: 5,),
                        Icon(Icons.restart_alt_outlined,size: 35,),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 60,
                  width: 200,
                  child: ElevatedButton(
                    onPressed: (){
                     Navigator.pop(context);
                     Navigator.pop(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("go Home",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
