package animal.core;

import haxe.FastList;

import animal.events.EventEmitter;
import animal.core.Component;
import animal.util.IDPool;

class GameBoard extends EventEmitter {
  private var entities : FastList<Entity>;
  private var idToEntities : Hash<Entity>;
  private var systems : List<System>;
  private var idPool : IDPool;

  public function new() {
    super();
    entities = new FastList<Entity>();
    idToEntities = new Hash<Entity>();    
    systems = new List<System>();
    //idPool = new IDPool();
  }

  public function createEntity(components : Array<Component>, ?id : String = null) : Entity {
    var entity = new Entity(id);
    if (id != null) {
      if (idToEntities.exists(id)) {
        throw "Cannot create Entity with id " + id + " because the GameBoard already has an Entity with that id.";
      }
      idToEntities.set(id, entity);
    }
    for (c in components) {
      entity.addComponent(c);
    }
    entities.add(entity);
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

  public function removeEntityWithId(id : String) : Void {
    if (getEntityById(id) != null) {
      removeEntity(getEntityById(id));
    }
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