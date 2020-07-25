import 'package:quizie/question.dart';

class QuizBrain {
  int _question_no = 0;
  List <Question> _question = [
    Question("Sahara is the largest desert in the World", true),
    Question("Nile is the Largest River", false),
    Question("Mitocondria is the powerhouse of the cell", true),
    Question("Sumo Wrestling is the national game of Japan", true),
    Question("Sound can travel in Vaccum", false),
    Question("India won Worldcup in 2011", true),
    Question("John Logie Baird invented television", true),
    Question("Melting point of water is 0 c", false),
    Question("Pure gold is 24 carrat", false),
    Question("TajMahal was designed by Ustaad Ahmed Lahori", true),
    Question("Paper invented by china", true),
    Question("Neuron is the longest cell in human body", true),
    Question("Ice hockey is the national game of Canada", true),

  ];

  void check() {
    if (_question_no < _question.length - 1) {
      _question_no++;
    }
    else if(_question_no ==_question.length - 1)
      {

      }
  }

  String getQuestionText() {
    return _question[_question_no].questiontext;
  }

  bool getCorrect() {
    return _question[_question_no].answer;
  }
  bool isFinished()
  {
    if(_question_no>=_question.length-1)
      {print("now returning true");
      return true;
      }
    else
      {
        return false;
      }

  }
  void reset()
  {
    _question_no=-1;
  }

}