package systems;

import animal.core.System;
import animal.core.Entity;

import components.Position;
import components.Velocity;

class PhysicsSystem extends System {
  public function new() {
    super(['components.Position', 'components.Velocity']);
  }

  override public function update(delta : Int) : Void {
    for (e in entities) {
      var position : Position = Position.ret.get(e);
      var velocity : Velocity = Velocity.ret.get(e);
      position.add(velocity);
      velocity.scale(0.9);
      e.dispatch('position_changed', { position: position });
    }
  }
}