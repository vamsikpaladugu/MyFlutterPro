import 'dart:math';

import 'package:fluent/utils/words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';

class Cards extends StatefulWidget {
  @override
  _CardsState createState() => _CardsState();
}

class _CardsState extends State<Cards> {
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

  List<Map<String, String>> lWords = [
    Words.aMap,
    Words.bMap,
    Words.cMap,
    Words.cMap,
    Words.dMap,
    Words.eMap,
    Words.fMap,
    Words.gMap,
    Words.hMap,
    Words.jMap,
    Words.kMap,
    Words.lMap,
    Words.mMap,
    Words.nMap,
    Words.oMap,
    Words.pMap,
    Words.qMap,
    Words.rMap,
    Words.sMap,
    Words.tMap,
    Words.uMap,
    Words.vMap,
    Words.wMap,
    Words.xMap,
    Words.yMap,
    Words.zMap
  ];

  List<MyWord> myWords = [];

  String selectedLetter = '';

  getRandomLetterForWord() {
    myWords.clear();

    int random = new Random().nextInt(lWords.length);

    Map<String, String> words = lWords[random];

    List<String> keys = words.keys.toList();

    setState(() {
      for (int i = 0; i < 10; i++) {
        int randomKey = new Random().nextInt(keys.length);

        String key = keys[randomKey];

        myWords.add(MyWord(key, words[key]));
      }

      selectedLetter = myWords[0].word.substring(0, 1).toUpperCase();

      print(myWords.length);
    });
  }

  @override
  void initState() {
    getRandomLetterForWord();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AppBar(
          title: Text("10 Words starts with '$selectedLetter'"),
          centerTitle: true,
          elevation: 0.0,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.75,
          child: MyTenderSwap(
            key: ObjectKey(new Random().nextInt(1000).toString()),
            myWords: myWords,
            onComplet: () {
              getRandomLetterForWord();
            },
          ),
        ),
      ],
    );
  }
}

class MyTenderSwap extends StatelessWidget {
  const MyTenderSwap({Key key, @required this.myWords, this.onComplet})
      : super(key: key);

  final List<MyWord> myWords;
  final Function onComplet;

  @override
  Widget build(BuildContext context) {
    print(myWords.length);

    return TinderSwapCard(
      orientation: AmassOrientation.BOTTOM,
      totalNum: 10,
      stackNum: 3,
      maxWidth: MediaQuery.of(context).size.width * 0.9,
      maxHeight: MediaQuery.of(context).size.height * 0.7,
      minWidth: MediaQuery.of(context).size.width * 0.8,
      minHeight: MediaQuery.of(context).size.height * 0.6,
      cardBuilder: (context, index) => Card(
        child: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Center(
                  child: Text(myWords[index].word,
                      style: Theme.of(context).textTheme.title),
                ),
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: Text(myWords[index].means),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      cardController: CardController(),
      swipeCompleteCallback: (CardSwipeOrientation orientation, int index) {
        print("$index");

        if (index == 9) {
          onComplet();
        }

        /// Get orientation & index of swiped card!
      },
    );
  }
}

class MyWord {
  final String word;
  final String means;

  MyWord(this.word, this.means);
}
