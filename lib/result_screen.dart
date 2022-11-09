import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quiz_app/play_quiz_screen.dart';

import 'const.dart';

class ResultScreen extends StatelessWidget {
  final int correctAnswers;
  final int wrongAnswers;

  const ResultScreen({
    super.key,
    required this.correctAnswers,
    required this.wrongAnswers,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Result', style: TextStyle(color: backgroundColor)),
        iconTheme: const IconThemeData(color: backgroundColor),
        backgroundColor: foregroundColor,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                answerTab(title: 'Correct Answers', count: correctAnswers),
                answerTab(title: 'Wrong Answers', count: wrongAnswers),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PlayQuizScreen(),
                      ),
                      (route) => false);
                },
                style:
                    ElevatedButton.styleFrom(backgroundColor: foregroundColor),
                child: Text(
                  'Restart Quiz',
                  style: TextStyle(
                    color: backgroundColor,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

class answerTab extends StatelessWidget {
  final String title;
  final int count;

  const answerTab({
    Key? key,
    required this.title,
    required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          count.toString(),
          style: const TextStyle(
            color: foregroundColor,
            fontSize: 60,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
