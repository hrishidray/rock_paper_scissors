import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rock Paper Scissors',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const GameScreen(),
    );
  }
}

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  String _userChoice = '';
  String _computerChoice = '';
  String _result = '';

  final List<String> _choices = ['Rock', 'Paper', 'Scissors'];

  void _play(String userChoice) {
    final random = Random();
    final computerChoice = _choices[random.nextInt(_choices.length)];

    setState(() {
      _userChoice = userChoice;
      _computerChoice = computerChoice;
      _result = _getResult(userChoice, computerChoice);
    });
  }

  String _getResult(String userChoice, String computerChoice) {
    if (userChoice == computerChoice) {
      return 'It\'s a tie!';
    } else if ((userChoice == 'Rock' && computerChoice == 'Scissors') ||
        (userChoice == 'Paper' && computerChoice == 'Rock') ||
        (userChoice == 'Scissors' && computerChoice == 'Paper')) {
      return 'You win!';
    } else {
      return 'You lose!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rock Paper Scissors'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Choose your move:',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: _choices.map((choice) {
                return ElevatedButton(
                  onPressed: () => _play(choice),
                  child: Text(choice),
                );
              }).toList(),
            ),
            const SizedBox(height: 40),
            Text('Your choice: $_userChoice',
                style: const TextStyle(fontSize: 18)),
            Text('Computer\'s choice: $_computerChoice',
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            Text(_result,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
