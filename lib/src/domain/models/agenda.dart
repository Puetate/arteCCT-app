// To parse this JSON data, do
//
//     final agenda = agendaFromJson(jsonString);

import 'dart:convert';

Agenda agendaFromJson(String str) => Agenda.fromJson(json.decode(str));

String agendaToJson(Agenda data) => json.encode(data.toJson());

class Agenda {
    int id;
    String title;
    String imageUrl;

    Agenda({
        required this.id,
        required this.title,
        required this.imageUrl,
    });

    factory Agenda.fromJson(Map<String, dynamic> json) => Agenda(
        id: json["id"],
        title: json["title"],
        imageUrl: json["imageURL"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "imageURL": imageUrl,
    };
}
