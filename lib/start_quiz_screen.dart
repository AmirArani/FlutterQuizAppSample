import 'package:flutter/material.dart';
import 'package:quiz_app/const.dart';
import 'package:quiz_app/play_quiz_screen.dart';

class StartQuizScreen extends StatelessWidget {
  const StartQuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Start Quiz',
          style: TextStyle(color: backgroundColor),
        ),
        backgroundColor: foregroundColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'Quiz App',
              style: TextStyle(
                color: foregroundColor,
                fontSize: 40,
                fontWeight: FontWeight.w500,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PlayQuizScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: foregroundColor),
              child: const Text(
                'Start Quiz',
                style: TextStyle(color: backgroundColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
