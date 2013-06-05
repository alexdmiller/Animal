package animal.serialization;

import animal.core.Component;

import haxe.Json;

class ComponentType {
  public static function decodeJSON(jsonObject : Dynamic) : Component {
    var className : String = jsonObject.type;
    var component : Component = Type.createInstance(Type.resolveClass(className), []);
    if (Reflect.hasField(jsonObject, 'data')) {
      for (field in Reflect.fields(jsonObject.data)) {
        Reflect.setField(component, field, Reflect.field(jsonObject.data, field));
      }  
    }
    return component;
  }

  public static function decodeString(serialized : String) : Component {
    var jsonObject : Dynamic = Json.parse(serialized);
    return decodeJSON(jsonObject);
  }

  public static function encode(component : Component) : String {
    return "";
  }
}