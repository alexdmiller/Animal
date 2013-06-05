package components;

import animal.core.Component;

class Bullet implements Component {
  public static var ret : ComponentRetriever<Bullet> =
      new ComponentRetriever<Bullet>('components.Bullet');
}