package animal.serialization;

import animal.core.Component;

import haxe.Json;

class EntityType {
  public static function decodeJSON(jsonObject : JSON) : Component {
    
  }

  public static function decodeString(serialized : String) : Component {
    var jsonObject : Dynamic = Json.parse(serialized);
    return decodeJSON(serialized);
  }

  public static function encode(component : Component) : String {
    return "";
  }
}