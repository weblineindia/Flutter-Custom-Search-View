# Flutter - OTP Authentication

A Flutter based Search Field component, used to search data from network, local db or array.


## Table of contents
- [Flutter Support](#flutter-support)
- [Demo](#demo)
- [Features](#features)
- [Getting started](#getting-started)
- [Usage](#usage)
- [Methods](#methods)
- [Want to Contribute?](#want-to-contribute)
- [Need Help / Support?](#need-help)
- [Collection of Components](#collection-of-Components)
- [Changelog](#changelog)
- [License](#license)
- [Keywords](#Keywords)


## Flutter Support

Version - Flutter 3.13.1 (stable)

We have tested our program in above version, however you can use it in other versions as well.


## Demo
[![](wliotpauthentication.jpg)](./search_field.gif)

------

## Features

* Search field with list suggestion.

## Getting started

* Download this sample project and import widget dart files in your Flutter App.
* Update Widgets UI based on your requirements.


## Usage

Setup process is described below to integrate in sample project.

### Methods

Configure Search Filed Widget e.g

    // Put Search Filed Widget
    SearchField(
        selectedData : _callBackFunction
    );
       
    // Create callback function 
    void _callBackFunction(String selectedData) {
        // place your code
    }

    // Fields
    controller : TextEditing controller to retrive data from Search Filed
    enabled : Boolean field for enable or disable widget
    labelText: Text for label need to show in search field
    focusNode: Object for focous node
    key: Unique key for widget
    readOnly: Boolean value tp make search field readonly
    
------

## Want to Contribute?

- Created something awesome, made this code better, added some functionality, or whatever (this is the hardest part).
- [Fork it](http://help.github.com/forking/).
- Create new branch to contribute your changes.
- Commit all your changes to your branch.
- Submit a [pull request](http://help.github.com/pull-requests/).

------

## Collection of Components
We have built many other components and free resources for software development in various programming languages. Kindly click here to view our [Free Resources for Software Development.](https://www.weblineindia.com/software-development-resources.html)
 
------

## Changelog
Detailed changes for each release are documented in [CHANGELOG](./CHANGELOG).


## License
[MIT](LICENSE)

[mit]: ./LICENSE


## Keywords
Flutter-Search-Field, Search-Field, List-Search-Field, Search-Text-Field
