import 'package:flutter/animation.dart';
import 'package:quiz_app/quiz_questions_model.dart';

const backgroundColor = Color.fromRGBO(45, 27, 3, 1);
const foregroundColor = Color.fromRGBO(244, 140, 6, 1);

List<QuizQuestionModel> quizQuestions = [
  QuizQuestionModel(
    question: 'This is original Question 1',
    correctAnswer: '11',
    options: ['11', '12', '13', '14'],
  ),
  QuizQuestionModel(
    question: 'This is original Question 2',
    correctAnswer: '22',
    options: ['21', '22', '23', '24'],
  ),
  QuizQuestionModel(
    question: 'This is original Question 3',
    correctAnswer: '33',
    options: ['31', '32', '33', '34'],
  ),
  QuizQuestionModel(
    question: 'This is original Question 4',
    correctAnswer: '44',
    options: ['41', '42', '43', '44'],
  ),
];
