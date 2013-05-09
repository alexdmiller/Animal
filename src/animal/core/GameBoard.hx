package animal.core;

import haxe.FastList;

import animal.events.EventEmitter;
import animal.core.Component;

class GameBoard extends EventEmitter {
  private var entities : FastList<Entity>;
  private var systems : Array<System>;

  public function createEntity(components : Array<Component>) : Void {
    var entity = new Entity();
    entities.add(entity);
    dispatch('entity_added', { entity: entity });
  }

  public function iterator() : Iterator<Entity> {
    return entities.iterator();
  }

  public function removeEntity() : Void {

  }

  public function addSystem(system : System) : Void {

  }

  public function removeSystem(system : System) : Void {

  }

  private function onEntityChanged(event : Dynamic) : Void {

  }
}