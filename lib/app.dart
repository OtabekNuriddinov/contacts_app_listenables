
import '/screen/home_screen.dart';
import 'package:flutter/material.dart';

import 'app_state/change_notifier.dart';
import 'app_state/inherited_data.dart';

class ContactsApp extends StatelessWidget {
  const ContactsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return InheritedData(
      contactsController: ContactsController(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}