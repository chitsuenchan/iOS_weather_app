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
Mobile weather app that uses an external API to display weather information from around the world.

## Motivation <a name="motivation"></a>
This is a personal learning project aimed to teach me how to use APIs to grab live data from the internal as well as parse JSON responses, get user current location and updating UI through user interaction. 

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
          <li>Swift Language + Storyboard</li>
          <li>Creating a dark-mode enabled app</li>
          <li>Usage of vector images as image assets</li>
          <li>UITextField for user input</li>
          <li>Delegate pattern design</li>
          <li>Swift protocols and extensions</li>
          <li>Uses the URLSession to network and make HTTP requests</li>
          <li>Parse JSON with native Encodable and Decodable protocols</li>
          <li>Uses the Grand Central Dispatch to fetch the main thread</li>
          <li>Retrieval of Core Location to get the current location from the phone GPS</li>
          <li>Feature - Weather information display</li>
          <li>Feature - User able to select favourite locations</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## Build Status <a name="buildStatus"></a>
Project is completed.

## Features <a name="features"></a>
- Light and dark mode
- Search for location and display current weather
- Update weather icon based on location's weather 
- Ask for user's current location
- Reset weather to user's current location

### Light and dark mode

<img src="ExampleScreenshots/lightmode.jpg" height="500"><img src="ExampleScreenshots/darkmode.jpg" height="500">

* Displays a light or dark theme based on user's device

### Search for location and display current weather

<img src="ExampleScreenshots/searchForLocation.jpg" height="500"><img src="ExampleScreenshots/searchForLocation-2.jpg" height="500">

* User can use the search textbox to find weather information for a certain location
* User can press enter or use the magnifind glass icon

### Update weather icon based on location's weather 

<img src="ExampleScreenshots/weatherIconUpdate-1.jpg" height="500"><img src="ExampleScreenshots/weatherIconUpdate-2.jpg" height="500">

* Logged in user will have a custom .XIB message cell compared to the sender
* Custom cells will hide and display cell contents based on back-end logic

### Ask for user's current location

<img src="ExampleScreenshots/example-chatWindow-scrollableList.jpg" height="500">

* User can scroll up for previous messages
* Messages are ordered based on the message created timestamp

### Reset weather to user's current location

<img src="ExampleScreenshots/example-chatWindow-cloudMessages.jpg" height="500">

* When the user open the chatView it will trigger code to fetch the messages stored in the Cloud Firebase FireStore
* The cloud messages will provide data to the front-end such as sender, receipient, text message, timestamp

# Installation <a name="installation"></a>
* Ensure XCode is installed (only available on MacOS)
* Install the 3rd party pods by executing in terminal "pod install" in the project directory

# Execution <a name="execution"></a>
* Open the "Flash Chat iOS13.xcworkspace" file in XCode
* Once the project is open you can click the play button at the top of the IDE to run the iPhone simulator or use a physical device
