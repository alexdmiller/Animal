package components;

import animal.core.Component;
import animal.core.Entity;

class KeyboardControlled implements Component {
  public static var ret : ComponentRetriever<KeyboardControlled> =
      new ComponentRetriever<KeyboardControlled>('components.KeyboardControlled');

  public var up : Int;
  public var down : Int;
  public var left : Int;
  public var right : Int;
  public var power : Float;

  public function new() {
    power = 0.5;
  }
}