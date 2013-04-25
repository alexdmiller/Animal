package animal.core;

class Entity {
  public var id(default, null) : Int;

  public function new(id : Int) {
    this.id = id;
  }
}