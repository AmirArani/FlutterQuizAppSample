import 'package:flutter/material.dart';
import 'package:quiz_app/quiz_questions_model.dart';
import 'package:quiz_app/result_screen.dart';

import 'const.dart';

class PlayQuizScreen extends StatefulWidget {
  const PlayQuizScreen({super.key});

  @override
  State<PlayQuizScreen> createState() => _PlayQuizScreenState();
}

class _PlayQuizScreenState extends State<PlayQuizScreen> {
  final PageController pageController = PageController();
  bool isAnswerLocked = false;
  int currentIndex = 0, correctAnswers = 0, wrongAnswers = 0;
  String correctAnswer = '', selectedAnswer = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: backgroundColor),
        centerTitle: true,
        title: const Text(
          'Play Quiz',
          style: TextStyle(color: backgroundColor),
        ),
        backgroundColor: foregroundColor,
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          if (isAnswerLocked) {
            selectedAnswer == correctAnswer ? correctAnswers++ : wrongAnswers++;
            currentIndex++;
            // pageController.jumpToPage(currentIndex) ;
            currentIndex != quizQuestions.length
                ? pageController.jumpToPage(currentIndex)
                : Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultScreen(
                        correctAnswers: correctAnswers,
                        wrongAnswers: wrongAnswers,
                      ),
                    ),
                  );
          } else {}
        },
        child: Container(
          color: foregroundColor,
          height: 70,
          alignment: Alignment.center,
          child: const Text(
            'Next',
            style: TextStyle(
              color: backgroundColor,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      body: PageView.builder(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: quizQuestions.length,
        itemBuilder: ((context, index) {
          QuizQuestionModel model = quizQuestions[index];
          return Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    model.question,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Column(
                  children: List.generate(
                    model.options.length,
                    (index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isAnswerLocked = true;
                            selectedAnswer = model.options[index];
                            correctAnswer = model.correctAnswer;
                          });
                        },
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(color: foregroundColor),
                            borderRadius: BorderRadius.circular(10),
                            color: selectedAnswer == model.options[index]
                                ? foregroundColor
                                : backgroundColor,
                          ),
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.all(14),
                          child: Text(
                            model.options[index],
                            style: const TextStyle(
                                color: Colors.white, fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
