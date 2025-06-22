import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MainPage()
  ));
}

class MainPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.lightBlue,
            height: MediaQuery.of(context).size.height/2,
            width: double.infinity,
            child: Center(
              child: MaterialButton(  onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> GamePage()));

              },
              color: Colors.white,
              shape: CircleBorder(),
              height: 150,
              minWidth: 150,
              child: Text("START"),
            )),
          ),
          Container(
            color: Colors.pinkAccent,
            height: MediaQuery.of(context).size.height/2,
            width: double.infinity,
            child: Center(
              child: MaterialButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> GamePage()));

              },
              color: Colors.white,
              shape: CircleBorder(),
              height: 150,
              minWidth: 150,
              child: Text("START"),
              ),
            ),
          )


        ],
      ),
    );
  }
}

class GamePage extends StatefulWidget{
  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  double blueCardHeight = 0;
  double redCardHeight = 0;

  bool initialized = false;

  int playerAScore = 0;
  int playerBScore = 0;

  @override
  Widget build(BuildContext context) {
    if(initialized == false){
      blueCardHeight = MediaQuery.of(context).size.height/2;
      redCardHeight = MediaQuery.of(context).size.height/2;
      initialized = true;
    }
    return Scaffold(
      body: Column(
        children: [
          MaterialButton(
            onPressed: () {
              print(blueCardHeight);
              setState(() {
                blueCardHeight = blueCardHeight + 30;
                redCardHeight = redCardHeight - 30;

                playerBScore = playerBScore + 5;
              });
              double winningHeight = MediaQuery.of(context).size.height - 60;
              if(blueCardHeight > winningHeight){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> ResultPage(playerBScore, "B")));
              }

            },
            padding: EdgeInsets.zero,
            child: Container(
              width: double.infinity,
              height: blueCardHeight,
              color: Colors.lightBlue,
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: Text("Player B", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                  ),
                  Text(playerBScore.toString()),
            
                ],
              ),
            ),
          ),

          MaterialButton(
            onPressed: () {
              setState(() {
                redCardHeight = redCardHeight + 30;
                blueCardHeight = blueCardHeight - 30;

                playerAScore = playerAScore + 5;
              });
              // double screenHeight = MediaQuery.of(context).size.height;
              double winningHeight = MediaQuery.of(context).size.height - 60;

              if(redCardHeight > winningHeight){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> ResultPage(playerAScore, "A")));
              }

            },
            padding: EdgeInsets.zero,
            child: Container(
              width: double.infinity,
              height: redCardHeight,
              color: Colors.pinkAccent,
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: Text("Player A", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                  ),
                  Text(playerAScore.toString()),
            
                ],
              ),
            ),
          )


        ],
      ),
    );
  }
}

class ResultPage extends StatelessWidget{

  int score = 0;
  String player = "";

  ResultPage(this.score, this.player);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: player == "A" ? Colors.pinkAccent : Colors.lightBlue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(score.toString(), style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),),
            Text(
              player == "A" ? "Player A Won" : "Player B Won",
              style: TextStyle(fontSize: 35),),
            MaterialButton(onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            color: Colors.white,
            child: Text("Restart Game"),
            )
        
          ],
        ),
      ),

    );
  }
}