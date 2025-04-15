import 'package:flutter/material.dart';

import '../../app_state/change_notifier.dart';
import '../../app_state/inherited_data.dart';


extension BuildContextExt on BuildContext {
  ContactsController get contactsController =>
      InheritedData.of(this)!.contactsController;
}
