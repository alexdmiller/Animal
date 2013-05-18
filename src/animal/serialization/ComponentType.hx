package animal.serialization;

import animal.core.Component;

import haxe.Json;

class ComponentType {
  public static function decode(serialized : String) : Component {
    var jsonObject : Dynamic = Json.parse(serialized);
    var className : String = jsonObject.type;
    var component : Component = Type.createInstance(Type.resolveClass(className), [jsonObject]);
    return component;
  }

  public static function encode(component : Component) : String {
    return "";
  }
}