import 'package:flutter/material.dart';

import '../../logic/calculator.dart';

// a fancy calculator button
// could use a built in widget like TextButton or ElevatedButton
// but we're making our own for fun (and extra control over how it looks)
// we'll use this in ButtonView
class CalculatorButton extends StatelessWidget {
  // the type of button, i.e. number, operator, equals, clear
  final ButtonType buttonType;
  // callback function that gets called when the button is pressed
  final void Function(ButtonType)? onPressed;

  const CalculatorButton({super.key, required this.buttonType, this.onPressed});

  @override
  Widget build(BuildContext context) {
    // Card has nice rounded corners and a shadow
    // it's like a Container but with some extra styling built in
    return Card(
      color: buttonType.getColor(context),
      // Inkwell makes its child interactive
      // it's like a GestureDetector but with some extra styling built in
      // such as a ripple animation when the button is pressed
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        // when the button is pressed, call the onPressed function
        // and pass in the buttonType so the parent widget knows which button was pressed
        onTap: () => onPressed?.call(buttonType),
        child: Center(
          child: Text(
            buttonType.value,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
      ),
    );
  }
}

// a sealed class is an abstract class that can only be extended by classes in the same file
// this lets us define a finite number of classes that can extend ButtonType
// and we can use these in a switch statement to handle different button presses
// think of it like the enum from calculator.dart but fancier
// read more: https://dart.dev/language/class-modifiers
sealed class ButtonType {
  // the value of the button, i.e. the text that will be displayed on the button
  final String value;

  // we'll have a color associated with each button type
  // this is so we can color the buttons differently
  // we pass in the BuildContext so we can access the theme of the app
  Color? getColor(BuildContext context) {
    // this is the default color (primary color of the theme for containers e.g. our buttons)
    // we can override this in the subclasses
    return Theme.of(context).colorScheme.primaryContainer;
  }

  const ButtonType(this.value);
}

// a button that represents a number (or other symbol like ".") has been pressed
class NumberButton extends ButtonType {
  const NumberButton(super.value);
}

// a button that represents an operator has been pressed
class OperatorButton extends ButtonType {
  // the operator that was pressed
  final Operator operator;

  @override
  Color? getColor(BuildContext context) {
    // we'll color the operator buttons differently
    // so we can differentiate them from the number buttons
    return Theme.of(context).colorScheme.secondaryContainer;
  }

  // : super() calls the constructor of the parent class
  // so we can assign ButtonType.value to the symbol of the operator
  OperatorButton(this.operator) : super(operator.symbol);
}

// a button that represents the equals sign has been pressed
class EqualsButton extends ButtonType {
  @override
  Color? getColor(BuildContext context) {
    // we'll color the equals button differently
    // so we can differentiate it from the other buttons
    return Theme.of(context).colorScheme.tertiaryContainer;
  }

  const EqualsButton() : super('=');
}

// a button that represents the clear button has been pressed
class ClearButton extends ButtonType {
  @override
  Color? getColor(BuildContext context) {
    // we'll color the clear button differently
    // so we can differentiate it from the other buttons
    return Theme.of(context).colorScheme.errorContainer;
  }

  const ClearButton() : super('C');
}
