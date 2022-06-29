class RealQuestions {
  static const TEXT = "text";
  static const CORRECTANSWER = 'correctanswer';
  static const ID = "id";
  static const A = "a";
  static const B = "b";
  static const C = "c";
  static const D = "d";

  String? text;
  String? correctanswer;
  int? id;
  String? a;
  String? b;
  String? c;
  String? d;

  RealQuestions({
    this.text,
    this.correctanswer,
    this.id,
    this.a,
    this.b,
    this.c,
    this.d,
  });

  RealQuestions.fromMap(Map<String, dynamic> data) {
    text = data[TEXT];
    correctanswer = data[CORRECTANSWER];
    id = data[ID];
    a = data[A];
    b = data[B];
    c = data[C];
    d = data[D];
  }
}
