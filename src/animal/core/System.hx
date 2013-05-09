package animal.core;

import animal.events.EventEmitter;
import haxe.FastList;

class System extends EventEmitter {
  public var board(default, setBoard) : GameBoard;
  private var interest : Array<String>;
  private var entities : List<Entity>;

  public function new(interest : Array<String>) {
    super();
    this.interest = interest;
    this.entities = new List<Entity>();
  }

  private function setBoard(board : GameBoard) : GameBoard {
    if (this.board != null) {
      throw "GameBoard has already been assigned for the system.";
    }
    this.board = board;
    for (entity in board) {
      trace("entity: " + entity);
      if (isInteresed(entity)) {
        trace("interested");
        entities.add(entity);
      }
    }
    board.on('entity_added', onEntityAddedToBoard);
    board.on('entity_removed', onEntityRemovedFromBoard);
    dispatch('board_set', { board: board });
    return board;
  }

  private function onEntityAddedToBoard(event : Dynamic) : Void {
    if (isInteresed(event.entity)) {
      entities.add(event.entity);
    }
  }

  private function onEntityRemovedFromBoard(event : Dynamic) : Void {
    entities.remove(event.entity);
  }

  private function onEntityChanged(event : Dynamic) : Void {
    if (isInteresed(event.entity)) {
      entities.add(event.entity);
    } else {
      entities.remove(event.entity);
    }
  }
    
  public function isInteresed(e : Entity) : Bool {
    for (componentName in interest) {
      if (!e.hasComponentWithName(componentName)) {
        return false;
      }
    }
    return true;
  }

  public function containsEntity(e : Entity) : Bool {
    return Lambda.exists(entities, function(x) { return e == x; });
  }

  // delta? final?
  public function update() : Void {

  }

  // abstract?
  public function process(e : Entity) : Void {}
}