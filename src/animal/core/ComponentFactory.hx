package animal.core;

class ComponentFactory {
  public static function makeComponent(options : Dynamic) : Component {
    var className : String = options.type;
    var component : Component = Type.createInstance(Type.resolveClass(className), [options]);
    return component;
  }
}