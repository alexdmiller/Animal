package animal.core;

import animal.events.EventEmitter;

class Entity extends EventEmitter {
  public var id(default, null) : Int;
  private var components : Array<Component>;

  public function new(id : Int) {
    this.id = id;
  }

  // dispatch event
  public function addComponent(c : Component) : Void {

  }

  // dispatch event
  public function removeComponent(c : Component) : Void {

  }
}