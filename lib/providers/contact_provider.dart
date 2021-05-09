import 'package:curriculum/models/contact_model.dart';
import 'package:curriculum/providers/json_reader.dart';

class ContactProvider{
  Future<List<Contact>> getContacts() async {
    final json = await JsonReader.getJsonDecoded("contact.json");
    final listContacts = Contacts.fromJsonList(json["data"]); 
    return listContacts.items;
  }
}