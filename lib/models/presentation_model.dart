class PresentationModel {
  String name;
  String lastName;
  String secondLastName;
  String occupation;
  String image;

  PresentationModel({
    this.name,
    this.lastName,
    this.secondLastName,
    this.occupation,
    this.image
  });

  PresentationModel.fromJsonMap(Map<String, dynamic> json){
    this.name = json["name"];
    this.lastName = json["last_name"];
    this.secondLastName = json["second_last_name"];
    this.occupation = json["ocuppation"];
    this.image = json["image"];
  }
}
