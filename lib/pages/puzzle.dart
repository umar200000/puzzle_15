import 'package:audioplayers/audioplayers.dart';
import 'package:curved_drawer_fork/curved_drawer_fork.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:puzzle_15/pages/hiveRep.dart';

import '../iswin.dart';
import '../win.dart';

class Puzzle extends StatefulWidget {
  const Puzzle({super.key});

  @override
  State<Puzzle> createState() => _PuzzleState();
}

class _PuzzleState extends State<Puzzle> {
  bool t = false;
  HiveRep hiveRep = HiveRep();
  GlobalKey<ScaffoldState> _key = GlobalKey();
  int count = 0;
  List<int> list = List.generate(9, (index) => index)..shuffle();
  static final player = AudioPlayer();
  final player1 = AudioPlayer();
  final player2 = AudioPlayer();
  final player3 = AudioPlayer();
  final player4 = AudioPlayer();
  @override
  void initState(){
    player.play(AssetSource("puzzle1.mp3"));
    player.setReleaseMode(ReleaseMode.loop);
    count = hiveRep.getStep();
    list = hiveRep.getList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(

      key: _key,
      backgroundColor: Color(0xffFEFEFE),
      appBar: AppBar(
        automaticallyImplyLeading: false,
         leading: IconButton(
           onPressed: (){
             setState(() {
               player3.play(AssetSource("bottom.mp3"));
               _key.currentState?.openDrawer();
             });
           },
           icon: Icon(Icons.dehaze_outlined),
         ),
        title: Text("Slide Puzzle",
        style: TextStyle(
          color: Color(0xff5340EE),
          fontWeight: FontWeight.w900,
          fontSize: 30
        ),),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: 110,),
            Text("Moves: $count",style: TextStyle(
              color: Color(0xff646E76),
              fontSize: 23,
              fontWeight: FontWeight.w700
            ),),
            SizedBox(height: 50,),
            Container(
              height: 50,
              width: 170,
              child: MaterialButton(
                color: Color(0xff5340EF),
                onPressed: (){
                  setState(() {
                    player2.play(AssetSource("shuffle.mp3"));
                    list..shuffle();
                    count = 0;
                  });
                },
                child: Text("Start Game",style: TextStyle(color: Colors.white,fontSize: 18),),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              ),
            ),
            SizedBox(height: 35,),
            Container(
              height: MediaQuery.of(context).size.width/4*3,
              width: MediaQuery.of(context).size.width/4*3,
             // color: Colors.red,
              child: GridView.builder(
                itemCount: 9,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3
                  ),
                  itemBuilder: (context,index){

                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(

                      decoration: BoxDecoration(
                        color: list[index]!=0 ? Color(0xff5441F0) : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 60,
                      width: 60,
                      child: InkWell(
                        onTap: (){
                      setState(() {
                        changeIndex(index);
                      });
                        },
                        child: Center(child: Text("${list[index]}",style: TextStyle(color: Color(0xffFEFEFE),
                        fontSize: 40,fontWeight: FontWeight.w900),)),

                        borderRadius: BorderRadius.circular(10),
                      ),

                    ),
                  );
                  },
              ),
            )
          ],
        ),
      ),
      drawer: CurvedDrawer(
          color: Colors.white,
          labelColor: Colors.black,
          width: 75.0,
      onTap: (index) {
       setState(() {
         player3.play(AssetSource("bottom.mp3"));
         index == 0 ? player.resume() : index == 1 ? player.pause() : "";
         index == 3 ? Navigator.pop(context) : "";
         if(index==2){
           player.stop();
           goBack();
         }
       });
      }, items: [
        DrawerItem(icon:Icon(Icons.music_note,size: 40,color: Color(0xff5340EF))),
        DrawerItem(icon: Icon(Icons.music_off,size: 40,color: Color(0xff5340EF))),
        DrawerItem(icon: Icon(Icons.home)),
        DrawerItem(icon: Icon(Icons.arrow_forward)),

      ],
    ),
      drawerEnableOpenDragGesture: false,
    ));
  }
  changeIndex(int i){
    int zeroIndex = list.indexOf(0);
    int oneleft = i-1;
    int oneright = i+1;
    int threeleft = i-3;
    int threeright = i+3;
    if(oneleft==zeroIndex && i%3!=0) builder1(i, oneleft);
    else if(oneright==zeroIndex && i%3!=2) builder1(i, oneright);
    else if(threeright==zeroIndex) builder1(i, threeright);
    else if(threeleft==zeroIndex) builder1(i, threeleft);
    hiveRep.saveStep(count);
    hiveRep.saveList(list);
  }

   goBack(){
     Navigator.pop(context);
     Navigator.pop(context);
  }

  builder1(int i, int number){
    player1.play(AssetSource("correct.wav"));
    list[number] = list[i];
    list[i] = 0;
    count++;
    if(isWin(list)){
      player.stop();
      Navigator.push(context, CupertinoPageRoute(builder: (context)=>Win()));
      player4.play(AssetSource("winsound.mp3"));
    }
  }




}
