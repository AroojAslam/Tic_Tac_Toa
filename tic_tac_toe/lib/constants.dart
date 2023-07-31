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
}) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Container(
      padding: EdgeInsets.only(top: 15),
      height: 100,
      width: 100,
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
            style: kCustomText(fontSize: 22.0, color: Colors.white,
                fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 20),
          Text(
            score.toString(),
            style: kCustomText(color: Colors.white, fontSize: 25.0,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
  );
}

