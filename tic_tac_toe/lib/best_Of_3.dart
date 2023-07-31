import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/home_screen.dart';
import 'main.dart';




class Best_Of_3 extends StatefulWidget {
  const Best_Of_3({ Key? key}) : super(key: key);


  @override
  _Best_Of_3State createState() => _Best_Of_3State();
}

class _Best_Of_3State extends State<Best_Of_3> {


  int randomIndex = Random().nextInt(9);
  int scoreX = 0;
  int scoreO = 0;
  bool turnOf = true;
  int boxFill = 0;
  final List<String> playerInput = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor:KPinklight(),

        title: Text(
            'Best Of 3',
            style:TextStyle(
              color:KpinkDark(),
              fontWeight: FontWeight.bold,
              fontSize: 23,
            )
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          color: KpinkDark(),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => HomePage(),));
          },),
      ),
      backgroundColor: Colors.purple.shade50,
      body: Column(
        children: [
          SizedBox(
            height: 25,
          ),
          playerTurn(),
          gridView(),
        ],
      ),
    );
  }

  Widget playerTurn() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          buildTeamContainer(
            playerColor:  KpinkDark(),
            turnOf: turnOf, // Replace with the appropriate value for Team O
            teamName: 'Player O',
            borderColor: KpinkDark(),
            activeColor: KPinklight(),
            inactiveColor: KPinklight(),
            score: scoreO,
          ),

          buildTeamContainer(
            playerColor: KPurpleDark(),
            turnOf: !turnOf, // Replace with the appropriate value for Team X
            teamName: 'Player X',
            borderColor: KPurpleDark(),
            activeColor:  KPurplelight(),
            inactiveColor:  KPurplelight(),
            score: scoreX,
          ),
        ],
      ),
    );
  }


  Widget gridView() {
    return Expanded(
      child: Center(
        child: Container(
          height: 400,
          width: 300,
          child: GridView.builder(
              itemCount: 9,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 3,
                crossAxisSpacing: 3,
              ),
              itemBuilder: (BuildContext context, int index) {

                return  GestureDetector(
                  onTap: (){
                    _tapped(index);
                  },
                  child: Container(
                      decoration:
                      BoxDecoration(border: Border.all(color:
                      KpinkDark())),
                      child: Center(
                        child: Text(playerInput[index],
                          style: TextStyle(
                              color:
                              playerInput[index] == 'x' ? KPurpleDark() :
                              KpinkDark(),
                              fontSize: 80,fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                );

              }),
        ),
      ),
    );
  }


  void _tapped(int index) {

    setState(() {
      if (turnOf && playerInput[index] == '' ) {
        playerInput[index] = 'o';
        turnOf = !turnOf;
        boxFill += 1;
      }
      else if (!turnOf && playerInput[index] == '') {
        playerInput[index] = 'x';
        turnOf = !turnOf;
        boxFill += 1;
      }
      _checkTheWinner();
    });
    print(randomIndex );
    print(index );

  }

  void _checkTheWinner() {
    // check first row
    if (playerInput[0] == playerInput[1] &&
        playerInput[0] == playerInput[2] &&
        playerInput[0] != '') {
      if(playerInput[0]=='o'){
        scoreO+=1;
        _clearBoard();
      }else if(playerInput[0]=='x'){
        scoreX+=1;
        _clearBoard();
      }
      return;
    }

    // check second row
    if (playerInput[3] == playerInput[4] &&
        playerInput[3] == playerInput[5] &&
        playerInput[3] != '') {
      if(playerInput[3]=='o'){
        scoreO+=1;
        _clearBoard();
      }else if(playerInput[3]=='x'){
        scoreX+=1;
        _clearBoard();
      }
      return ;
    }

    // check third row
    if (playerInput[6] == playerInput[7] &&
        playerInput[6] == playerInput[8] &&
        playerInput[6] != '') {
      if(playerInput[6]=='o'){
        scoreO+=1;
        _clearBoard();
      }else if(playerInput[6]=='x'){
        scoreX+=1;
        _clearBoard();
      }
      return;
    }

    // check first column
    if (playerInput[0] == playerInput[3] &&
        playerInput[0] == playerInput[6] &&
        playerInput[0] != '') {
      if(playerInput[0]=='o'){
        scoreO+=1;
        _clearBoard();
      }else if(playerInput[0]=='x'){
        scoreX+=1;
        _clearBoard();
      }
      return;
    }

    // check second column
    if (playerInput[1] == playerInput[4] &&
        playerInput[1] == playerInput[7] &&
        playerInput[1] != '') {
      if(playerInput[1]=='o'){
        scoreO+=1;
        _clearBoard();
      }else if(playerInput[1]=='x'){
        scoreX+=1;
        _clearBoard();
      }
      return;
    }

    // check third column
    if (playerInput[2] == playerInput[5] &&
        playerInput[2] == playerInput[8] &&
        playerInput[2] != '') {
      if(playerInput[2]=='o'){
        scoreO+=1;
        _clearBoard();
      }else if(playerInput[2]=='x'){
        scoreX+=1;
        _clearBoard();
      }
      return;
    }

    // check diagonal
    if (playerInput[0] == playerInput[4] &&
        playerInput[0] == playerInput[8] &&
        playerInput[0] != '') {
      if(playerInput[0]=='o'){
        scoreO+=1;
        _clearBoard();
      }else if(playerInput[0]=='x'){
        scoreX+=1;
        _clearBoard();
      }
      return;
    }

    // check diagonal
    if (playerInput[2] == playerInput[4] &&
        playerInput[2] == playerInput[6] &&
        playerInput[2] != '') {
      if(playerInput[2]=='o'){
        scoreO+=1;
        _clearBoard();
      }else if(playerInput[2]=='x'){
        scoreX+=1;
        _clearBoard();
      }
      return;
    }

    if (boxFill == 9) {
      _clearBoard();


    }

  }
  void winner(){
    bool win;
    if(scoreX > scoreO){
      win =true;
    }else{
      win=false;
    }
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: win ? Text('Player X WIN'):Text('Player O WIN'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),));
            },
            child: Container(
              color: Colors.purple,
              padding: const EdgeInsets.all(14),
              child: const Text("okay",style: TextStyle(color: Colors.white),),
            ),
          ),
        ],
      ),
    );
    setState(() {

      scoreO=0;
      scoreX=0;
    });
  }


  void _clearBoard() {

    setState(() {
      for (int i = 0; i < 9; i++) {
        playerInput[i] = '';
      }
    });

     if(scoreX+scoreO==3){
       winner();
     }

    boxFill = 0;
  }

}
