import 'package:flutter/material.dart';

class CurrentStep extends ChangeNotifier{
  int _currentStep = 0;
  int get currentStep => _currentStep;
  set currentStep(int newStep){
    _currentStep = newStep;
    notifyListeners();
  }
}