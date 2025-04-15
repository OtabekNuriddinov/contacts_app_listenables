
import 'package:contacts_app_listenables/core/utils/app_dialog.dart';
import 'package:contacts_app_listenables/core/utils/app_snackbar.dart';

import '/core/extensions/build_context.dart';
import 'package:flutter/material.dart';

import '../models/contact_model.dart';
import 'details_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Color(0xFFF8F9FA),
        title: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text("Contacts App"),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextField(
                  controller: controller,
                  onChanged: (value) {
                    context.contactsController.search(value);
                  },
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.grey.shade300, width: 2)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(width: 3, color: Colors.blue.shade100)),
                    border: OutlineInputBorder(),
                    hintText: "Search",
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        context.contactsController.sortAZ(
                          context.contactsController.searchContacts,
                        );
                      },
                      icon: Icon(Icons.menu),
                    ),
                    IconButton(
                      onPressed: () {
                        context.contactsController.sortNews(
                            context.contactsController.searchContacts
                        );
                      },
                      icon: Icon(Icons.new_releases_outlined),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      body: ListenableBuilder(
        listenable: context.contactsController,
        builder: (context, _) {
          return ListView.builder(
            itemCount: context.contactsController.searchContacts.length,
            itemBuilder: (context, index) {
              Contact item = context.contactsController.searchContacts[index];
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  height: 70,
                  child: Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 20,
                        backgroundColor:
                        context.contactsController.getColorForContact(item),
                        child: context.contactsController.twoChar(item.name),
                      ),
                      title: Text(item.name),
                      titleTextStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      subtitle: Text(item.number),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Material(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(8.0),
                            child: InkWell(
                              hoverColor: Colors.blue.shade100,
                              borderRadius: BorderRadius.circular(8.0),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        DetailsPage(editingContact: item),
                                  ),
                                );
                              },
                              child: Icon(Icons.edit),
                            ),
                          ),
                          SizedBox(width: 16),
                          Material(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(8.0),
                            child: InkWell(
                              hoverColor: Colors.blue.shade100,
                              borderRadius: BorderRadius.circular(8.0),
                              onTap: () {
                                AppDialog.showMyDialog(
                                    context: context,
                                    mainText: "Removing",
                                    text: "Do you wanna delete this contact?\nAre you sure?",
                                    leftButText: "No",
                                    rightButText: "Yes",
                                    pressLeft: (){
                                      Navigator.pop(context);
                                    },
                                    pressRight: (){
                                      context.contactsController.removeContact(item);
                                      Navigator.pop(context);
                                      AppSnackBar.msg(context, "1 contact deleted");
                                      return;
                                    },
                                );
                              },
                              child: Icon(Icons.delete_outline_sharp),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue.shade100,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsPage(),
            ),
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}

