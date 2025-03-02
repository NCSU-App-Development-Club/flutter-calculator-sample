import 'exceptions.dart';

// represents the 4 operations of our calculator
enum Operator {
  add,
  subtract,
  multiply,
  divide;

  // returns the symbol of the operator
  String get symbol {
    switch (this) {
      case Operator.add:
        return "+";
      case Operator.subtract:
        return "-";
      case Operator.multiply:
        return "x";
      case Operator.divide:
        return "/";
    }
  }
}

// typical flow:
// user presses button 3 -> addDigit -> left is now 3
// user presses 4 -> left is now 34
// user presses . -> left is 34.
// presses 1 -> left is 34.1
// user presses + -> setOperator -> operator is now add
// user presses 0 -> addDigit -> right is now 0
// user presses . -> right is now 0.
// presses 1 -> right is 0.1
// so now we have 34.1 + 0.1
// once user presses =, calculate() is called and we return 34.5

class Calculator {
  // just like a 4 function calculator
  // we start by letting the user add to the left operand
  // when they press +,-,x,/, they can now add to the right operand
  String _left = "";
  String _right = "";
  Operator? _operator;
  String? result;

  // getter that returns a formatted string of the operation
  // i.e. "3 + 4" or "3.2 - 1" or "3 +" if no right operand yet
  //
  // ps: getters are just functions that look like variables
  // e.g. calculator.operation instead of calculator.operation()
  String get operation {
    if (_left.isEmpty) {
      return "0";
    } else if (_operator == null) {
      return _left;
    } else if (_right.isEmpty) {
      return "$_left ${_operator!.symbol}";
    } else {
      return "$_left ${_operator!.symbol} $_right";
    }
  }

  // setter that sets the result for any reason
  // i.e. when there is an error, we have result say "Error"

  // when C button is pressed
  void clear() {
    _left = "";
    _right = "";
    _operator = null;
    result = null;
  }

  // adds a number to the operand
  // so like, if they press 1 then the number is 1
  // if they press 3 after, then the number is 13 now
  // if they press 0, then it's 130 now
  // if they press . then it's 130.
  // if they press 7 then it's 130.7
  // ---
  // if they press +, -, x, or / afterwards,
  // we know now they want to add to the right operand
  void addDigit(String digit) {
    if (_operator == null) {
      // if no operation selected yet, add to left operand

      _left += digit;
    } else {
      // else, add to right operand

      _right += digit;
    }
  }

  // when backspace is pressed
  void removeDigit() {
    if (_operator == null) {
      // if no operation selected yet, remove from left

      _left.substring(0, _left.length - 1);
    } else {
      // else, right operand

      _right.substring(0, _right.length - 1);
    }
  }

  // sets operator (user pressed +, -, x, or /)
  // this means the user can now add to the right operand
  // i.e. they have "1234 + ???" and now they work on the ???
  void setOperator(Operator operator) => _operator = operator;

  // when = is pressed, set the result
  void calculate() {
    // if any of the operands are empty, throw an exception
    if (_left.isEmpty) throw LeftOperandEmptyException();
    if (_right.isEmpty) throw RightOperandEmptyException();
    if (_operator == null) throw OperatorEmptyException();

    // will throw FormatException if passed "" or "23......2..2" or whatever
    final left = double.parse(_left);
    final right = double.parse(_right);

    // if they divide by 0, throw an exception
    if (_operator == Operator.divide && right == 0) {
      throw DivideByZeroException();
    }

    final double tentativeResult;

    switch (_operator!) {
      case Operator.add:
        tentativeResult = left + right;
      case Operator.subtract:
        tentativeResult = left - right;
      case Operator.multiply:
        tentativeResult = left * right;
      case Operator.divide:
        tentativeResult = left / right;
    }

    result = tentativeResult.format();
  }
}

// extensions on types let us add new functionality to them without modifying the original class
// here we're adding a format() function to double
// so we can format the result of the operation to look nice in the UI
// we simply call result.format() and it will return a nicely formatted string
extension NumberFormatting on double {
  // if result is 31.0, we return "31"
  // and round everything else to 5 decimal places max
  String format() {
    String rounded = toStringAsFixed(5);
    double parsed = double.parse(rounded);
    String result = parsed.toString();
    return result.replaceAll(RegExp(r'\.0+$'), '');
  }
}
