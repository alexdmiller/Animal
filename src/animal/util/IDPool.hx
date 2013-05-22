package animal.util;

class IDPool {
  private static inline var MAX_ID : Int = Std.int(Math.pow(2, 29));
  private var intervals : List<{ low : Int, high : Int }>;

  public function new() {
    trace(MAX_ID);
    intervals = new List<{ low : Int, high : Int }>();
    intervals.add({ low: 0, high: 10000});
  }

  public function grabArbitraryID() : Int {
    return 0;
  }

  public function grabID(id : Int) : Bool {
    return false;
  }

  public function releaseID(id : Int) : Void {

  }

  public function isFree(id : Int) : Bool {
    return false;
  }
}