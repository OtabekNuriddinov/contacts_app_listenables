import 'dart:math';

import 'package:flutter/material.dart';
import '../models/contact_model.dart';

class ContactsController extends ChangeNotifier {
  List<Contact> contactList = [
    Contact(id: 1, name: "Charlie", number: "+555123456"),
    Contact(id: 2, name: "Alice", number: "+123456789"),
    Contact(id: 3, name: "Bob", number: "+987654321"),
  ];

  List<Contact> searchContacts = [];
  ContactsController() {
    searchContacts = List.from(contactList);
  }

  void addContact(Contact contact) {
    contactList.add(contact);
    searchContacts.add(contact);
    notifyListeners();
  }

  void removeContact(Contact contact) {
    contactList.remove(contact);
    searchContacts.remove(contact);
    notifyListeners();
  }

  void editContact(Contact contact, String name, String phone) {
    final index = contactList.indexOf(contact);
    if (index != -1) {
      contactList[index] = contact.copyWith(name: name, number: phone);
      final searchIndex = searchContacts.indexOf(contact);
      if (searchIndex != -1) {
        searchContacts[searchIndex] = contactList[index];
      }
      notifyListeners();
    }
  }

  void sortAZ(List<Contact> list) {
    list.sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
    notifyListeners();
  }

  void sortNews(List<Contact> list) {
    list.sort((a, b) => b.id.compareTo(a.id));
    notifyListeners();
  }

  void search(String controllerText) {
    if (controllerText.isEmpty) {
      searchContacts = List.from(contactList);
    } else {
      searchContacts = contactList
          .where(
            (contact) => contact.name.toLowerCase().startsWith(
          controllerText.toLowerCase(),
        ),
      )
          .toList();
    }
    notifyListeners();
  }
}

