import 'package:curriculum/models/contact_model.dart';
import 'package:curriculum/models/presentation_model.dart';
import 'package:curriculum/providers/contact_provider.dart';
import 'package:curriculum/providers/presentation_provider.dart';
import 'package:curriculum/widgets/contact_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  
  final contactProvider = ContactProvider();
  final presentationProvider = PresentationProvider();

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
      body: Container(
        //color: Colors.blue,
        margin: EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 10.0
        ),
        child: Column(
          children: [
            _presentation(context),
          ],
        ),
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

  Widget _presentation(BuildContext context){
    return Flexible(
      child: Container(
        //color: Colors.green,
        margin: EdgeInsets.symmetric(
          horizontal: 20.0
        ),
        height: 400,
        child: Center(
          child: FutureBuilder(
            future: presentationProvider.getPresentation(),
            builder: (BuildContext context, AsyncSnapshot<PresentationModel> snapshot) {
              return snapshot.hasData ? 
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          snapshot.data.name,
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        Text(
                          "${snapshot.data.lastName} ${snapshot.data.secondLastName}",
                          style: Theme.of(context).textTheme.headline5,
                        )
                      ],
                    ),
                    VerticalDivider(
                      color: Colors.transparent
                    ),
                    Container(
                      child: ClipRRect(
                        child: Image(
                          image: AssetImage("images/${snapshot.data.image}"),
                          width: 200.0,
                          height: 200.0,
                        ),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black
                        ),
                        borderRadius: BorderRadius.circular(100)
                      ),
                    )
                  ],
                ) : 
                Container();
            },
          ),
        ),
      )
    );
  }
}