package components;

import animal.core.Component;

class Position implements Component {
  public var x : Float;
  public var y : Float;

  public function new() {
    x = 0;
    y = 0;
  }
}