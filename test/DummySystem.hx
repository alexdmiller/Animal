package;

import haxe.FastList;

import animal.core.System;
import animal.core.Entity;

class DummySystem extends System {
  public function new() {
    super(['DummyComponent', 'dummypackage.DummyComponent3']);
  }

  public function getEntities() : List<Entity> {
    return this.entities;
  }
}