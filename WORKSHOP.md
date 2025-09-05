# Intro to Flutter Workshop
Try to keep this tab open in VSCode, to work through the content. If you lose this tab, you can re-open it at any time by opening the `WORKSHOP.md` file in the root directory.

You may like to dock this tab to the right by right-clicking the tab, and choosing **Split Right**.

## About this Repo/Codespace
This repository gives you a playground for trying out Flutter. It is set up to install Flutter in a virtual environment. The virtual environment means you don't install anything on your computer, but has some limitations:

- We can only use Flutter Web (but the code you write can be put on Android/iOS/Windows/MacOS/Linux later)
- We don't get Hot Reload or Hot Restart (you need to refresh the page after every change) - 

## Running the Application for the First Time
1. Run the following command in your VSCode Terminal:
```sh
flutter run -d web-server --web-port=8080 --web-hostname=0.0.0.0
```
2. Open the **Ports** Tab (this is next to the Termial Tab)
3. In the list, find the item for `8080`. Click the Globe icon to **Open in Browser**.
4. If everything worked you should see the sample Flutter application load.
   - Click on the `+` button to increase the counter. Radical!
5. Return to the **Terminal** Tab, you'll need it for later.

## Explore the Project Structure
Here are the folders in the project:
- `lib` -- This folder contains all the Dart source code for the project. I've arranged each sample into a sub-folder.
- `android` and `web` -- These folders contain configuration for the different build targets
- `build` -- Output from the build process.
- `pubspec.yaml` -- Kind of like a `packages.json`, you configure your project and dependencies here.

## Try the Second Sample (Making Code Changes)
1. Open the `lib/main.dart` file.
2. To change to a different sample, we can simply change the `import` statement on **line 5**:
```dart
import 'package:intro_to_flutter/2_widgets/main.dart';
```
3. Focus the **Terminal** Tab, and press `R`.
4. **Reload** your web browser (`F5`)

*Whenever you make a code change to your project, repeat steps `3` and `4`.*

## Exploring Code Structure
Now let's take a look at `lib/main.dart`:
- The `main()` function is the entrypoint, calling `runApp()` and passing in a **Widget** caled `MyApp`.
- `MyApp` comes from the imported sample code in `lib/2_widgets`.

Open `lib/2_widgets/main.dart`. We have two simple classes in here, they're both `StatelessWidget`s:
- `MyApp` -- this creates a `MaterialApp` which is the root of the whole app, and uses Google's Material Styling. It sets the homepage of the app to `MyHomePage`. We could do routing and theming in here.
- `MyHomePage` -- this widget is the homepage, and uses a `Scaffold` to lay everything out.

The `body` of the `Scaffold` is where we put all the content of the page, basically like a `<body>` tag in HTML.

## Making Widgets
### `Text` Widget
The most basic widget, try changing your `body:` parameter to look like this: 