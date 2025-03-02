import 'package:flutter/material.dart';

import '../../logic/calculator.dart';
import '../components/calculator_button.dart';

// bottom component of the calculator
// grid of buttons that the user can press
class ButtonView extends StatelessWidget {
  // callback function that gets called when a button is pressed
  // i.e. whatever we assign to onButtonPressed in HomeScreen will be called
  // this is so we can update the screen and our Calculator instance
  final void Function(ButtonType)? onButtonPressed;

  const ButtonView({super.key, this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    // we create a column of rows of buttons
    // each row has 4 buttons and there are 4 rows
    // they make up a 4x4 grid of buttons
    // in addition we have an equals button at the bottom

    // the rows are wrapped in Expanded widgets so they take up all vertical space
    // the buttons are wrapped in Expanded widgets so they take up all horizontal space
    // this makes the buttons fill the screen nicely and adjust to different screen sizes
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 2,
          child: Row(
            children: [
              Expanded(
                child: CalculatorButton(
                  buttonType: NumberButton("7"),
                  onPressed: onButtonPressed,
                ),
              ),
              Expanded(
                child: CalculatorButton(
                  buttonType: NumberButton("8"),
                  onPressed: onButtonPressed,
                ),
              ),
              Expanded(
                child: CalculatorButton(
                  buttonType: NumberButton("9"),
                  onPressed: onButtonPressed,
                ),
              ),
              Expanded(
                child: CalculatorButton(
                  buttonType: OperatorButton(Operator.add),
                  onPressed: onButtonPressed,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Row(
            children: [
              Expanded(
                child: CalculatorButton(
                  buttonType: NumberButton("4"),
                  onPressed: onButtonPressed,
                ),
              ),
              Expanded(
                child: CalculatorButton(
                  buttonType: NumberButton("5"),
                  onPressed: onButtonPressed,
                ),
              ),
              Expanded(
                child: CalculatorButton(
                  buttonType: NumberButton("6"),
                  onPressed: onButtonPressed,
                ),
              ),
              Expanded(
                child: CalculatorButton(
                  buttonType: OperatorButton(Operator.subtract),
                  onPressed: onButtonPressed,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Row(
            children: [
              Expanded(
                child: CalculatorButton(
                  buttonType: NumberButton("1"),
                  onPressed: onButtonPressed,
                ),
              ),
              Expanded(
                child: CalculatorButton(
                  buttonType: NumberButton("2"),
                  onPressed: onButtonPressed,
                ),
              ),
              Expanded(
                child: CalculatorButton(
                  buttonType: NumberButton("3"),
                  onPressed: onButtonPressed,
                ),
              ),
              Expanded(
                child: CalculatorButton(
                  buttonType: OperatorButton(Operator.multiply),
                  onPressed: onButtonPressed,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Row(
            children: [
              Expanded(
                child: CalculatorButton(
                  buttonType: ClearButton(),
                  onPressed: onButtonPressed,
                ),
              ),
              Expanded(
                child: CalculatorButton(
                  buttonType: NumberButton("0"),
                  onPressed: onButtonPressed,
                ),
              ),
              Expanded(
                child: CalculatorButton(
                  buttonType: NumberButton("."),
                  onPressed: onButtonPressed,
                ),
              ),
              Expanded(
                child: CalculatorButton(
                  buttonType: OperatorButton(Operator.divide),
                  onPressed: onButtonPressed,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: CalculatorButton(
            buttonType: EqualsButton(),
            onPressed: onButtonPressed,
          ),
        ),
      ],
    );
  }
}
