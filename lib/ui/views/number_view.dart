import 'package:flutter/material.dart';

// top component of the calculator
// displays the current operation and the result if it's available
class NumberView extends StatelessWidget {
  // the current operation represented visually (like 3 + 4 or 3.2 - 1) or null if no operation yet
  final String? operation;
  // the result of the operation, if null we'll hide the text
  final String? result;

  const NumberView({super.key, this.operation, this.result});

  @override
  Widget build(BuildContext context) {
    return Column(
      // center vertically, horizontally right align the text
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Theme.of(context) lets us access the current theme of the app (defined in main.dart)
        // textTheme contains standardized text styles that comply with Android UI guidelines
        // you can define your own text styles with TextStyle(...) if you wish!
        //
        // additional info on Theme: https://docs.flutter.dev/cookbook/design/themes
        // view the different textThemes, how they look, etc. here: https://flutter.github.io/samples/web/material_3_demo/
        //
        // if operation is null, we'll display "0" instead
        Text(operation ?? "0", style: Theme.of(context).textTheme.displayLarge),

        // cool syntax that only adds the Text widget if result is not null
        // literally just an if statement inside a list
        if (result != null)
          Text(
            result!,
            // .copyWith() creates a new TextStyle with the same properties as the old one
            // but with the new properties you pass in
            //
            // here we're changing the color of the text to the secondary color of the theme
            // instead of default (white in dark theme, black in light theme)
            //
            // view the different colors of colorScheme visually here: https://flutter.github.io/samples/web/material_3_demo/
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                ),
          ),
      ],
    );
  }
}
