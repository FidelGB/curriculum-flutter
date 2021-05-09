import 'package:curriculum/models/contact_model.dart';
import 'package:curriculum/providers/contact_provider.dart';
import 'package:curriculum/widgets/contact_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  
  final contactProvider = ContactProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(192, 0, 2, 1),
        centerTitle: true,
        title: Container(
          child: _infoContact()
        )
      ),
    );
  }

  Widget _infoContact(){
    return FutureBuilder(
      future: contactProvider.getContacts(),
      builder: (BuildContext context, AsyncSnapshot<List<Contact>> snapshot) {
        if(snapshot.hasData){
          return ContactWidget(contacts: snapshot.data);
        }
        return Container();
      },
    );
  }
}