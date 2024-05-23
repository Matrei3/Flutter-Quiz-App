import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/questions_summary.dart';

import 'data/questions.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key,required this.onRestart, required this.chosenAnswers});

  final List<String> chosenAnswers;
  final void Function() onRestart;
  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((element) {
      return element['correct_answer'] == element['user_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Ai raspuns la $numCorrectQuestions intrebari corect din $numTotalQuestions',
            style: GoogleFonts.lato(
              color: Colors.cyan,
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),textAlign: TextAlign.center,),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData: summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(onPressed: onRestart, style: TextButton.styleFrom(
              foregroundColor: Colors.white
            ),
            icon: const Icon(Icons.refresh),
            label: const Text('Restart Quiz'),)
          ],
        ),
      ),
    );
  }
}
