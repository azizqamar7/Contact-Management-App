import 'package:flutter/material.dart';

class AddContact extends StatefulWidget {
  final Function addCnt;
  AddContact(this.addCnt);
  // add a submit data function

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  final _nameController = TextEditingController();
  final _numberController = TextEditingController();
  final _emailController = TextEditingController();

  void _submitData() {
    final enteredTitle = _nameController.text;
    final enteredNumber = double.parse(_numberController.text);

    widget.addCnt(
      enteredTitle,
      enteredNumber,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 3,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // CupertinoTextField(),
              TextField(
                decoration: InputDecoration(
                  labelText: "Name",
                  labelStyle: const TextStyle(color: Color(0xff1A1A1A)),
                  border: const OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Color(0xff1A1A1A), width: 1.5),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
                // onChanged: (val) => textInput = val,
                onSubmitted: (_) => () {}(),
                controller: _nameController,
              ),

              const SizedBox(height: 20),

              TextField(
                decoration: InputDecoration(
                  labelText: "Contact Number",
                  labelStyle: const TextStyle(color: Color(0xff1A1A1A)),
                  border: const OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Color(0xff1A1A1A), width: 1.5),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),

                // onChanged: (val) => ammountInput = val,
                controller: _numberController,
                keyboardType: TextInputType.phone,
                onSubmitted: (_) => () {}(),
              ),

              const SizedBox(height: 20),

              TextField(
                decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: const TextStyle(color: Color(0xff1A1A1A)),
                  border: const OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Color(0xff1A1A1A), width: 1.5),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
                // onChanged: (val) => ammountInput = val,
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                onSubmitted: (_) => () {}(),
              ),

              const SizedBox(height: 30),

              ElevatedButton(
                child: const Text(
                  "Add Contact",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xff1A1A1A),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                ),
                // style: ButtonStyle(
                //   backgroundColor: ,
                //   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                //     RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(20.0),
                //     ),
                //   ),
                // ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
