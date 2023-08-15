# Weather App
<img src="ExampleScreenshots/hongKong.jpg" height="500"><img src="ExampleScreenshots/lightmode.jpg" height="500"><img src="ExampleScreenshots/darkmode.jpg" height="500">

**Table of Contents**
- [Introduction](#introduction)
- [Motivation](#motivation)
- [Technology Used](#technologyUsed)
- [Build Status](#buildStatus)
- [Features](#features)
- [Installation](#installation)
- [Execution](#execution)

## Introduction <a name="introduction"></a>
Mobile full stack WhatsApp copy app where users can register, login and message each other in a chatroom. Messages are stored in Google Firebase.

## Motivation <a name="motivation"></a>
This is a personal learning project aimed to teach me the Table View. Table Views are used everywhere from the Mail app to Messages app. It's a crucial part of every iOS app. Thus, I want to get to grips with Table Views, creating custom cells, and making my own cloud-based backend database.

## Technology Used <a name="technologyUsed"></a>
<table>
  <tbody>
    <tr>
      <td>Language</td>
      <td>Swift</td>
    </tr>
    <tr>
      <td>Notable Technology Utilized</td>
      <td>
        <ul>
          <li>Storyboard</li>
          <li>Storing data in the cloud using Firebase Firestore</li>
          <li>Querying and sorting Firebase database</li>
          <li>Firebase for user authentication, registration and login</li>
          <li>Using UITableViews and setting their data sources and delegates</li>
          <li>Creating custom views using .xib files to modify native design components</li>
          <li>Embedding View Controllers in a Navigation Controller and understanding navigation stack</li>
          <li>Creating constants file and use static properties to store Strings and other constants</li>
          <li>Create animations using loops</li>
          <li>Using direct Segues for navigation</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## Build Status <a name="buildStatus"></a>
Project is completed.

## Features <a name="features"></a>
- Register new users
- Login for existing users
- Chat window - custom cells for different users 
- Chat window - Scrollable and ordered list 
- Chat window - Retrieval of cloud stored messages
- Chat window - Keyboard pushes up screen
- Chat window - Send a message
- Chat window - Logout 

### Register new users

<img src="ExampleScreenshots/example-register.jpg" height="500">

* User can register a new account by typing in a unique name and password longer than 6 characters.
* Registration is created through FireBase.

### Login for existing users

<img src="ExampleScreenshots/example-login.jpg" height="500">

* Existing users can login through the login screen
* Authentication is done through FireBase.

### Chat window - custom cells for different users 

<img src="ExampleScreenshots/example-chatWindow-customCells.jpg" height="500">

* Logged in user will have a custom .XIB message cell compared to the sender
* Custom cells will hide and display cell contents based on back-end logic

### Chat window - Scrollable and ordered list 

<img src="ExampleScreenshots/example-chatWindow-scrollableList.jpg" height="500">

* User can scroll up for previous messages
* Messages are ordered based on the message created timestamp

### Chat window - Retrieval of cloud stored messages

<img src="ExampleScreenshots/example-chatWindow-cloudMessages.jpg" height="500">

* When the user open the chatView it will trigger code to fetch the messages stored in the Cloud Firebase FireStore
* The cloud messages will provide data to the front-end such as sender, receipient, text message, timestamp

### Chat window - Keyboard pushes up screen

<img src="ExampleScreenshots/example-chatWindow-keyboardPushUp.jpg" height="500">

* When the user select the textbox to type the on-screen keyboard will appear and push the app upwards
* This is done using a 3rd party library named IQKeyboardManager

### Chat window - Send a message

<img src="ExampleScreenshots/example-chatWindow-sendMessage-1.jpg" height="500"><img src="ExampleScreenshots/example-chatWindow-sendMessage-2.jpg" height="500">

* User can type in a message and click the send button. This will send the message to the cloud storage
* When the message is sent it will instantly refresh the UI with the new message and scroll down automatically

### Chat window - Logout

<img src="ExampleScreenshots/example-chatWindow-logout.jpg" height="500">

* User can log out and return to the home screen

# Installation <a name="installation"></a>
* Ensure XCode is installed (only available on MacOS)
* Install the 3rd party pods by executing in terminal "pod install" in the project directory

# Execution <a name="execution"></a>
* Open the "Flash Chat iOS13.xcworkspace" file in XCode
* Once the project is open you can click the play button at the top of the IDE to run the iPhone simulator or use a physical device
