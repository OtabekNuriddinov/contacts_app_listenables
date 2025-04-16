import 'dart:math';

import 'package:flutter/material.dart';

import '../../models/contact_model.dart';

final Map<int, Color> _colorMap = {};

Color getColorForContact(Contact contact) {
  if (_colorMap.containsKey(contact.id)) {
    return _colorMap[contact.id]!;
  } else {
    final baseColor = Colors.primaries[Random().nextInt(
      Colors.primaries.length,
    )];
    final color = baseColor.shade400;
    _colorMap[contact.id] = color;
    return color;
  }
}