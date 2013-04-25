package animal.core;

class EntityTable {
  /**
   * Maps entity IDs to arrays of components for that entity.
   */
  private var entities : Hash<Array<Component>>;

  /**
   * Maps aspects (groups of components) to entities that have those components.
   */
  private var aspects : Hash<Array<Entity>>;

  public function new() {
    entities = new Hash<Array<Component>>();
    aspects = new Hash<Array<Entity>>();
  }

  public function createEntity() : Entity {
    return null;
  }

  public function removeEntity(entity : Entity) : Void {

  }

  public function addComponentToEntity(entity : Entity, components) : Void {

  }

  public function removeComponentFromEntity(entity, components) {

  }

  public function registerAspect(aspect) {

  }

  public function unregisterAspect(aspect) {

  }
}