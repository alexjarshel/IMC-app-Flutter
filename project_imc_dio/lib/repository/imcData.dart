import 'package:project_imc_dio/import.dart';

class BMIRepository {
  List<Bmi> _bmiList = [];

  void addBmi(Bmi bmi) {
    _bmiList.add(bmi);
  }

  List<Bmi> getBmi() {
    return _bmiList;
  }
}
