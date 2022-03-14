import 'package:contact_management/models/contact.dart';
import 'package:contact_management/screens/add_contact.dart';
import 'package:contact_management/widgets/contact_item.dart';
import 'package:contact_management/widgets/contact_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contact Management System',
      theme: ThemeData(),
      home: const MyHomePage(title: 'Contacts'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

final List<Contact> _userContact = [
  // this is a demo of how the transaction would be structured
  // Transaction(
  //   id: 't1',
  //   title: 'Fruits',
  //   ammount: 69.99,
  //   date: DateTime.now(),
  // ),
];

class _MyHomePageState extends State<MyHomePage> {
  void _addCnt(String txTitle, double txAmmount, txEmail) {
    final newTx = Contact(
      id: DateTime.now().toString(),
      name: txTitle,
      number: txAmmount,
      email: txEmail,
    );
    setState(() {
      _userContact.add(newTx);
    });
  }

  void _startAddNewContact(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return AddContact(_addCnt);
        // return NewTransaction(_addNewTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 40),
            decoration: const BoxDecoration(
              color: Color(0xff1A1A1A),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0)),
            ),
            // margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Contacts",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Icons.add,
                            color: Colors.black,
                          ),
                          onPressed: () => _startAddNewContact(context),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 15),
                    decoration: BoxDecoration(
                        color: const Color(0xff323232),
                        borderRadius: BorderRadius.circular(30)),
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Icon(
                          Icons.search,
                          color: Color(0xffA3A3A3),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Search Contact",
                          style: TextStyle(color: Color(0xffA3A3A3)),
                        )
                      ],
                    ),
                  ),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  // Container(
                  //   width: MediaQuery.of(context).size.width,
                  //   child: const Text(
                  //     "Favourites",
                  //     style: TextStyle(
                  //       color: Colors.white,
                  //       fontWeight: FontWeight.w500,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          ContactItem(
            widget.key,
            Contact(
              id: 'id',
              name: "Logan",
              email: "logan@gmail.com",
              number: 88885555,
            ),
            () {},
          ),
          ContactItem(
            widget.key,
            Contact(
              id: 'id',
              name: "Bruce",
              email: "bruce@wayne.com",
              number: 44444888888,
            ),
            () {},
          ),
          ContactItem(
            widget.key,
            Contact(
              id: 'id',
              name: "Thomas",
              email: "thomas@gmail.com",
              number: 778556622,
            ),
            () {},
          ),
        ],
      ),
    );
  }
}
