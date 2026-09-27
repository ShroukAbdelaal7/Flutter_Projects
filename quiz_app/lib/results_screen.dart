import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_summary.dart';

// class ResultsScreen extends StatelessWidget {
//   const ResultsScreen({super.key, required this.chosenAnswers});

//   final List<String> chosenAnswers;

//   List<Map<String, Object>> getSummaryData() {
//     final List<Map<String, Object>> summary = [];

//     for (var i = 0; i < chosenAnswers.length; i++) {
//       summary.add({
//         'question_index': i,
//         'question': questions[i].question,
//         'correct_answer': questions[i].answers[0],
//         'user_answer': chosenAnswers[i],
//       });
//     }

//     return summary;
//   }

//   @override
//   Widget build(BuildContext context) {
//     final summaryData = getSummaryData();
//     final numberOfQuestions = questions.length;
//     final correctAnswers = summaryData
//         .where((data) => data['user_answer'] == data['correct_answer'])
//         .length;

//     return SizedBox(
//       height: 300,

//       child: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               textAlign: TextAlign.center,
//               'You have completed the quiz!',
//               style: const TextStyle(
//                 color: Color.fromARGB(255, 147, 201, 226),
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Text(
//               textAlign: TextAlign.center,
//               'You answered $correctAnswers out of $numberOfQuestions questions correctly!',
//               style: const TextStyle(
//                 color: Color.fromARGB(255, 147, 201, 226),
//                 fontSize: 18,
//               ),
//             ),
//             SizedBox(height: 30),
//             QuestionSummary(summaryData: getSummaryData()),
//             SizedBox(height: 30),
//             TextButton(child: Text('Restart Quiz'), onPressed: () {}),
//             // Handle button press
//           ],
//         ),
//       ),
//     );
//   }
// }

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestart,
  });

  final void Function() onRestart;
  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].question,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswers[i],
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 230, 200, 253),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionSummary(summaryData: summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: onRestart,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.refresh),
              label: const Text('Restart Quiz!'),
            ),
          ],
        ),
      ),
    );
  }
}
