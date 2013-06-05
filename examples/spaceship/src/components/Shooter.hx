package components;

import animal.core.Component;
import animal.core.Entity;

class Shooter implements Component {
  public static var ret : ComponentRetriever<Shooter> =
      new ComponentRetriever<Shooter>('components.Shooter');

  public var projectile : Dynamic;

  public function new() {
  }
}