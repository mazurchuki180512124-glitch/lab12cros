
import 'package:flutter/material.dart';

enum Corner {
  topLeft,
  topRight,
  bottomLeft,
  bottomRight,
}

class CornerProvider extends ChangeNotifier {
  final Map<Corner, double> _radii = {
    Corner.topLeft: 0,
    Corner.topRight: 0,
    Corner.bottomLeft: 0,
    Corner.bottomRight: 0,
  };

  double getRadius(Corner corner) => _radii[corner] ?? 0;

  void setRadius(Corner corner, double value) {
    _radii[corner] = value;
    notifyListeners();
  }

  BorderRadius get borderRadius => BorderRadius.only(
    topLeft: Radius.circular(getRadius(Corner.topLeft)),
    topRight: Radius.circular(getRadius(Corner.topRight)),
    bottomLeft: Radius.circular(getRadius(Corner.bottomLeft)),
    bottomRight: Radius.circular(getRadius(Corner.bottomRight)),
  );

  void reset() {
    for (final corner in Corner.values) {
      _radii[corner] = 0;
    }
    notifyListeners();
  }
}
