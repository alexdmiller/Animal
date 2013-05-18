package components;

import animal.core.Entity;

class Position extends Vector {
  public static var ret : ComponentRetriever<Position> =
      new ComponentRetriever<Position>('components.Position');
}