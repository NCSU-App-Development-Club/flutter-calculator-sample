abstract class CalculatorException implements Exception {
  String get description;
}

class LeftOperandEmptyException implements CalculatorException {
  @override
  String get description => "Left operand is empty";
}

class RightOperandEmptyException implements CalculatorException {
  @override
  String get description => "Right operand is empty";
}

class OperatorEmptyException implements CalculatorException {
  @override
  String get description => "Operator is empty";
}

class DivideByZeroException implements CalculatorException {
  @override
  String get description => "Cannot divide by zero";
}