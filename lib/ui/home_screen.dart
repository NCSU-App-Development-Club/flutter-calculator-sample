import 'package:calculator/logic/calculator.dart';
import 'package:calculator/logic/exceptions.dart';
import 'package:calculator/ui/views/button_view.dart';
import 'package:calculator/ui/views/number_view.dart';
import 'package:flutter/material.dart';

import 'components/calculator_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // private calculator instance
  // will remain even if we rebuild HomeScreen
  final Calculator _calculator = Calculator();

  // result of the operation, if null we'll hide the text
  // and if an error occurs, we'll set the result to "Error"
  String? _result;

  // this function will be called when a button is pressed
  // see the build function below to see how it's passed to ButtonView
  // see button_view.dart to see how we're using switch statements to handle different button presses
  void _onButtonPressed(ButtonType buttonType) {
    switch (buttonType) {
      case NumberButton():
        _calculator.addDigit(buttonType.value);
        break;
      case OperatorButton():
        _calculator.setOperator(buttonType.operator);
        break;
      case EqualsButton():
        try {
          _result = _calculator.calculate();
        } on CalculatorException catch (e) {
          // if there's an error, set the result to "Error"
          _result = "Error";
          // and show a snackbar with the error message
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(e.description),
            duration: const Duration(seconds: 2),
          ));
        }
        break;
      case ClearButton():
        _calculator.clear();
        _result = null;
        break;
    }

    // this will rebuild the widget with the new values
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // scaffold provides the basic structure of a page:
    // access to the theme, app bar, etc.
    // it also adds background color to the page
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator Demo"),
      ),
      // safe area is a widget that makes sure the content is not hidden by the status bar
      // and the bottom navigation bar
      body: SafeArea(
        // just some padding around the content so it doesn't touch the edges of the screen
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            // crossAxisAlignment.stretch makes the children take up all horizontal space
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // children of Expanded widgets take up all space of axis the list they're in
              // in this case it means all vertical space because they're in a column

              // flex lets you decide how much space a widget should take up
              // relative to the other expanded widgets in the same list
              // in this case, the first expanded widget takes up 1/5 of the screen
              // and the second expanded widget takes up 4/5 of the screen

              Expanded(
                flex: 1,
                child: NumberView(
                    operation: _calculator.operation, result: _result),
              ),
              Expanded(
                flex: 4,
                // pass the callback function to ButtonView
                child: ButtonView(onButtonPressed: _onButtonPressed),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
