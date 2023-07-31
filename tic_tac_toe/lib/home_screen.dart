import 'package:flutter/material.dart';




class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Column(
      children: [
       Container(
            height: 300,
            width: MediaQuery.of(context).size.width ,

            decoration: BoxDecoration(
              color: Colors.purple.shade200,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              )
            ),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.end,
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
                TextSpan(text:'TIC ',style: TextStyle(color: Colors.white,fontSize: 35) ),
                TextSpan(text:'TAC ',style: TextStyle(
                  color: Colors.pink.shade700,
                fontWeight: FontWeight.bold,
                fontSize: 45) ),
                    TextSpan(text:'TOE' ,style: TextStyle(color: Colors.white,fontSize: 35)),

              ]),

              ),
            )
           ],

         ),
          ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.15,),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: GestureDetector(
            child: Container(
              height: 70,
              width: MediaQuery.of(context).size.width ,
              decoration: BoxDecoration(
                color: Colors.pink.shade700,
                borderRadius: BorderRadius.circular(20),
              ),

              child: Center(child: Text('Best Of 3',
                style: TextStyle(fontSize: 20,
                    decoration: TextDecoration.none,
                color: Colors.white),)),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: GestureDetector(
            child: Container(
              height: 70,
              width: MediaQuery.of(context).size.width ,
              decoration: BoxDecoration(
                color: Colors.purple.shade200,
                borderRadius: BorderRadius.circular(20),
              ),

              child: Center(child: Text('Best Of 5',
                style: TextStyle(fontSize: 20,
                    color: Colors.pink.shade700,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none),)),
            ),
          ),
        ),
      ],
    ));
  }
}
