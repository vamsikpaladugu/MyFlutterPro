class Calculator {
  String _firstNumber = '';
  String _secondNumber = '';
  String symbol = '';
  String answer = '0';

  String getFirstNumber() {
    return _firstNumber;
  }

  String getSecondNumber() {
    return _secondNumber;
  }

  void setNumber(String number) {
    if (answer != '0') {
      clear();
      _firstNumber = number;
      return;
    }

    if (symbol.isEmpty) {
      if (_firstNumber.length > 5 ||
          (_firstNumber.isEmpty && (number == '00' || number == '0'))) {
        return;
      }

      if (_firstNumber.isEmpty && number == '.') {
        number = '0.';
      }

      try {
        double.parse('$_firstNumber$number');
        _firstNumber = '$_firstNumber$number';
      } catch (e) {}
    } else {
      if (_secondNumber.length > 5 ||
          (_secondNumber.isEmpty && (number == '00' || number == '0'))) {
        return;
      }

      if (_secondNumber.isEmpty && number == '.') {
        number = '0.';
      }

      try {
        double.parse('$_secondNumber$number');
        _secondNumber = '$_secondNumber$number';
      } catch (e) {}
    }
  }

  void clear() {
    _firstNumber = '';
    _secondNumber = '';
    symbol = '';
    answer = '0';
  }

  void getAnswer() {
    var myAnswer;

    if (symbol == '*') {
      myAnswer = (double.parse(_firstNumber) * double.parse(_secondNumber));
    } else if (symbol == '/') {
      myAnswer = (double.parse(_firstNumber) / double.parse(_secondNumber));
    } else if (symbol == '+') {
      myAnswer = (double.parse(_firstNumber) + double.parse(_secondNumber));
    } else if (symbol == '-') {
      myAnswer = double.parse(_firstNumber) - double.parse(_secondNumber);
    }

    print(myAnswer.toString());

    if (myAnswer.toString().endsWith('.0')) {
      answer = myAnswer.toStringAsFixed(0);
    } else {
      answer = myAnswer.toStringAsFixed(3);
    }
  }

  String getSymbol() {
    return ' $symbol ';
  }

  String getAnswerValue() {
    return answer;
  }

  void setSymbol(String newSymbol) {
    if (_firstNumber.isEmpty || _firstNumber == '-') {
      return;
    }

    symbol = _secondNumber.isEmpty ? newSymbol : symbol;
  }

  void plusOrMinus() {
    if (answer != '0') {
      return;
    }

    if (symbol.isEmpty) {
      _firstNumber = _firstNumber.startsWith('-')
          ? _firstNumber.substring(1)
          : '-$_firstNumber';
    } else {
      _secondNumber = _secondNumber.startsWith('-')
          ? _secondNumber.substring(1)
          : '-$_secondNumber';
    }
  }

  void getPercentage() {
    if (symbol.isEmpty && _firstNumber.isNotEmpty) {
      answer = (double.parse(_firstNumber) / 100.0).toString();
    } else {
      return;
    }
  }
}
