import 'dart:convert';
import 'package:flutter/services.dart';

class JsonReader{
  
  static Future<dynamic> getJsonDecoded(String file) async{
    final path = "data/$file";
    final jsonString = await rootBundle.loadString(path);
    return json.decode(jsonString);
  }
}
