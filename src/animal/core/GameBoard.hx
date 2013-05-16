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
    entity.on('component_added', onComponentAddedToEntity);
    entity.on('component_removed', onComponentRemovedFromEntity);
    dispatch('entity_added', { entity: entity });
    return entity;
  }

  private function onComponentAddedToEntity(e : Dynamic) : Void {
    dispatch('component_added_to_entity', { entity: e.dispatcher, component: e.component });
  }

  private function onComponentRemovedFromEntity(e : Dynamic) : Void {
    dispatch('component_removed_from_entity', { entity: e.dispatcher, component: e.component });
  }

  public function removeEntity(entity : Entity) : Void {
    entities.remove(entity);
    entity.off('component_added', onComponentAddedToEntity);
    entity.off('component_removed', onComponentRemovedFromEntity);
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
    systems.remove(system);
    dispatch('system_removed', { system: system });
  }

  public function update(delta : Int) : Void {
    dispatch('updated', { delta: delta });
  }
}