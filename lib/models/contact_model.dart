class Contacts {
  List<Contact> items = [];

  Contacts();

  Contacts.fromJsonList(List<dynamic> jsonList){
    if(jsonList == null) return;

    for(var item in jsonList){
      final contact = Contact.fromJsonMap(item);
      items.add(contact);
    }
  }
}

class Contact {
  String title;
  String value;
  String icon;
  String url;

  Contact({
    this.title,
    this.value,
    this.icon,
    this.url
  });

  Contact.fromJsonMap(Map<String, dynamic> json){
    this.title = json["title"];
    this.value = json["value"];
    this.icon = json["icon"];
    this.url = json["url"];
  }
}
