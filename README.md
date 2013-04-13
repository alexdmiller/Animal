Animal
======

Animal is a cross platform component-entity-system game engine written in Haxe.

Description
===========

This framework manages the creation and interaction of game objects. What do we mean by a game object? In classic object-oriented game programming, a class is written for every object in the game universe. Some redundancy can be removed by creating a class hierarchy of game objects, but the system inevitably becomes rigid and complicated as more classes are added. Furthermore, the class hierarchy lacks modularity, because multiple-inheritance is either not possible or confusing.

In a Component-Entity-System framework, we throw out the game object. We split the code that goes inside of a game object between three new pieces: components, entities, and systems.

Entities
--------

In the Animal framework, game objects are called entities. Entities are composed of components. The Entity class is never extended; it's just a dumb container for components. Depending on what components you add to an entity, it will take on different behavior and attributes.

Components
--------

Components are chunks of data that can be attached to entities. They don't contain any game logic, they just contain data. For example, a component could contain fields for the x, y and z coordinates of an entity. Some examples of other potential components:

- Velocity
- Power
- Renderable
- Health
- Weight

Systems
--------

The game logic for your game goes into systems. Each system only processes entities that are relevant to that system. For example, one could write a PhysicsSystem. A PhysicsSystem cares about entities which have Position, Velocity and Weight components. The system can query the GameBoard for entities which have a specific set of components.

References
----------

1. [Description of CES in Clojure](http://www.chris-granger.com/2012/12/11/anatomy-of-a-knockout/)
2. [Entity Systems wiki](http://entity-systems.wikidot.com/)
3. [Entity-Systems for MMOG](http://t-machine.org/index.php/2007/09/03/entity-systems-are-the-future-of-mmog-development-part-1/)
4. [Case study of components/systems](http://t-machine.org/index.php/2012/03/16/entity-systems-what-makes-good-components-good-entities/)
5. [Game Programming Patterns: Components](http://gameprogrammingpatterns.com/component.html)
6. [Artemis (Java Entity-System Engine)](http://gamadu.com/artemis/)
7. [HashDS (Haxe Entity-System Engine)](https://github.com/Glidias/HashDS)