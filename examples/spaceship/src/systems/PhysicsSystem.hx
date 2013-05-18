package systems;

import animal.core.System;
import animal.core.Entity;
import animal.core.Entity.ComponentRetriever;

import components.Position;

class PhysicsSystem extends System {
  public function new() {
    super(['components.Position']);
  }

  override public function update(delta : Int) : Void {
    var r : ComponentRetriever<components.Position> = new ComponentRetriever<components.Position>('components.Position');
    for (e in entities) {
      var position : Position = r.get(e);
      trace(position.x);
    }
  }
}