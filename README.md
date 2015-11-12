# Sentinel Game Framework.

A modern ActionScript 3 game framework built on Starling, using Box2D for physics. The aim of Sentinel is to provide a consistent development experience by wrapping the Starling and Box2D libraries in Sentinel 'middleware' classes. These classes maintain their conventions and semantics across the framework, providing the highest level of readability and understanding possible.

Sentinel is broken down into three top level packages;

* `framework` - Contains foundation classes used by the entire framework.
* `gameplay` - Contains classes specific to actual gameplay such as the game [`BaseWorld`](https://github.com/MartyWallace/Sentinel/blob/master/src/sentinel/gameplay/world/BaseWorld.as) and its [`Beings`](https://github.com/MartyWallace/Sentinel/blob/master/src/sentinel/gameplay/world/Being.as).
* `testing` - Provides a small collection of classes to get up an running with temporary code (e.g. placeholder menus) as well as some debugging oriented additions including the [`TestGameplay`](https://github.com/MartyWallace/Sentinel/blob/master/src/sentinel/testing/states/TestGameplay.as) class - allowing full control of the [`Camera`](https://github.com/MartyWallace/Sentinel/blob/master/src/sentinel/gameplay/world/Camera.as) using the arrow keys.

## Resources.

* Visit the [official website](http://sentinel.martywallace.com).
* [Learn](http://sentinel.martywallace.com/learn) how to use Sentinel.
* Keep updated via the [Blog](http://sentinel.martywallace.com/blog).
* Read the [class reference](http://sentinel.martywallace.com/reference).
* Track my thoughts and possible additions on [Trello](https://trello.com/b/MJgDRGyH/sentinel).

## Companion Project.

I am remaking an old ActionScript 2 game using Sentinel, which [you can view here](https://github.com/MartyWallace/DAZ3Sentinel). It should give a rough idea of how to use the framework until I have a thorough walkthrough set up on [the website](http://sentinel.martywallace.com).
