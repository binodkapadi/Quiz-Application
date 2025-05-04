import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'quiz_screen.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  final int totalQuestions;
  final String categoryId;
  final List<Map<String, dynamic>> answers;

  const ResultScreen({
    Key? key,
    required this.score,
    required this.totalQuestions,
    required this.categoryId,
    required this.answers,
  }) : super(key: key);

  double get percentage => (score / totalQuestions) * 100;

  int get correctAnswers => score;
  int get incorrectAnswers =>
      answers
          .where((a) => !a['isCorrect'] && a['selectedAnswer'] != 'Time Out')
          .length;
  int get notAttempted =>
      answers.where((a) => a['selectedAnswer'] == 'Time Out').length;

  String get comment {
    if (percentage >= 90) return 'Excellent! You aced it!';
    if (percentage >= 70) return 'Good job! Well done!';
    if (percentage >= 50) return 'Nice effort! Keep practicing!';
    return 'Keep learning! You can do better!';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Results'),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Result Summary Card
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              elevation: 4.0,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    const Text(
                      'Your Result',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 24.0),

                    // Score Circle
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          height: 150,
                          width: 150,
                          child: CircularProgressIndicator(
                            value: percentage / 100,
                            strokeWidth: 12,
                            backgroundColor: Colors.grey.shade300,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '$score/$totalQuestions',
                              style: const TextStyle(
                                fontSize: 28.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '${percentage.round()}%',
                              style: const TextStyle(fontSize: 20.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 24.0),

                    // Stats
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildStatCard(
                          context,
                          'Correct',
                          correctAnswers,
                          Colors.green,
                        ),
                        _buildStatCard(
                          context,
                          'Incorrect',
                          incorrectAnswers,
                          Colors.red,
                        ),
                        _buildStatCard(
                          context,
                          'Not Attempted',
                          notAttempted,
                          Colors.orange,
                        ),
                      ],
                    ),
                    const SizedBox(height: 24.0),

                    // Comment
                    Text(
                      comment,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24.0),

            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder:
                              (context) => QuizScreen(categoryId: categoryId),
                        ),
                      );
                    },
                    icon: const Icon(Icons.replay),
                    label: const Text('Play Again'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                        (route) => false,
                      );
                    },
                    icon: const Icon(Icons.home),
                    label: const Text('Home'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24.0),

            // Answer Review
            const Text(
              'Answer Review',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: answers.length,
              itemBuilder: (context, index) {
                final answer = answers[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    side: BorderSide(
                      color: answer['isCorrect'] ? Colors.green : Colors.red,
                      width: 1.0,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 32.0,
                              height: 32.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color:
                                    answer['isCorrect']
                                        ? Colors.green
                                        : Colors.red,
                              ),
                              child: Center(
                                child: Icon(
                                  answer['isCorrect']
                                      ? Icons.check
                                      : Icons.close,
                                  color: Colors.white,
                                  size: 20.0,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12.0),
                            Expanded(
                              child: Text(
                                'Question ${index + 1}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12.0),
                        Text(
                          answer['question'],
                          style: const TextStyle(fontSize: 16.0),
                        ),
                        const SizedBox(height: 12.0),

                        // Your answer
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Your answer: ',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            Expanded(
                              child: Text(
                                answer['selectedAnswer'],
                                style: TextStyle(
                                  color:
                                      answer['isCorrect']
                                          ? Colors.green
                                          : Colors.red,
                                ),
                              ),
                            ),
                          ],
                        ),

                        // Correct answer (if wrong)
                        if (!answer['isCorrect']) ...[
                          const SizedBox(height: 8.0),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Correct answer: ',
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                              Expanded(
                                child: Text(
                                  answer['correctAnswer'],
                                  style: const TextStyle(color: Colors.green),
                                ),
                              ),
                            ],
                          ),
                        ],

                        // Explanation
                        const SizedBox(height: 12.0),
                        Text(
                          answer['explanation'],
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey[700],
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(
    BuildContext context,
    String title,
    int count,
    Color color,
  ) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color.withOpacity(0.2),
          ),
          child: Icon(
            title == 'Correct'
                ? Icons.check
                : title == 'Incorrect'
                ? Icons.close
                : Icons.timer,
            color: color,
            size: 24,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          count.toString(),
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(title, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}
