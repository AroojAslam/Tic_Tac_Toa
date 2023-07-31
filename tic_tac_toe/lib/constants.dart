import 'package:flutter/material.dart';

TextStyle kCustomText({
  double fontSize = 16.0,
  required Color color,
  FontWeight fontWeight = FontWeight.normal
}) =>
    TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight
    );



Widget buildTeamContainer({
  required bool turnOf,
  required String teamName,
  required Color borderColor,
  required Color activeColor,
  required Color inactiveColor,
  required int score,
  required Color playerColor,
}) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Container(
      padding: EdgeInsets.only(top: 15),
      height: 100,
      width: 110,
      decoration: BoxDecoration(
        border: turnOf ? Border.all(color: borderColor, width: 3) :
        Border.all(color: Colors.transparent),
        borderRadius: BorderRadius.circular(20),
        color: turnOf ? activeColor : inactiveColor,
      ),
      child: Column(
        children: [
          Text(
            teamName,
            style: kCustomText(fontSize: 22.0, color: playerColor,
                fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 20),
          Text(
            score.toString(),
            style: kCustomText(color:playerColor, fontSize: 25.0,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
  );
}


Widget buildMianContainer(){
  return   Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Stack(children: <Widget>[ //Stack helps to overlap widgets
        Positioned( //positioned helps to position widget wherever we want.
            bottom:35, left:110,//position of the widget
            child:Container(
              transform: Matrix4.rotationZ(0.5),
              height:120,
              width:120,
              decoration:BoxDecoration(
                  border: Border.all(
                      color: Colors.purple.shade700,
                      width: 2
                  ),
                  shape:BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(30),
                  color:Colors.purple.shade200 //background color with opacity
              ),

            )
        ),
        Positioned( //positioned helps to position widget wherever we want.
            top: 100,left: 110,//position of the widget
            child:Container(
              transform: Matrix4.rotationZ(0.9),
              height:60,
              width:60,
              decoration:BoxDecoration(
                  border: Border.all(
                      color: Colors.purple.shade700,
                      width: 2
                  ),
                  shape:BoxShape.circle,

                  color:Colors.purple.shade200 //background color with opacity
              ),

            )
        ),
        Positioned( //positioned helps to position widget wherever we want.
            top:-30, right: -80,//position of the widget
            child:Container(
              transform: Matrix4.rotationZ(0.4),
              height:150,
              width:150,
              decoration:BoxDecoration(
                  border: Border.all(
                      color: Colors.purple.shade700,
                      width: 2
                  ),
                  shape:BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(30),
                  color:Colors.purple.shade200 //background color with opacity
              ),

            )
        ),
        Positioned(
            left:-80,top:-30,
            child:Container(
                height:180,
                width:180,
                decoration:BoxDecoration(
                    border: Border.all(
                        color: Colors.redAccent.shade700,
                        width: 2
                    ),
                    shape:BoxShape.circle,
                    color:Colors.redAccent.withOpacity(0.5)
                )
            )
        ),
        Positioned(
            right:20,bottom:20,
            child:Container(
                height:100,
                width:100,
                decoration:BoxDecoration(
                    border: Border.all(
                        color: Colors.redAccent.shade700,
                        width: 2
                    ),
                    shape:BoxShape.circle,
                    color:Colors.redAccent.withOpacity(0.5)
                )
            )
        ),

        Positioned(//main content container postition.
          child: Container(
            padding: EdgeInsets.only(top: 50),
            height:380,
            alignment: Alignment.center,

            child:Column(
              children: [
                Image(
                    height: 120,
                    width: 120,
                    image: AssetImage('assets/images/tic-tac-toe.png')),
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: RichText(text: TextSpan(
                      children:[
                        TextSpan(text:'TIC ',style: TextStyle(color: Colors.purple.shade700,
                          fontSize: 35,fontWeight: FontWeight.bold,
                        ) ),
                        TextSpan(text:'TAC ',style: TextStyle(
                            color: Colors.pink.shade700,
                            fontWeight: FontWeight.bold,
                            fontSize: 45) ),
                        TextSpan(text:'TOE' ,style: TextStyle(color: Colors.purple.shade700,
                          fontSize: 35,fontWeight: FontWeight.bold,)),

                      ]),

                  ),
                )
              ],
            ) ,
          ),
        )
      ],),

    ],
  );

}

