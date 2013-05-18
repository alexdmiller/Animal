package animal.core;

import animal.events.EventEmitter;

class Entity extends EventEmitter {
  public var id(default, null) : String;
  private var components : Hash<Component>;

  public function new(?id : String = null) {
    super();
    this.id = id;
    this.components = new Hash<Component>();
  }

  // dispatch event
  public function addComponent(c : Component) : Void {
    var key : String = Type.getClassName(Type.getClass(c));
    if (hasComponentWithName(key)) {
      throw "Cannot add component of type " + key + " because entity already has a component of this type.";
    }
    components.set(key, c);
    dispatch('component_added', {
      component: c
    });
  }

  public function hasComponentWithName(componentName : String) : Bool {
    return components.exists(componentName);
  }

  public function getComponentWithName(componentName : String) : Component {
    return components.get(componentName);
  }

  // dispatch event
  public function removeComponent(c : Component) : Void {
    var key : String = Type.getClassName(Type.getClass(c));
    removeComponentWithName(key);
  }

  public function removeComponentWithName(componentName : String) : Void {
    if (components.exists(componentName)) {
      var c : Component = components.get(componentName);
      components.remove(componentName);
      dispatch('component_removed', {
        component: c
      });
    }
  }
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