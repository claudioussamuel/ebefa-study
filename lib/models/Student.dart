import 'package:cloud_firestore/cloud_firestore.dart';

class StudentModel {
  static const ID = "id";
  static const NAME = "name";
  static const EMAIL = "email";
  static const SCORE = "score";

  String? id;
  String? name;
  String? email;
  int? score;

  StudentModel({this.email, this.id, this.name, this.score});

  StudentModel.fromJson(DocumentSnapshot data) {
    id = data[ID];
    name = data[NAME];
    email = data[EMAIL];
    score = data[SCORE];
  }

  StudentModel.fromMap(Map<String, dynamic> data) {
    id = data[ID];
    name = data[NAME];
    email = data[EMAIL];
    score = data[SCORE];
  }

  Map<String, dynamic> toMap() {
    return {
      EMAIL: email,
      ID: id,
      NAME: name,
      SCORE: score,
    };
  }
}
