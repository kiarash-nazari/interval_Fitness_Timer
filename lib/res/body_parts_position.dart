class BodyPartPositon {
  BodyPartPositon._(); // Private constructor

  static final BodyPartPositon _instance = BodyPartPositon._();

  factory BodyPartPositon() => _instance;

  static BodyPartPositon get instance => _instance;
  // Define positions and sizes for each body part
  Map<String, List<double>> frontPartPositions = {
    'leftLatissimus': [170, 90, 2.1],
    'leftKool': [150, 8, 0],
    'leftShoulder': [195, 33, 0],
    'leftBiceps': [200, 80, 0],
    'leftForearm': [200, 125, 0],
    'leftChest': [151, 40, 0],
    'leftFirstAb': [145, 87, 0],
    'leftSecondAb': [145, 110, 0],
    'leftThirdAb': [147, 133, 0],
    'leftSexAb': [157, 150, 2.7],
    'leftQuadFirst': [180, 167, .2],
    'leftQuadSecond': [170, 170, 0],
    'leftQuadThird': [159, 172, -.2],
    'leftFrontCraft': [175, 240, 0],
    'rightLatissimus': [75, 90, -2.1],
    'rightKool': [85, 8, 0],
    'rightShoulder': [47, 33, 0],
    'rightBiceps': [53, 80, 0],
    'rightForearm': [53, 125, 0],
    'rightChest': [91.5, 40, 0],
    'rightFirstAb': [103, 87, 0],
    'rightSecondAb': [105, 110, 0],
    'rightThirdAb': [107, 133, 0],
    'rightSexAb': [92, 153, .3],
    'rightQuadFirst': [96, 167, -.2],
    'rightQuadSecond': [108, 167, 0],
    'rightQuadThird': [118, 169, .2],
    'rightFrontCraft': [98, 240, 0],
  };

  Map<String, dynamic>? partHowHard = {
    "leftLatissimus": [0, 0],
    "leftKool": [0, 0],
    "leftShoulder": [0, 0],
    "leftBiceps": [0, 0],
    "leftForearm": [0, 0],
    "leftChest": [0, 0],
    "leftFirstAb": [0, 0],
    "leftSecondAb": [0, 0],
    "leftThirdAb": [0, 0],
    "leftSexAb": [0, 0],
    "leftQuadFirst": [0, 0],
    "leftQuadSecond": [0, 0],
    "leftQuadThird": [0, 0],
    "leftFrontCraft": [0, 0],
    "rightLatissimus": [0, 0],
    "rightKool": [0, 0],
    "rightShoulder": [0, 0],
    "rightBiceps": [0, 0],
    "rightForearm": [0, 0],
    "rightChest": [0, 0],
    "rightFirstAb": [0, 0],
    "rightSecondAb": [0, 0],
    "rightThirdAb": [0, 0],
    "rightSexAb": [0, 0],
    "rightQuadFirst": [0, 0],
    "rightQuadSecond": [0, 0],
    "rightQuadThird": [0, 0],
    "rightFrontCraft": [0, 0]
  };
}
