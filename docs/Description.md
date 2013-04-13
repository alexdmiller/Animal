Description
===========

In a general sense, this framework manages the creation and interaction of game objects. What do we mean by a game object? In classic object-oriented game programming, a class is written for every object in the game universe. Some redundancy can be removed by creating a class hierarchy of game objects, but the system inevitably becomes rigid and complicated as more classes are added. Furthermore, the class hierarchy lacks modularity, because multiple-inheritance is either not possible or confusing.

In a Component-Entity-System framework, the code that goes inside of a game object is split between three new pieces: components, entities, and systems.

Entities
--------

Components
--------

Systems
--------


References
----------

1. [Description of CES in Clojure](http://www.chris-granger.com/2012/12/11/anatomy-of-a-knockout/)
2. [Entity Systems wiki](http://entity-systems.wikidot.com/)
3. [Entity-Systems for MMOG](http://t-machine.org/index.php/2007/09/03/entity-systems-are-the-future-of-mmog-development-part-1/)
4. [Case study of components/systems](http://t-machine.org/index.php/2012/03/16/entity-systems-what-makes-good-components-good-entities/)
5. [Game Programming Patterns: Components](http://gameprogrammingpatterns.com/component.html)
6. [Artemis (Java Entity-System Engine)](http://gamadu.com/artemis/)
7. [HashDS (Haxe Entity-System Engine)](https://github.com/Glidias/HashDS)