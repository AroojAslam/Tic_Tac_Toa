import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tic_tac_toe/constants.dart';




class best_Of_5 extends StatefulWidget {
  const best_Of_5({ Key? key}) : super(key: key);

  @override
  _best_Of_5State createState() => _best_Of_5State();
}

class _best_Of_5State extends State<best_Of_5> {
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
        backgroundColor: Colors.purple,
        title: Text(
          'Best Of 5',
          style: kCustomText(
              fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.w800),
        ),
      ),
      backgroundColor: Colors.purple.shade50,
      body: Column(
        children: [
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
            turnOf: turnOf, // Replace with the appropriate value for Team O
            teamName: 'TEAM O',
            borderColor: Colors.pink.shade900,
            activeColor: Colors.pink.shade700,
            inactiveColor: Colors.pink.shade200,
            score: scoreO,
          ),

          buildTeamContainer(
            turnOf: !turnOf, // Replace with the appropriate value for Team X
            teamName: 'TEAM X',
            borderColor: Colors.purple.shade800,
            activeColor: Colors.purple,
            inactiveColor: Colors.purple.shade300,
            score: scoreX,
          ),
        ],
      ),
    );
  }


  Widget gridView() {
    return Expanded(
      child: Container(
        height: 400,
        width: 400,
        child: GridView.builder(
            itemCount: 9,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 3,
              crossAxisSpacing: 3,
            ),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  print(playerInput);
                  _tapped(index);

                },
                child: Container(
                  decoration:
                  BoxDecoration(border: Border.all(color:
                  Colors.purple.shade700)),
                  child: Center(
                    child: Text(playerInput[index],
                      style: TextStyle(
                          color:
                          playerInput[index] == 'x' ? Colors.purple :
                          Colors.pink.shade700,
                          fontSize: 80,fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }


  void _tapped(int index) {
    setState(() {
      if (turnOf && playerInput[index] == '') {
        playerInput[index] = 'o';
        turnOf = !turnOf;
        boxFill += 1;

      } else if (!turnOf && playerInput[index] == '') {
        playerInput[index] = 'x';
        turnOf = !turnOf;
        boxFill += 1;
      }

      _checkTheWinner();
    });

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
    if(scoreX> scoreO){
      win =true;
    }else{
      win=false;
    }
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: win ? Text('TEAM X WIN'):Text('TEAM O WIN'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
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
    if(scoreO+scoreX==5){
      winner();
    }

    boxFill = 0;
  }

}
