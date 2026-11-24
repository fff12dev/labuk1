import 'package:flutter/material.dart';

class ContainerConfigProvider extends ChangeNotifier {
  double _width = 120.0;
  double _height = 120.0;
  double _topRightRadius = 20.0;

  double get width => _width;
  double get height => _height;
  double get topRightRadius => _topRightRadius;

  void setWidth(double value) {
    _width = value;
    notifyListeners();
  }

  void setHeight(double value) {
    _height = value;
    notifyListeners();
  }

  void setTopRightRadius(double value) {
    _topRightRadius = value;
    notifyListeners();
  }
}
