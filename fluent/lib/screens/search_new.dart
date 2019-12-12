import 'package:fluent/utils/constants.dart';
import 'package:fluent/utils/words.dart';
import 'package:flutter/material.dart';

class SearchNew extends StatefulWidget {
  @override
  _SearchNewState createState() => _SearchNewState();
}

class _SearchNewState extends State<SearchNew> {
  List<String> displayWords = [];
  List<String> words = Words.zMap.keys.toList();

  void getListOfWords(search) {
    displayWords = words.where((i) => i.contains(search)).toList();
  }

  @override
  void initState() {
    getListOfWords("");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Constants.bColor,
      child: SafeArea(
        child: Column(
          children: <Widget>[
            MyTextField(
              onChange: (value) {
                setState(() {
                  getListOfWords(value);
                });
              },
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(24.0),
                child: Card(
                  child: ListView.separated(
                      itemCount: displayWords.length,
                      separatorBuilder: (context, index) {
                        return Divider();
                      },
                      itemBuilder: (context, index) {
                        return ExpansionTile(
                          title: Text(displayWords[index]),
                          children: <Widget>[
                            Container(
                              height: 200.0,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(Words.zMap[displayWords[index]]),
                              ),
                            )
                          ],
                        );
                      }),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
//  const MyTextField(this.controller, this.focusNode);

//  final TextEditingController controller;
//  final FocusNode focusNode;

  final Function onChange;

  const MyTextField({this.onChange});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: TextField(
        onChanged: onChange,
        //controller: controller,
        //focusNode: focusNode,
        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0x4437474F),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
          suffixIcon: Icon(Icons.search),
          border: InputBorder.none,
          hintText: "Search 'z' word for meaning...",
          contentPadding: const EdgeInsets.only(
            left: 16,
            right: 20,
            top: 14,
            bottom: 14,
          ),
        ),
      ),
    );
  }
}
