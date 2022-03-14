import 'package:contact_management/models/contact.dart';
import 'package:contact_management/widgets/contact_item.dart';
import 'package:flutter/material.dart';

class ContactList extends StatelessWidget {
  final List<Contact> contacts;
  final Function rmvFunc;

  ContactList(this.contacts, this.rmvFunc);

  @override
  Widget build(BuildContext context) {
    return contacts.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "No Transactions added",
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          })
        : ListView(
            children:
                contacts.map((tx) => ContactItem(key, tx, rmvFunc)).toList(),
          );
  }
}
