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

  private function setBoard(board : GameBoard) : GameBoard {
    if (this.board != null) {
      throw "GameBoard has already been assigned for the system.";
    }
    this.board = board;
    for (entity in board) {
      if (isInteresed(entity)) {
        entities.add(entity);
        added(entity);
      }
    }
    board.on('entity_added', onEntityAddedToBoard);
    board.on('entity_removed', onEntityRemovedFromBoard);
    board.on('component_added_to_entity', onEntityComponentsChanged);
    board.on('component_removed_from_entity', onEntityComponentsChanged);
    board.on('removed_from_board', onSystemRemovedFromBoard);
    board.on('updated', onBoardUpdated);
    dispatch('board_set', { board: board });
    return board;
  }

  private function onEntityAddedToBoard(event : Dynamic) : Void {
    if (isInteresed(event.entity)) {
      entities.add(event.entity);
      added(event.entity);
    }
  }

  private function onEntityRemovedFromBoard(event : Dynamic) : Void {
    entities.remove(event.entity);
    removed(event.entity);
  }

  private function onEntityComponentsChanged(event : Dynamic) : Void {
    if (isInteresed(event.entity)) {
      entities.add(event.entity);
      added(event.entity);
    } else {
      entities.remove(event.entity);
      removed(event.entity);
    }
  }

  private function onSystemRemovedFromBoard(event : Dynamic) : Void {
    board.off('entity_added', onEntityAddedToBoard);
    board.off('entity_removed', onEntityRemovedFromBoard);
    board.off('component_added_to_entity', onEntityComponentsChanged);
    board.off('component_removed_from_entity', onEntityComponentsChanged);
    board.off('removed_from_board', onSystemRemovedFromBoard);
  }

  private function onBoardUpdated(event : Dynamic) : Void {
    update(event.delta);
  }

  private function added(e : Entity) : Void {}
  private function removed(e : Entity) : Void {}
  private function update(delta : Int) : Void {}
}