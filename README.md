# Sentinel Game Framework

A modern ActionScript 3 game framework built on Starling, using Box2D for physics. The aim of Sentinel is to provide a consistent development experience by wrapping the Starling and Box2D libraries in Sentinel 'middleware' classes. These classes maintain their conventions and semantics across the framework, providing the highest level of readability and understanding possible.

Sentinel is broken down into three top level packages;

* `framework` - Contains foundation classes used by the entire framework.
* `gameplay` - Contains classes specific to actual gameplay such as the game [`BaseWorld`](https://github.com/MartyWallace/Sentinel/blob/master/src/sentinel/gameplay/world/BaseWorld.as) and its [`Beings`](https://github.com/MartyWallace/Sentinel/blob/master/src/sentinel/gameplay/world/Being.as).
* `testing` - Provides a small collection of classes to get up an running with temporary code (e.g. placeholder menus) as well as some debugging oriented additions including the [`TestGameplay`](https://github.com/MartyWallace/Sentinel/blob/master/src/sentinel/testing/states/TestGameplay.as) class - allowing full control of the [`Camera`](https://github.com/MartyWallace/Sentinel/blob/master/src/sentinel/gameplay/world/Camera.as) using the arrow keys.


### Quickstart.

If you're desperate to get up and running now, the classes of interest to get started are:

* [`Core`](https://github.com/MartyWallace/Sentinel/blob/master/src/sentinel/framework/Core.as) - Use this as the base class for your document class. You can look at the [DAZ example here](https://github.com/MartyWallace/DAZ3Sentinel/blob/master/src/daz/Main.as).
* [`BaseGame`](https://github.com/MartyWallace/Sentinel/blob/master/src/sentinel/framework/BaseGame.as) - Use this as the base class for your game class, passed to the constructor of `Core`. The [DAZ example of that is here](https://github.com/MartyWallace/DAZ3Sentinel/blob/master/src/daz/Game.as).


### Website.

I am attempting to maintain [the website](http://sentinel.martywallace.com) as I progress, though I do not recommend referring to the reference section of the website for the time being.


### Companion Project.

I am remaking an old ActionScript 2 game using Sentinel, which [you can view here](https://github.com/MartyWallace/DAZ3Sentinel). It should give a rough idea of how to use the framework until I have a thorough walkthrough set up on the website.



### Progress Updates, Thoughts, Issues, etc.

* [Blog](http://sentinel.martywallace.com/blog)
* [Trello](https://trello.com/b/MJgDRGyH/sentinel)
* [GitHub](https://github.com/MartyWallace/Sentinel/issues)