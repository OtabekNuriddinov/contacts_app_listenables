import 'package:flutter/material.dart';
import 'change_notifier.dart';

class InheritedData extends InheritedWidget {
  final ContactsController contactsController;
  const InheritedData(
      {super.key, required this.contactsController, required super.child});

  static InheritedData? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedData>();
  }

  @override
  bool updateShouldNotify(covariant InheritedData oldWidget) {
    return contactsController != oldWidget.contactsController;
  }
}

