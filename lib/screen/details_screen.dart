import '/core/utils/app_snackbar.dart';

import '../core/widgets/detail_textfield.dart';
import '/core/extensions/build_context.dart';
import 'package:flutter/material.dart';

import '../core/widgets/app_button.dart';
import '../models/contact_model.dart';

class DetailsPage extends StatelessWidget {
  final Contact? editingContact;
  const DetailsPage({super.key, this.editingContact});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController =
    TextEditingController(text: editingContact?.name ?? "");
    final TextEditingController phoneController =
    TextEditingController(text: editingContact?.number ?? "");
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FA),
      appBar: AppBar(
        title: Text("Details Page"),
        centerTitle: true,
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            children: [
              DetailTextField(controller: nameController, text: "Name"),
              SizedBox(height: 10),
              DetailTextField(controller: phoneController, text: "Phone"),
              SizedBox(height: 20),
              if (editingContact == null)
                AppButton(
                  onPressed: () {
                    final name = nameController.text;
                    final phone = phoneController.text;
                    if (name.isNotEmpty && phone.isNotEmpty) {
                      Contact newContact = Contact(
                        id: context.contactsController.contactList.length + 1,
                        name: name,
                        number: phone,
                      );
                      context.contactsController.addContact(newContact);
                      Navigator.pop(context);
                      AppSnackBar.msg(context, "1 contact added");
                    }
                    else{
                      AppSnackBar.msg(context, "You should fill all the fields!");
                      return;
                    }
                  },
                  title: "Add",
                )
              else
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                        child: AppButton(
                          onPressed: () {
                            final name = nameController.text;
                            final phone = phoneController.text;
                            if (name.isEmpty || phone.isEmpty) {
                              AppSnackBar.msg(context, "You should fill all the fields!");
                              return;
                            }
                            context.contactsController.editContact(
                              editingContact!,
                              nameController.text,
                              phoneController.text,
                            );
                            Navigator.pop(context);
                            AppSnackBar.msg(context, "1 Contact edited");
                          },
                          title: "Update",
                        )),
                    const SizedBox(width: 28),
                    Expanded(
                        child: AppButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          title: "Cancel",
                        )),
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}

