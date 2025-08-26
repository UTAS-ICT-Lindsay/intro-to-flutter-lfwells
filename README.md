# Getting Started with Flutter
This repository gives you a playground for trying out Flutter. It is set up to install Flutter in a virtual environment.
The virtual environment means you don't install anything on your computer, but has some limitations:
- We can only use Flutter Web (but the code you write can be put on Android/iOS/Windows/MacOS/Linux later)
- We don't get Hot Reload or Hot Restart (you need to refresh the page after every change)
You can do this workshop and use the code in this repository outside of a codespace if you like, just skip to **Working with this outside of a Codespace** below.

## Step 1. Open the Codespace
Click on **<Code>** then **Codespaces** then **Create Codespace on main**.
It might take a few minutes to load up, but once done, you'll be working inside an online VSCode instance.

## Step 2. Run Flutter Web
In the Terminal in VSCode, run the following command:
```sh
flutter run -d web-server --web-port=8080 --web-hostname=0.0.0.0
```
When prompted, click "Open in Browser", or navigate to the "Ports" tab and open the URL listed for port "8080".

## Step 3. Participate in the Workshop
and become a Flutter Master!

## Step 4. Save your work
Push your changes to your repository to save them for the future, using the Source Control tab in VSCode.

# Working with this code outside of a Codespace (VSCode on your computer)
- Clone to repository to your computer (e.g. using Github Desktop, command line, etc.)
- Follow the [Quick Setup Guide on the Flutter Website](https://docs.flutter.dev/get-started/quick) for VSCode (or use Android Studio)
- Open the cloned repository in VSCode
- If you want to make your project work on Android or iOS, follow the [guides on the Flutter Website](https://docs.flutter.dev/get-started/install) to install the appropriate software.
