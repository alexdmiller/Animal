package animal.core;

import haxe.FastList;

import animal.events.EventEmitter;
import animal.core.Component;

class GameBoard extends EventEmitter {
  private var entities : FastList<Entity>;
  private var idToEntities : Hash<Entity>;
  private var systems : List<System>;

  public function new() {
    super();
    entities = new FastList<Entity>();
    systems = new List<System>();
  }

  public function createEntity(components : Array<Component>, ?id : String = null) : Entity {
    var entity = new Entity(id);
    for (c in components) {
      entity.addComponent(c);
    }
    entities.add(entity);
    if (id != null) {
      idToEntities.set(id, entity);
    }
    entity.on('component_added', onComponentAddedToEntity);
    entity.on('component_removed', onComponentRemovedFromEntity);
    dispatch('entity_added', { entity: entity });
    return entity;
  }

  public function removeEntity(entity : Entity) : Void {
    entities.remove(entity);
    if (entity.id != null) {
      idToEntities.remove(entity.id);
    }
    entity.off('component_added', onComponentAddedToEntity);
    entity.off('component_removed', onComponentRemovedFromEntity);
    dispatch('entity_removed', { entity: entity });
  }

  public function getEntityById(id : String) : Entity {
    return idToEntities.get(id);
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

  public function iterator() : Iterator<Entity> {
    return entities.iterator();
  }

  private function onComponentAddedToEntity(e : Dynamic) : Void {
    dispatch('component_added_to_entity', { entity: e.dispatcher, component: e.component });
  }

  private function onComponentRemovedFromEntity(e : Dynamic) : Void {
    dispatch('component_removed_from_entity', { entity: e.dispatcher, component: e.component });
  }
}