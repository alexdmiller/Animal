package systems;

import animal.core.System;
import animal.core.Entity;

import components.Position;
import components.Velocity;
import components.MaterialProperties;

class PhysicsSystem extends System {
  public function new() {
    super(['components.Position', 'components.Velocity']);
  }

  override public function update(delta : Int) : Void {
    for (e in entities) {
      var position : Position = Position.ret.get(e);
      var velocity : Velocity = Velocity.ret.get(e);
      position.add(velocity);
      if (MaterialProperties.ret.has(e)) {
        var props : MaterialProperties = MaterialProperties.ret.get(e);
        velocity.scale(props.friction);
      }
      e.dispatch('position_changed', { position: position });
    }
  }
}