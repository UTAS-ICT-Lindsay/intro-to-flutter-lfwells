# Getting Started with Flutter
This repository gives you a playground for trying out Flutter. It is set up to install Flutter in a virtual environment.
The virtual environment means you don't install anything on your computer. We're technically making a Flutter *Linux* build, and viewing it over a remove *VNC* connection, but that's just so that we can play with Flutter immediately.
You can do this workshop and use the code in this repository outside of a codespace if you like, just skip to **Working with this outside of a Codespace** below.

## Step 1. Open the Codespace
Use the link below, it will create a virtual codespace for you to work in in the cloud.

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/UTAS-ICT-Lindsay/ict-flutter-workshop-intro-to-flutter-intro_to_flutter?template=false)

Wait for everything to load up, you'll see some tabs for Flutter appear down the side.

## Step 2. Build the App
1. Open the **Run and Debug** Tab in VSCode ![Run and Debug Tab](.workshop_images/build_and_debug.png)
2. Click the **Green Run Arrow** ![Green Arrow](.workshop_images/green_arrow.png)

## Step 3. Open the VNC Viewer
1. Open the **Ports** Tab (you may need to open the bottom panel with this button in the top-right: ![Bottom Panel](.workshop_images/bottom_panel.png))
2. Find the item in the list for `6080`
![Ports Tab](.workshop_images/ports_tab.png)
3. Right-click this item and choose **Open in Browser**.
4. In the browser tab that appears, click **Connect**.
![Connect](.workshop_images/connect_vnc.png)

Your app should be visible.

![Flutter Sample](.workshop_images/flutter_sample.png)

## Step 3. Participate in the Workshop
1. Follow the detailed workshop instructions in [WORKSHOP.md](WORKSHOP.md).
2. Become a Flutter Master!

# Saving your work
The easiest way to do this is to **Right-Click anywhere in the File Explorer List** (on the empty space, not on a specific file or folder), and choose **Download**.

# Working with this code outside of a Codespace
- Clone to repository to your computer (e.g. using Github Desktop, command line, etc.)
- Follow the [Quick Setup Guide on the Flutter Website](https://docs.flutter.dev/get-started/quick) for VSCode (or use Android Studio)
- Open the cloned repository in VSCode
- If you want to make your project work on Android or iOS, follow the [guides on the Flutter Website](https://docs.flutter.dev/get-started/install) to install the appropriate software.