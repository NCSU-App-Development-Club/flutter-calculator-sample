# calculator

A simple calculator app in Flutter that demonstrates Flutter's many features. The calculator is not complete and only supports basic operations (and may have a bug or two).

I made this so you guys can see how a real-world app might be structured and how functionality is implemented. I've left A LOT of comments in the code to explain what's going on. I also hope this can be a good reference for you guys when you're working on the project we're gonna cook up.

I heavily recommend reading through the code and experimenting by running the app and changing things to see how it all works!

I'd suggest starting by looking at the `main.dart` file and then moving on to the `home_screen.dart` file, and then just branching out to what interests you most. **Remember that you can CTRL + click on a function or class or anything to jump to its definition or where it's used, and hover over Flutter classes/functions to view their documentation.**

Please ask questions in the Discord if something doesn't make sense or if you want to know more about something!

## file structure

- `lib/main.dart` : The entry point of the application. It's where we define the global theme of the app and the initial widget to use as our homepage.

---

- `lib/logic` : The logic folder contains the business logic of the app.
- `lib/logic/calculator.dart` : This file contains the `Calculator` class which is responsible for the calculations in the app.
- `lib/logic/exceptions.dart` : This file contains the custom exceptions used in the app.

---

- `lib/ui` : The ui folder contains the user interface of the app.
- `lib/ui/home_screen.dart` : This file contains the `HomeScreen` widget which is the main and only screen of the app.
- `lib/ui/views` : This folder contains the two "views" in HomeScreen, the top "number view" where the user sees the numbers and the bottom "button view" where the user presses a grid of buttons.
- `lib/ui/components` : This folder contains the components used in the app. There's just one component, the `CalculatorButton` widget which is a custom button widget used in the grid of buttons.

---

In a more complicated app, we might split things up even more, such as having separate folders for separate screens and so on. But for this simple app, this structure is enough.
