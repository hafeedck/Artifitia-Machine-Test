import 'package:artifitia_machine_test/api/api.dart';
import 'package:artifitia_machine_test/common_widgets/colors/colors.dart';
import 'package:artifitia_machine_test/models/question_model.dart';
import 'package:artifitia_machine_test/service/sql_database.dart';
import 'package:artifitia_machine_test/views/sucess_failure_screen/failure_screen.dart';
import 'package:artifitia_machine_test/views/sucess_failure_screen/sucess_screen.dart';
import 'package:flutter/material.dart';

class QuizState extends ChangeNotifier {
  List<QuestionModel> questionList = [];
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  int _numOfCorrectAns = 0;
  int get numOfCorrectAns => _numOfCorrectAns;
  set numOfCorrectAns(int numOfCorrectAns) {
    _numOfCorrectAns = _numOfCorrectAns;
    notifyListeners();
  }

  double _count = 0;

  double get count => _count;

  set count(double value) {
    _count = value;
    notifyListeners();
  }

  int _questionNumber = 1;

  int get questionNumber => _questionNumber;

  set questionNumber(int questionNumber) {
    _questionNumber = questionNumber;
    notifyListeners();
  }

  PageController pagecontroller =
      PageController(viewportFraction: 1, keepPage: true);

  bool _isAnswered = false;
  bool get isAnswered => _isAnswered;

  late int _correctAns;
  int get correctAns => _correctAns;

  late int _selectedAns;
  int get selectedAns => _selectedAns;

  Future fetchQuestions() async {
    questionList.clear();
    isLoading = true;

    final response = await ApiProvider().fetchQuestions();
    // ignore: unnecessary_null_comparison
    if (response != null) {
      questionList.addAll(response);
    }
    isLoading = false;
  }

  void checkAns(QuestionModel question, int selectedIndex,
      AnimationController _animationController, BuildContext context) {
    // because once user press any option then it will run
    _isAnswered = true;
    // ignore: unrelated_type_equality_checks
    _correctAns =
        question.options.firstWhere((element) => element.isCorrect).isCorrect
            ? 1
            : 0;

    _selectedAns = selectedIndex;

    if (_correctAns == _selectedAns) _numOfCorrectAns++;

    // Once user select an ans after 1s it will go to the next qn
    Future.delayed(const Duration(seconds: 1), () {
      nextQuestion(_animationController, context);
    });
    if (_isAnswered == false) {
      Future.delayed(const Duration(seconds: 1), () {
        nextQuestion(_animationController, context);
      });
    }
  }

  nextQuestion(AnimationController _animationController, BuildContext context) {
    if (_questionNumber != questionList.length) {
      _isAnswered = false;
      pagecontroller.nextPage(
        duration: const Duration(milliseconds: 250),
        curve: Curves.ease,
      );

      // Reset the counter
      _animationController.reset();

      // Once timer is finished, go to the next question
      _animationController.forward().whenComplete(() {
        nextQuestion(_animationController, context);
      });
    } else {
      if (numOfCorrectAns == questionList.length) {
        int wrongAnswer = questionList.length - numOfCorrectAns;
        final databaseHelper = DatabaseHelper();
        databaseHelper.insertQuizData(
            numOfCorrectAns.toString(), wrongAnswer.toString());
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const SuccessScreen()));
      } else {
        int wrongAnswer = questionList.length - numOfCorrectAns;
        final databaseHelper = DatabaseHelper();
        databaseHelper.insertQuizData(
            numOfCorrectAns.toString(), wrongAnswer.toString());
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const FailureScreen()));
      }
    }
  }

  void updateTheQnNum(int index) {
    _questionNumber = index + 1;
  }

  getTheRightColor(int index) {
    if (isAnswered) {
      if (index == correctAns) {
        return Colors.green;
      } else if (index == selectedAns && selectedAns != correctAns) {
        return Colors.red;
      }
    }
    return Colors.grey;
  }

  pogressColor(double value) {
    if (value > 0.5) {
      return Colors.red;
    } else {
      return progessbarColor;
    }
  }
}
