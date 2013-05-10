package animal.core;

import haxe.FastList;

import animal.events.EventEmitter;
import animal.core.Component;

class GameBoard extends EventEmitter {
  private var entities : FastList<Entity>;
  private var systems : List<System>;

  public function new() {
    super();
    entities = new FastList<Entity>();
    systems = new List<System>();
  }

  public function createEntity(components : Array<Component>) : Entity {
    var entity = new Entity();
    for (c in components) {
      entity.addComponent(c);
    }
    entities.add(entity);
    dispatch('entity_added', { entity: entity });
    return entity;
  }

  public function removeEntity(entity : Entity) : Void {
    entities.remove(entity);
    dispatch('entity_removed', { entity: entity });
  }

  public function iterator() : Iterator<Entity> {
    return entities.iterator();
  }

  public function addSystem(system : System) : Void {
    systems.add(system);
    system.board = this;
    dispatch('system_added', { system: system });
  }

  public function removeSystem(system : System) : Void {

  }

  private function onEntityChanged(event : Dynamic) : Void {

  }
}