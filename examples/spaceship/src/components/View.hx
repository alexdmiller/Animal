package components;

import animal.core.Entity;
import animal.core.Component;

class View implements Component {
  public static var ret : ComponentRetriever<View> =
      new ComponentRetriever<View>('components.View');

  public var type : String;

  public function new() {
    type = "none";
  }
}