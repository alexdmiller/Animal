package animal.core;

class Entity {
  public var id(default, null) : Int;
  private var components : Array<Component>;

  public function new(id : Int) {
    this.id = id;
  }
}