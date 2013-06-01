package animal.core;

interface Component {
}

class ComponentRetriever<T> {
  private var name : String;

  public function new(name : String) {
    this.name = name;
  }

  public function get(entity : Entity) : T {
    return cast entity.getComponentWithName(name);
  }
}