import 'dart:async' show Timer;

import 'package:flutter/material.dart';
import '../data/quiz_data.dart';
import '../models/question.dart';
import 'result_screen.dart';

class QuizScreen extends StatefulWidget {
  final String categoryId;

  const QuizScreen({super.key, required this.categoryId});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  int _score = 0;
  bool _answered = false;
  int? _selectedOptionIndex;
  late List<Question> _questions;
  final List<Map<String, dynamic>> _answers = [];
  late int _timeLeft;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    // Shuffle and take first 10 questions
    _questions = (quizData[widget.categoryId] ?? []).toList()..shuffle();
    _questions = _questions.take(10).toList();
    _timeLeft = 60;
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timeLeft > 0) {
        setState(() {
          _timeLeft--;
        });
      } else {
        _timer.cancel();
        _handleTimeOut();
      }
    });
  }

  void _handleTimeOut() {
    if (!_answered) {
      setState(() {
        _answered = true;
        _answers.add({
          'question': _questions[_currentQuestionIndex].questionText,
          'selectedAnswer': 'Time Out',
          'correctAnswer':
              _questions[_currentQuestionIndex]
                  .options[_questions[_currentQuestionIndex]
                  .correctAnswerIndex],
          'isCorrect': false,
          'explanation': _questions[_currentQuestionIndex].explanation,
        });
      });
      _nextQuestion();
    }
  }

  void _nextQuestion() {
    Future.delayed(const Duration(seconds: 1), () {
      if (_currentQuestionIndex < _questions.length - 1) {
        setState(() {
          _currentQuestionIndex++;
          _answered = false;
          _selectedOptionIndex = null;
          _timeLeft = 60;
          _timer.cancel();
          _startTimer();
        });
      } else {
        _timer.cancel();
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder:
                (context) => ResultScreen(
                  score: _score,
                  totalQuestions: _questions.length,
                  categoryId: widget.categoryId,
                  answers: _answers,
                ),
          ),
        );
      }
    });
  }

  void _checkAnswer(int selectedIndex) {
    if (_answered) return;

    _timer.cancel();
    setState(() {
      _selectedOptionIndex = selectedIndex;
      _answered = true;

      if (selectedIndex ==
          _questions[_currentQuestionIndex].correctAnswerIndex) {
        _score++;
      }

      _answers.add({
        'question': _questions[_currentQuestionIndex].questionText,
        'selectedAnswer':
            _questions[_currentQuestionIndex].options[selectedIndex],
        'correctAnswer':
            _questions[_currentQuestionIndex]
                .options[_questions[_currentQuestionIndex].correctAnswerIndex],
        'isCorrect':
            selectedIndex ==
            _questions[_currentQuestionIndex].correctAnswerIndex,
        'explanation': _questions[_currentQuestionIndex].explanation,
      });
    });
    _nextQuestion();
  }

  // ignore: unused_element
  Color _getOptionColor(int optionIndex) {
    if (!_answered) return Colors.white;

    if (optionIndex == _questions[_currentQuestionIndex].correctAnswerIndex) {
      return Colors.green.shade100;
    } else if (optionIndex == _selectedOptionIndex) {
      return Colors.red.shade100;
    }
    return Colors.white;
  }

  IconData? _getOptionIcon(int optionIndex) {
    if (!_answered) return null;

    if (optionIndex == _questions[_currentQuestionIndex].correctAnswerIndex) {
      return Icons.check_circle;
    } else if (optionIndex == _selectedOptionIndex) {
      return Icons.cancel;
    }
    return null;
  }

  Color _getOptionIconColor(int optionIndex) {
    if (optionIndex == _questions[_currentQuestionIndex].correctAnswerIndex) {
      return Colors.green;
    }
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    if (_questions.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text('Quiz')),
        body: const Center(child: Text('No questions available')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.categoryId.substring(0, 1).toUpperCase()}${widget.categoryId.substring(1)} Quiz',
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Timer and Progress
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.timer, size: 18),
                            const SizedBox(width: 4),
                            Text(
                              '$_timeLeft sec',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Question ${_currentQuestionIndex + 1}/${_questions.length}',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        'Score: $_score',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  LinearProgressIndicator(
                    value: (_currentQuestionIndex + 1) / _questions.length,
                    backgroundColor: Colors.grey[300],
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),

            // Question and Options
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Text(
                        _questions[_currentQuestionIndex].questionText,
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 24.0),

                    // Options
                    ...List.generate(_questions[_currentQuestionIndex].options.length, (
                      index,
                    ) {
                      final option =
                          _questions[_currentQuestionIndex].options[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: BorderSide(
                              color:
                                  _answered
                                      ? (index ==
                                              _questions[_currentQuestionIndex]
                                                  .correctAnswerIndex
                                          ? Colors.green
                                          : index == _selectedOptionIndex
                                          ? Colors.red
                                          : Colors.grey.shade300)
                                      : Colors.grey.shade300,
                              width: 2,
                            ),
                          ),
                          child: InkWell(
                            onTap: _answered ? null : () => _checkAnswer(index),
                            borderRadius: BorderRadius.circular(12),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                children: [
                                  Container(
                                    width: 32,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color:
                                          _answered
                                              ? (index ==
                                                      _questions[_currentQuestionIndex]
                                                          .correctAnswerIndex
                                                  ? Colors.green.withOpacity(
                                                    0.2,
                                                  )
                                                  : index ==
                                                      _selectedOptionIndex
                                                  ? Colors.red.withOpacity(0.2)
                                                  : Colors.grey.withOpacity(
                                                    0.1,
                                                  ))
                                              : Colors.grey.withOpacity(0.1),
                                    ),
                                    child: Center(
                                      child: Text(
                                        String.fromCharCode(65 + index),
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color:
                                              _answered
                                                  ? (index ==
                                                          _questions[_currentQuestionIndex]
                                                              .correctAnswerIndex
                                                      ? Colors.green
                                                      : index ==
                                                          _selectedOptionIndex
                                                      ? Colors.red
                                                      : Colors.grey)
                                                  : Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Text(
                                      option,
                                      style: TextStyle(
                                        fontSize: 16,
                                        color:
                                            _answered
                                                ? (index ==
                                                        _questions[_currentQuestionIndex]
                                                            .correctAnswerIndex
                                                    ? Colors.green
                                                    : index ==
                                                        _selectedOptionIndex
                                                    ? Colors.red
                                                    : Colors.black)
                                                : Colors.black,
                                      ),
                                    ),
                                  ),
                                  if (_answered &&
                                      _getOptionIcon(index) != null)
                                    Icon(
                                      _getOptionIcon(index),
                                      color: _getOptionIconColor(index),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),

                    // Explanation
                    if (_answered)
                      Container(
                        margin: const EdgeInsets.only(top: 16.0),
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(color: Colors.blue.shade200),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Explanation:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              _questions[_currentQuestionIndex].explanation,
                              style: const TextStyle(fontSize: 15.0),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
