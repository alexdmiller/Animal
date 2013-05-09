package animal.core;

import animal.events.EventEmitter;

class Entity extends EventEmitter {
  public var id(default, null) : Int;
  private var components : Hash<Component>;

  public function new(id : Int) {
    super();
    this.id = id;
    this.components = new Hash<Component>();
  }

  // dispatch event
  public function addComponent(c : Component) : Void {

  }

  // dispatch event
  public function removeComponent(c : Component) : Void {

  }
}