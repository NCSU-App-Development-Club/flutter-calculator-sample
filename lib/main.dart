import 'package:calculator/ui/home_screen.dart';
import 'package:flutter/material.dart';

// the main function is the entry point of the app
void main() {
  runApp(const MyApp());
}

// the root widget of the app
// this is where we define the theme of the app
// and the starting screen of the app
// in this case, HomeScreen
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MediaQuery lets us access information about the device the app is running on
    // such as the size of the screen, the orientation, etc.
    // we can also access the brightness of the device (light or dark mode)
    // any widget that uses MediaQuery will rebuild when the data you're accessing changes
    // so if the user changes to dark mode, the app will rebuild with the new theme
    // this happens even if the widget is stateless!
    Brightness brightness = MediaQuery.platformBrightnessOf(context);

    return MaterialApp(
      title: 'Calculator Demo',
      // set global theme of the app
      // here we are using the default Material 3 (Android UI) theme
      // change the seedColor to revamp the color palette of the app!
      // this is how Android apps match your phone's wallpaper colors
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple, brightness: brightness),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}
