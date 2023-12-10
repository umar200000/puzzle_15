import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:puzzle_15/pages/puzzle.dart';

import '../page1/puzzle1.dart';
import '../page2/puzzle2.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  final player = AudioPlayer();
  final player1 = AudioPlayer();
  final player2 = AudioPlayer();
  final player3 = AudioPlayer();
  bool t = false;
  
  @override
  void initState() {
   player.play(AssetSource("PuzzleM.mp3"));
   player.setReleaseMode(ReleaseMode.loop);
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
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 5),
              child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                    icon: !t ? Icon(Icons.music_note,size: 40,color: Color(0xff5340EF),) : Icon(Icons.music_off,size: 40,color: Color(0xff5340EF),),
                  onPressed: (){
                  setState(() {
              t ? player.resume() : player.pause();
              t ? t = false : t = true;
                  });
                  },

                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 70,
                    width: 250,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff5340EF)
                      ),
                        onPressed: (){
                           setState(() {
                             player1.play(AssetSource("interfes.mp3"));
                             player.pause();
                             t = false;
                           Future.delayed(Duration(milliseconds: 500), (){
                             Navigator.push(context, CupertinoPageRoute(builder: (context)=>Puzzle()));

                           });
                           });
                     },
                        child: Text("Easy",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 24,color: Colors.white,fontStyle: FontStyle.italic),)),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    height: 70,
                    width: 250,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xff5340EF)
                        ),
                        onPressed: (){
                          setState(() {
                            player1.play(AssetSource("interfes.mp3"));
                            player.pause();
                            t = false;
                            Future.delayed(Duration(milliseconds: 500), (){
                              Navigator.push(context, CupertinoPageRoute(builder: (context)=>Puzzle1()));

                            });
                          });
                        },
                        child: Text("Medium",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 24,color: Colors.white,fontStyle: FontStyle.italic),)),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    height: 70,
                    width: 250,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xff5340EF)
                        ),
                        onPressed: (){
                          setState(() {
                            player1.play(AssetSource("interfes.mp3"));
                            player.pause();
                            t = false;
                            Future.delayed(Duration(milliseconds: 500), (){
                              Navigator.push(context, CupertinoPageRoute(builder: (context)=>Puzzle2()));

                            });
                          });
                        },
                        child: Text("Hard",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 24,color: Colors.white,fontStyle: FontStyle.italic),)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
