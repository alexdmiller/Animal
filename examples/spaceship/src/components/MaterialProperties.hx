package components;

import animal.core.Component;

class MaterialProperties implements Component {
  public static var ret : ComponentRetriever<MaterialProperties> =
      new ComponentRetriever<MaterialProperties>('components.MaterialProperties');

  public var friction : Float;

  public function new() {
    friction = 0.9;
  }
}