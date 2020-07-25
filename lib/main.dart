import 'package:flutter/material.dart';
import 'package:quizie/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(Quiz());
class Quiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.yellow,
          appBar: AppBar(
            title: Text("Quizie",style: TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),),
            centerTitle: true,
            backgroundColor: Colors.deepOrange,
          ),
          body:QuizPage()

      ),
    );
  }
}


class QuizPage extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}


class _QuizState extends State<QuizPage> {
   List <Icon> scorekeeper=[];
   QuizBrain quizBrain=QuizBrain();
   void checkAnswer(bool v)
   {
     setState(() {

       if(quizBrain.isFinished()==true)
         {
           Alert(context: context, title: "Finished", desc: "End of Quiz").show();
           quizBrain.reset();
           scorekeeper=[];
         }
       else {
         if (quizBrain.getCorrect() == v) {
           scorekeeper.add(Icon(Icons.check, color: Colors.green, size: 25.0,));
         }
         else {
           scorekeeper.add(Icon(Icons.clear, color: Colors.red, size: 25.0,));
         }
       }


     quizBrain.check();
     });
   }

  @override
  Widget build(BuildContext context) {
     return Column(

       crossAxisAlignment: CrossAxisAlignment.stretch,
       children: <Widget>[

         Expanded(
           flex: 4,

           child: Padding(
             padding: const EdgeInsets.all(16.0),
             child: Container(

               alignment: Alignment.center,
               child: Text(
                 quizBrain.getQuestionText(),
                 style: TextStyle(
                   fontSize: 30.0,
                   fontWeight: FontWeight.bold,


                 ),),
             ),
           ),
         ),


         Expanded(
           flex: 1,
           child: Padding(
             padding: const EdgeInsets.all(15.0),
             child: FlatButton(
               onPressed: () {

                 checkAnswer(true);
               },
               child: Text("True",
                 style: TextStyle(
                   fontSize: 25.0,
                   fontWeight: FontWeight.bold,
                 ),),
               color: Colors.green,
             ),
           ),
         ),
         Expanded(
           flex: 1,
           child: Padding(
             padding: const EdgeInsets.all(15.0),
             child: FlatButton(
               onPressed: () {
                 checkAnswer(false);
               },
               child: Text("False",
                 style: TextStyle(
                   fontSize: 25.0,
                   fontWeight: FontWeight.bold,
                 ),),
               color: Colors.red,
             ),
           ),
         ),
         Row(
           children: scorekeeper,
         )
       ],
     ) ;
  }
}
