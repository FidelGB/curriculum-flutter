import 'package:curriculum/models/presentation_model.dart';
import 'package:curriculum/providers/json_reader.dart';

class PresentationProvider{
  Future<PresentationModel> getPresentation() async {
    final json = await JsonReader.getJsonDecoded("presentation.json");
    final presentation = PresentationModel.fromJsonMap(json);
    return presentation;
  }
}