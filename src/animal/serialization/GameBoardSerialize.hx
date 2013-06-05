package animal.serialization;

import animal.core.Component;
import animal.core.Entity;
import animal.core.GameBoard;

import haxe.Json;

class GameBoardSerialize {
  public static function decodeJSON(jsonObject : Dynamic) : GameBoard {
    var board : GameBoard = new GameBoard();
    var entities : Array<Dynamic> = jsonObject.entities;
    for (entityDef in entities) {
      var e : Entity = board.createEntity();
      var components : Array<Dynamic> = entityDef;
      for (componentDef in components) {
        e.addComponent(ComponentSerialize.decodeJSON(componentDef));
      }
    }
    return board;
  }

  public static function decodeString(serialized : String) : GameBoard {
    var jsonObject : Dynamic = Json.parse(serialized);
    return decodeJSON(jsonObject);
  }

  public static function encode(component : Component) : String {
    return "";
  }
}