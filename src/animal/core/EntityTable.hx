package animal.core;

import haxe.FastList;

class EntityTable {
  /**
   * Maps entity IDs to arrays of components for that entity.
   **/
  private var entities : Array<Array<Component>>;

  private var freeIDs : FastList<{id : Int, lowerBound : Bool}>;

  /**
   * Maps aspects (groups of components) to entities that have those components.
   **/
  private var aspects : Hash<Array<Entity>>;

  /**
   * Initially there are no entities, components or aspects stored in the table.
   */
  public function new() {
    entities = new Array<Array<Component>>();
    aspects = new Hash<Array<Entity>>();
    freeIDs = new FastList<{id : Int, lowerBound : Bool}>();
    freeIDs.add({id: 0, lowerBound: false});
  }

  /**
   * Adds an entity to the table and returns it. The entity contains the passed
   * components.
   * @param components Components to be added to the new Entity
   * @return The new Entity that is inside the table
   * TODO: events
   **/
  public function createEntity(?components : Array<Component>) : Entity {
    var e : Entity  = new Entity(getAvailableEntityID());
    if (components != null) {
      entities[e.id] = components;
    } else {
      entities[e.id] = new Array<Component>();
    }
    return e;
  }

  public function removeEntity(entity : Entity) : Void {

  }

  public function getComponents(entity : Entity) : Array<Component> {
    return entities[entity.id];
  }

  public function addComponentToEntity(entity : Entity, components) : Void {

  }

  public function removeComponentFromEntity(entity, components) {

  }

  public function registerAspect(aspect) {

  }

  public function unregisterAspect(aspect) {

  }

  // TODO: clean up unused IDs
  private function getAvailableEntityID() : Int {
    var idInfo : {id : Int, lowerBound : Bool} = freeIDs.pop();
    freeIDs.add({id: idInfo.id + 1, lowerBound: false});
    return idInfo.id;
  }
}