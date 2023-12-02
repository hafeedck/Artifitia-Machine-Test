

import 'dart:convert';

List<QuestionModel> questionModelFromJson(String str) => List<QuestionModel>.from(json.decode(str).map((x) => QuestionModel.fromJson(x)));

String questionModelToJson(List<QuestionModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class QuestionModel {
    String id;
    String question;
    List<Option> options;
    String createdAt;
    String updatedAt;
    int v;

    QuestionModel({
        required this.id,
        required this.question,
        required this.options,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    factory QuestionModel.fromJson(Map<String, dynamic> json) => QuestionModel(
        id: json["_id"],
        question: json["question"],
        options: List<Option>.from(json["options"].map((x) => Option.fromJson(x))),
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "question": question,
        "options": List<dynamic>.from(options.map((x) => x.toJson())),
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "__v": v,
    };
}

class Option {
    String text;
    bool isCorrect;
    String id;

    Option({
        required this.text,
        required this.isCorrect,
        required this.id,
    });

    factory Option.fromJson(Map<String, dynamic> json) => Option(
        text: json["text"],
        isCorrect: json["isCorrect"],
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "text": text,
        "isCorrect": isCorrect,
        "_id": id,
    };
}
