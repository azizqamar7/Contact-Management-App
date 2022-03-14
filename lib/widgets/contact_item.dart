import 'package:flutter/material.dart';

import 'package:contact_management/models/contact.dart';

class ContactItem extends StatefulWidget {
  final Contact contact;
  final Function rmvFunc;

  const ContactItem(
    Key? key,
    this.contact,
    this.rmvFunc,
  ) : super(key: key);

  @override
  State<ContactItem> createState() => _ContactItemState();
}

class _ContactItemState extends State<ContactItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKKn3H0YsTzAF4z9mHZzsO4eu2Xpue00uEqg&usqp=CAU',
                width: 120,
                height: 120,
              ),
            ),
          ),
          Container(
            // alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.contact.name,
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(widget.contact.number.toString()),
                const SizedBox(height: 5),
                Text(widget.contact.email),
              ],
            ),
          )
        ],
      ),
    );
  }
}
