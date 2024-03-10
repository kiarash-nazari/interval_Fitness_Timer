abstract class Levels {
  Levels(this.levels);
  List<List<int>> levels;
}

class Beginers implements Levels {
  @override
  List<List<int>> levels = [
    [10, 30, 10],
    [15, 30, 10],
    [20, 30, 10],
    [30, 30, 10],
    [40, 40, 10],
    [50, 50, 10],
    [60, 60, 10],
    [60, 50, 10],
    [60, 40, 10],
    [60, 30, 10],
  ];
}

class Primer implements Levels {
  @override
  List<List<int>> levels = [
    [10, 30, 15],
    [15, 30, 15],
    [20, 30, 15],
    [30, 30, 15],
    [40, 40, 15],
    [50, 50, 15],
    [60, 60, 15],
    [60, 50, 15],
    [60, 40, 15],
    [60, 30, 15],
  ];
}

class Pro implements Levels {
  @override
  List<List<int>> levels = [
    [10, 30, 20],
    [15, 30, 20],
    [20, 30, 20],
    [30, 30, 20],
    [40, 40, 20],
    [50, 50, 20],
    [60, 60, 20],
    [60, 50, 20],
    [60, 40, 20],
    [60, 30, 20],
  ];
}

class Advanced implements Levels {
  @override
  List<List<int>> levels = [
    [10, 30, 25],
    [15, 30, 25],
    [20, 30, 25],
    [30, 30, 25],
    [40, 40, 25],
    [50, 50, 25],
    [60, 60, 25],
    [60, 50, 25],
    [60, 40, 25],
    [60, 30, 25],
  ];
}
