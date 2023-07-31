import 'package:flutter/material.dart';
import 'package:tic_tac_toe/best_Of_3.dart';
import 'package:tic_tac_toe/best_of_5.dart';

import 'constants.dart';




class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade50,
      body:  SafeArea(child:
      Column(
        children: [
          buildMianContainer(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.12,),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Best_Of_3()));
              },
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width ,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: KPurpleDark(),
                    width: 2,
                  ),
                  color: KPurplelight(),
                  borderRadius: BorderRadius.circular(20),
                ),

                child: Center(child: Text('Best Of 3',
                  style: TextStyle(fontSize: 20,
                      decoration: TextDecoration.none,
                  color: KPurpleDark(),
                  fontWeight: FontWeight.bold),)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => best_Of_5()));
              },
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width ,
                decoration: BoxDecoration(
                  border: Border.all(
                    color:  KpinkDark(),
                    width: 2,
                  ),
                  color:  KPinklight(),
                  borderRadius: BorderRadius.circular(20),
                ),

                child: Center(child: Text('Best Of 5',
                  style: TextStyle(fontSize: 20,
                      color:  KpinkDark(),
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none),)),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
