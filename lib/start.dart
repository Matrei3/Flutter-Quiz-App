import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});
  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/quiz.png',
          width: 400,
        ),
        // Opacity(
        //   opacity: 0.6,
        //   child: Image.asset(
        //     'assets/images/quiz-logo.png',
        //     width: 300,
        //   ),
        // ),

        Text(
          'Quiz',
          style: GoogleFonts.lato(
          color: Colors.tealAccent,
            fontSize: 24,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        OutlinedButton.icon(
          onPressed: startQuiz,
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(200, 50),
            foregroundColor: Colors.blue,
            backgroundColor: Colors.lightBlueAccent,
          ),
          icon: const Icon(Icons.arrow_right_alt),
          label: const Text('Incepe quizul'),
        )
      ],
    ));
  }
}
