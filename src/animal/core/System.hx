package animal.core;

import haxe.FastList;

class System {
  public var board(default, default) : GameBoard;
  private var interest : Array<Component>;
  private var entities : FastList<Entity>;


  public function new(interest : Array<Class>) {
    this.interest = interest;
    this.entities = new FastList<Entity>();
  }

  public function isInteresed(e : Entity) : Bool {

  }

  public function insert(e : Entity) : Void {

  }

  public function remove(e : Entity) : Void {

  }

  // delta? final?
  public function update() : Void {

  }

  // abstract?
  public function process(e : Entity) : Void {}

  private function onEntityAddedToBoard(event : Dynamic) : Void {

  }

  private function onEntityRemovedFromBoard(event : Dynamic) : Void {
    
  }

  private function onEntityChanged(event : Dynamic) : Void {
    
  }
}