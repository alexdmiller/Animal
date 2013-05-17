package components;

import animal.core.Component;

class Position extends Component {
  public var x : Float;
  public var y : Float;

  public function new(options : Dynamic) {
    super();
    x = options.x;
    y = options.y;
  }
}