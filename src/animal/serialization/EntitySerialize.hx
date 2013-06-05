package animal.serialization;

import animal.core.Component;
import animal.core.Entity;

import haxe.Json;

class EntitySerialize {
  public static function decodeJSON(jsonObject : Array<Dynamic>) : Entity {
    var entity : Entity = new Entity();
    var components : Array<Component> = new Array<Component>();
    for (componentDef in jsonObject) {
      entity.addComponent(ComponentSerialize.decodeJSON(componentDef));
    }
    return entity;
  }

  public static function decodeString(serialized : String) : Entity {
    var jsonObject : Dynamic = Json.parse(serialized);
    return decodeJSON(jsonObject);
  }

  public static function encode(component : Component) : String {
    return "";
  }
}