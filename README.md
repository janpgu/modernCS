# ModernCS - A Modern Cheat Sheet Class for LaTeX
ModernCS is a custom [LaTeX](https://en.wikipedia.org/wiki/LaTeX) class designed to facilitate the creation of beautiful cheat sheets. It aims to provide a simple set of tools to generate modern looking documents where it's easy to find whatever you're looking for at a glance.

## Getting Started

The following three sections briefly touch upon what software you need to have installed on your system and how to use / install the modernCS class for your own cheat sheets. Additionally we provide a simple example of how to work with the class. Here's a list of important files with a short description:
* `modernCS.cls` - This is the actual class file
* `CheatSheet_Example.tex` - An example LaTeX document, which makes use of the modernCS class
* `niceListings.tex` - Some LaTeX code (you can easily customize it) to make code listings in your cheat sheet look nicer

### Prerequisites

Since this is a LaTeX class you obviously need to have a working installation of LaTeX itself, I recommend [TeXLive](https://www.tug.org/texlive/). Additionally an editor (e.g. [Sublime](https://www.sublimetext.com/3) with the [LaTeXing](http://www.latexing.com/) package) and a PDF reader (e.g. [Sumatra](https://www.sumatrapdfreader.org/free-pdf-reader.html)) are required.

### Installation
In principle, using the class is as simple as copying the `modernCS.cls` file in the same folder as your `CheatSheet.tex` file and referencing it with `\documentclass{modernCS}`. If you want the same style for code listings as shown in the example cheat sheet, you also need to place `niceListings.tex` in the same folder and load it with `\input{niceListings}` in the preamble of your cheat sheet document.

You might however want to place these files within a more general directory accessible to your LaTeX distribution of choice, such that you only have one copy of the files on your system even if you have multiple cheat sheets in multiple folders. This also allows you to just change the files in one central location once a new version is released. The steps necessary to accomplish this vary depending on your LaTeX distribution and operating system. A quick google search should enable you to do this in a few minutes.

### Simple Example
Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

## Development
### Dependencies
* [multicol](https://ctan.org/pkg/multicol?lang=en)
* [etoolbox](https://ctan.org/pkg/etoolbox?lang=en)
* [geometry](https://ctan.org/pkg/geometry?lang=en)
* [xcolor](https://ctan.org/pkg/xcolor?lang=en)
* [titlesec](https://ctan.org/pkg/titlesec?lang=en)
* [titling](https://ctan.org/pkg/titling?lang=en)
* [enumitem](https://ctan.org/pkg/enumitem?lang=en)
* [fontawesome](https://www.ctan.org/tex-archive/fonts/fontawesome)
* [hyperref](https://ctan.org/pkg/hyperref?lang=en)
* [mdframed](https://ctan.org/pkg/mdframed?lang=en)

### Upcoming Features
* Custom commands for math formulas (e.g. boxed equations) <img src="https://img.shields.io/badge/priority-high-brightgreen.svg" align="right">
* Custom command for text definitions <img src="https://img.shields.io/badge/priority-high-brightgreen.svg" align="right">
* Support for various class options such as paper size, orientation, amount of columns, and color scheme <img src="https://img.shields.io/badge/priority-medium-yellow.svg" align="right">
* More title fields such as email, donation link to thank author of a particular cheat sheet, etc. <img src="https://img.shields.io/badge/priority-medium-yellow.svg" align="right">
* Implement an option to render the entire cheat sheet more compact <img src="https://img.shields.io/badge/priority-low-red.svg" align="right">
* Possibility to specify a logo for the title section (e.g. the Python logo for a Python cheat sheet) <img src="https://img.shields.io/badge/priority-low-red.svg" align="right">

<!-- ## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags).  -->

## Authors

* **Jan P. Guggenbuehler**

<!-- ## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details -->

## Acknowledgments

* [ShareLatex - Writing your own class](https://www.sharelatex.com/learn/Writing_your_own_class)
* [James Allen - How to write a LaTeX class file and design your own CV](https://www.sharelatex.com/blog/2011/03/27/how-to-write-a-latex-class-file-and-design-your-own-cv.html)
* [The LaTeX3 Project - LaTeX2e for class and package writers](https://www.latex-project.org/help/documentation/clsguide.pdf)