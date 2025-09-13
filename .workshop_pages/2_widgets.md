[🏠 Back to Workshop Home](/WORKSHOP.md)

# 2. Making Widgets
## `Text` Widget
[`lib/2_widgets/main.dart`](lib/2_widgets/main.dart) already has a `Text` widget in it. Try changing the text, and adding a **Parameter** for `style` to make it bigger, or change the color.
```dart
body: Text(
 'Hello, Flutter!',
 style: TextStyle(fontSize: 32, color: Colors.blue),
),
```

## `Column` Widget
Now let's add a second `Text` widget below the first one. We can use a `Column` widget to stack things vertically.
Try different values for `mainAxisAlignment`, `crossAxisAlignment`, and `mainAxisSize` to see how they change the layout.
```dart
body: Column(
   mainAxisAlignment: MainAxisAlignment.spaceAround,
   crossAxisAlignment: CrossAxisAlignment.start,
   mainAxisSize: MainAxisSize.max,
   children: [
      Text(
         'Hello, Flutter!',
         style: TextStyle(fontSize: 24, color: Colors.blue),
      ),
      Text(
         'This is a second line of text.',
         style: TextStyle(fontSize: 24, color: Colors.green),
      ),
      Text(
         'This is a third line of text.',
         style: TextStyle(fontSize: 24, color: Colors.purple),
      ),
   ],
),
```
## `Center` Widget
If you tried `crossAxisAlignment: CrossAxisAlignment.center` in the `Column`, you may have noticed it didn't work. This is because the `Column` doesn't take up the whole screen width by default.
Wrap the `Column` in a `Center` widget to fix this. We could manually do this, but let's use VSCode's Flutter extension to do it for us:
1. Click on the `Column` widget in the code.
2. Press **Ctrl+.** (Control and the period key) to open the Quick Fix menu.
3. Choose **Wrap with Center**.
4. You should now see a `Center` widget wrapping the `Column`:
```dart
body: Center(
   child: Column(
      ...
   ),
),
```

## Custom Widgets
### Extract Widget
Our three `Text` widgets are getting a bit repetitive. Let's make our own custom widget to simplify this.
1. Click on the first `Text` widget in the column.
2. Press **Ctrl+.** to open the Quick Fix menu.
3. Choose **Extract Widget**.
4. Name the new widget `MyEpicTextBox`.
5. You should now see a new `MyEpicTextBox` widget in the column, and a new class at the bottom of the file:
```dart
class MyEpicTextBox extends StatelessWidget {
  const MyEpicTextBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Hello, Flutter!',
      style: TextStyle(fontSize: 24, color: Colors.blue),
    );
  }
}
```
6. Replace the other two `Text` widgets in the column with `MyEpicTextBox()` as well:
```dart
Column(
  ...
  children: [
    MyEpicTextBox(),
    MyEpicTextBox(),
    MyEpicTextBox(),
  ],
),
```
### Custom Parameters
Our text boxes are all the same now. Let's make our `MyEpicTextBox` widget take a a parameter for the colour:
1. Change the `MyEpicTextBox` class to take a `Color` parameter (there are three steps, marked with comments):
```dart
class MyEpicTextBox extends StatelessWidget {
  final Color color; // (1) Add a member variable for the color

  const MyEpicTextBox({
    super.key,
    required this.color, // (2) Add to the constructor
  });

  @override
  Widget build(BuildContext context) {
     return Text(
        'Hello, Flutter!',
        style: TextStyle(fontSize: 24, color: color), // (3) Use the color parameter here
     );
  }
}
```
2. Now we need to pass in a color when we create the `MyEpicTextBox` widgets in the column:
```dart
 MyEpicTextBox(color: Colors.red),
 MyEpicTextBox(color: Color.fromRGBO(133, 33, 37, 1.0)),
 MyEpicTextBox(color: Theme.of(context).colorScheme.primary),
```

# ⏩ Next [State and Interactivity](/.workshop_pages/3_state.md)

[🏠 Back to Workshop Home](/WORKSHOP.md)