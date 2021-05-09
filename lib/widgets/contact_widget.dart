import 'package:curriculum/models/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactWidget extends StatelessWidget {
  
  final List<Contact> contacts;

  ContactWidget({ @required this.contacts});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: _cards(),
    );
  }
  
  List<Widget> _cards(){
    return contacts.map((contact){
      return Container(
        child: InkWell(
          child: Row(
            children: [
              Image(
                image: AssetImage("images/${contact.icon}"),
                width: 25,
                height: 25,
              ),
              VerticalDivider(),
              Text(contact.value)
            ],
          ),
          onTap: () => launch(contact.url),
        ),
      );
    }).toList();
  }
}