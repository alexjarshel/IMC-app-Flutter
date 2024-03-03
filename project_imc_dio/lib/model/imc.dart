class Bmi {
  double _weight;
  double _height;

  Bmi(
    this._weight,
    this._height,
  );

  double get weight => _weight;
  double get height => _height;

  set weight(double weight) {
    _weight = weight;
  }

  set height(double height) {
    _height = height;
  }

  double getBmi(double height, double wheight) {
    var result = wheight / (height * height);
    return result;
  }

  String getClassification(double bmi) {
    if (bmi < 16) {
      return 'Severe thinness';
    } else if (bmi >= 16 && bmi < 17) {
      return 'Moderate thinness';
    } else if (bmi >= 17 && bmi < 18.8) {
      return 'Mild thinness';
    } else if (bmi >= 25 && bmi < 30) {
      return 'healthy';
    } else if (bmi >= 25 && bmi < 30) {
      return 'overweight';
    } else if (bmi >= 30 && bmi < 35) {
      return 'Grade 1 obesity';
    } else if (bmi >= 35 && bmi < 40) {
      return 'Grade 1 obesity (Severe)';
    } else {
      return 'Grade 1 obesity (morbid)';
    }
  }
}
