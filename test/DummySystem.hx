package;

import animal.core.System;

class DummySystem extends System {
  public function new() {
    super(['DummyComponent', 'dummypackage.DummyComponent3']);
  }
}