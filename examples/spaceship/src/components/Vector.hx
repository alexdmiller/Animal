package components;

import animal.core.Component;

class Vector implements Component {
  public var x : Float;
  public var y : Float;

  public function new() {
    x = 0;
    y = 0;
  }

  public function add(other : Vector) : Void {
    this.x += other.x;
    this.y += other.y;
  }

  public function scale(scalar : Float) : Void {
    this.x *= scalar;
    this.y *= scalar;
  }
}