import 'dart:math';

import 'package:fluent/utils/all.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  String selectedWord = '';
  String fullWord = '';
  int answerPosition = 0;
  var options = ["A", "A", "A", "A"];

  bool showAnswer = false;

  List<String> alphabets = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z"
  ];

  String changeSelectedWord() {
    int random = new Random().nextInt(all.length);

    String selectedWord = all[random];

    if (selectedWord.length < 3) {
      return changeSelectedWord();
    } else {
      return selectedWord;
    }
  }

  String getRandomLetter(answerLetter) {
    int random = new Random().nextInt(alphabets.length);

    String selectedLetter = alphabets[random];

    if (selectedLetter == answerLetter) {
      return getRandomLetter(answerLetter);
    } else {
      return selectedLetter;
    }
  }

  void checkSelectedAnswer() {
    setState(() {
      selectedWord = fullWord;
      showAnswer = true;
    });

    Future.delayed(const Duration(milliseconds: 2000), () {
      setState(() {
        setQuestionData();
        // Here you can write your code for open new view
      });
    });
  }

  void setQuestionData() {
    showAnswer = false;

    String word = changeSelectedWord();

    fullWord = word;

    var letters = word.split('');

    int random = new Random().nextInt(letters.length);

    String missingLetter = letters[random];

    print(word);
    print(missingLetter);
    print(random);

    selectedWord = word.replaceFirst(missingLetter, "_");

    answerPosition = new Random().nextInt(4);

    for (int i = 0; i < 4; i++) {
      options[i] = getRandomLetter(missingLetter.toUpperCase());
    }

    options[answerPosition] = missingLetter.toUpperCase();
  }

  @override
  void initState() {
    setQuestionData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 24.0, left: 24.0),
      child: Column(
        children: <Widget>[
          AppBar(
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            title: Text('The missing leter is?'),
            centerTitle: true,
            elevation: 0.0,
          ),
          Expanded(
            child: Container(),
          ),
          Card(
            child: Container(
              child: Center(
                child: Text(
                  selectedWord,
                  style: Theme.of(context).textTheme.title.copyWith(
                        color: showAnswer ? Colors.green : Colors.black,
                      ),
                ),
              ),
              height: 200.0,
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Card(
                  child: GestureDetector(
                    onTap: () {
                      checkSelectedAnswer();
                    },
                    child: Container(
                      child: Center(
                        child: Text(
                          options[0],
                        ),
                      ),
                      height: 100.0,
                      color: showAnswer
                          ? (answerPosition == 0 ? Colors.green : Colors.white)
                          : Colors.white,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  child: GestureDetector(
                    onTap: () {
                      checkSelectedAnswer();
                    },
                    child: Container(
                      child: Center(
                        child: Text(options[1]),
                      ),
                      height: 100.0,
                      color: showAnswer
                          ? (answerPosition == 1 ? Colors.green : Colors.white)
                          : Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Card(
                  child: GestureDetector(
                    onTap: () {
                      checkSelectedAnswer();
                    },
                    child: Container(
                      child: Center(
                        child: Text(options[2]),
                      ),
                      height: 100.0,
                      color: showAnswer
                          ? (answerPosition == 2 ? Colors.green : Colors.white)
                          : Colors.white,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  child: GestureDetector(
                    onTap: () {
                      checkSelectedAnswer();
                    },
                    child: Container(
                      child: Center(
                        child: Text(options[3]),
                      ),
                      height: 100.0,
                      color: showAnswer
                          ? (answerPosition == 3 ? Colors.green : Colors.white)
                          : Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(),
          ),
        ],
      ),
    );
  }
}
