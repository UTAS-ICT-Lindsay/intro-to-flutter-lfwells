[🏠 Back to Workshop Home](/WORKSHOP.md)

# 3. State and Interactivity
In the [`lib/main.dart`](lib/1_flutter_sample/main.dart) file, change the `import` statement on **line 5**:
```dart
import 'package:intro_to_flutter/3_state/main.dart';
```
and **Hot Restart** by pressing the green restart button ![Restart](/.workshop_images/restart.png)

The sample [`lib/3_state/main.dart`](/lib/3_state/main.dart) is similar to part 2, but with the following changes:
- `MyEpicTextBox` is now a `PollOption` which takes `text`, `color`, and `votes` parameters.
- The `PollOption` widget has a `Row` and an `ElevatedButton` to show the number of votes, and allow voting.
- We've constrained the width of the `Column` to 400 pixels, and added a question at the top.
- Using dart's awesome inline `for` syntax, we create a `PollOption` for each item in a list of options within the `Column`'s `children`:
```dart
for (var option in options.entries) PollOption(text: option.key, votes: option.value)
```
We could have also used the `map` function on the list with the spread operator `...`, but this is a bit more advanced and scary looking:
```dart
...options.entries.map((option) => PollOption(
  text: option.key, 
  votes: option.value
)),
```

## Making it Stateful
Our `MyHomePage` is still a `StatelessWidget`, but we want it to be able to update the number of votes when a button is pressed. To do this, we need to make it a `StatefulWidget`.
1. Click on the `MyHomePage` class name.
2. Choose **Ctrl+.** for the Quick Fix menu.
3. Choose **Convert to StatefulWidget**.
Notice that we now have two classes: `MyHomePage` and `_MyHomePageState`. The state class is where we will keep track of the number of votes, and is also where we will build the UI.

## Storing the State
In this example, the **state** for our application is already defined for us in `_MyHomePageState`:
```dart
final Map<String, int> options = {
    "Flutter": 0,
    "Native Kotlin": 0,
    "Native Swift": 0
};
```
It's our job to update this state using the `setState()` method. When the state updates, the UI will re-build (i.e. the `build()` method will be re-run).
**This is because our UI is a *function of the state***.

## Updating the State
We need a way to update the number of votes when a button is pressed. We can do this by passing a callback function to the `PollOption` widget that will be called when the button is pressed.
1. Add a function to `_MyHomePageState` which updates the votes for a given option:
```dart
void addVote({ required String votedFor })
{
  options[votedFor] = options[votedFor]! + 1;
}
```
2. Add another parameter to the `PollOption` widget, which is a callback function:
```dart
class PollOption extends StatelessWidget {
  final String text;
  final int votes;
  final Function() onVote; // (1) the member to store the callback

  const PollOption({
    super.key,
    required this.text,
    required this.votes,
    required this.onVote // (2) pass the callback to the widget
  });

  ...
}
```
3. Find the `ElevatedButton` within the `PollOption`. Modify it so that we call the callback function:
```dart
ElevatedButton(onPressed: () {
  onVote(); //add this line
}, child: Text("Vote ($votes)")),
```
4. Update the `Column` code where `PollOption`s are created to use the callback. The callback function calls our `addVote` function we just made, with the option we have chosen:
```dart
for (var option in options.entries) PollOption(text: option.key, votes: option.value, onVote: () { addVote(votedFor: option.key); })
```

# Hot Reload
Flutter has an amazing feature called hot reload where your application state is **preserved** even when you make code changes.

*This doesn't work in Web builds, unless you turn this feature on -- but we are using a Linux build so it will work.*

1. Click the **Vote** button a few times for each item.
2. Now change the poll question text and press save:
```dart
Padding(
  padding: const EdgeInsets.all(8.0),
  child: Text("What is the best mobile development framework (obviously it's Flutter!)", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
),
```
3. Notice that UI reloads, but your state (votes) have remained.

# ⏩ Next [A Full Sample App](/.workshop_pages/4_pokemon_app.md)

[🏠 Back to Workshop Home](/WORKSHOP.md)