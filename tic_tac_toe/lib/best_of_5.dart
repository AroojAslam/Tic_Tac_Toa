import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/home_screen.dart';




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
        backgroundColor: Colors.purple.shade100,

        title: Text(
          'Best Of 5',
          style:TextStyle(
            color: Colors.purple.shade700,
            fontWeight: FontWeight.bold,
            fontSize: 23,
          )
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
            color: Colors.purple.shade700,
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
            playerColor: Colors.redAccent.shade700,
            turnOf: turnOf, // Replace with the appropriate value for Team O
            teamName: 'Player O',
            borderColor: Colors.redAccent.shade700,
            activeColor: Colors.pink.shade100,
            inactiveColor: Colors.pink.shade100,
            score: scoreO,
          ),

          buildTeamContainer(
            playerColor: Colors.purple.shade700,
            turnOf: !turnOf, // Replace with the appropriate value for Team X
            teamName: 'Player X',
            borderColor: Colors.purple.shade700,
            activeColor: Colors.purple.shade100,
            inactiveColor: Colors.purple.shade100,
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
    if(scoreO+scoreX==5){
      winner();
    }

    boxFill = 0;
  }

}
