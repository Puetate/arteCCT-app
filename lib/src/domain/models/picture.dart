// To parse this JSON data, do
//
//     final picture = pictureFromJson(jsonString);

import 'dart:convert';

import 'package:arte_ctt_app/src/domain/models/author.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Picture pictureFromJson(String str) => Picture.fromJson(json.decode(str));

String pictureToJson(Picture data) => json.encode(data.toJson());

class Picture {
  String code;
  String otherCode;
  String name;
  String centuryYear;
  String deliveryType;
  String signatureLocation;
  String country;
  String technique;
  String support;
  String conservationState;
  String integrityState;
  dynamic incomeForm;
  dynamic incomePrice;
  dynamic incomeYear;
  dynamic value;
  dynamic pieceHeight;
  dynamic pieceWidth;
  dynamic pieceDeep;
  dynamic gravingHeight;
  dynamic gravingWidth;
  dynamic frameElementHeight;
  dynamic frameElementWidth;
  String imageUrl;
  String imageWordpressUrl;
  String observation;
  dynamic description;
  String location;
  String recordedBy;
  String reviewedBy;
  dynamic registeredDate;
  Author author;

  Picture({
    required this.code,
    required this.otherCode,
    required this.name,
    required this.centuryYear,
    required this.deliveryType,
    required this.signatureLocation,
    required this.country,
    required this.technique,
    required this.support,
    required this.conservationState,
    required this.integrityState,
    this.incomeForm,
    this.incomePrice,
    this.incomeYear,
    this.value,
    this.pieceHeight,
    this.pieceWidth,
    this.pieceDeep,
    this.gravingHeight,
    this.gravingWidth,
    this.frameElementHeight,
    this.frameElementWidth,
    required this.imageUrl,
    required this.imageWordpressUrl,
    required this.observation,
    this.description,
    required this.location,
    required this.recordedBy,
    required this.reviewedBy,
    this.registeredDate,
    required this.author,
  });


  factory Picture.fromJson(Map<String, dynamic> json) => Picture(
        code: json["code"],
        otherCode: json["other_code"],
        name: json["name"],
        centuryYear: json["centuryYear"],
        deliveryType: json["deliveryType"],
        signatureLocation: json["signatureLocation"],
        country: json["country"],
        technique: json["technique"],
        support: json["support"],
        conservationState: json["conservationState"],
        integrityState: json["integrityState"],
        incomeForm: json["incomeForm"],
        incomePrice: json["incomePrice"]?.toDouble(),
        incomeYear: json["incomeYear"],
        value: json["value"],
        pieceHeight: json["pieceHeight"],
        pieceWidth: json["pieceWidth"],
        pieceDeep: json["pieceDeep"],
        gravingHeight: json["gravingHeight"],
        gravingWidth: json["gravingWidth"],
        frameElementHeight: json["frameElementHeight"],
        frameElementWidth: json["frameElementWidth"],
        imageUrl: "${dotenv.env['HOST']!}${json["imageURL"]}",
        imageWordpressUrl: json["imageWordpressURL"],
        observation: json["observation"],
        description: json["description"],
        location: json["location"],
        recordedBy: json["recordedBy"],
        reviewedBy: json["reviewedBy"],
        registeredDate: json["registeredDate"],
        author: Author.fromJson(json["author"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "other_code": otherCode,
        "name": name,
        "centuryYear": centuryYear,
        "deliveryType": deliveryType,
        "signatureLocation": signatureLocation,
        "country": country,
        "technique": technique,
        "support": support,
        "conservationState": conservationState,
        "integrityState": integrityState,
        "incomeForm": incomeForm,
        "incomePrice": incomePrice,
        "incomeYear": incomeYear,
        "value": value,
        "pieceHeight": pieceHeight,
        "pieceWidth": pieceWidth,
        "pieceDeep": pieceDeep,
        "gravingHeight": gravingHeight,
        "gravingWidth": gravingWidth,
        "frameElementHeight": frameElementHeight,
        "frameElementWidth": frameElementWidth,
        "imageURL": imageUrl,
        "imageWordpressURL": imageWordpressUrl,
        "observation": observation,
        "description": description,
        "location": location,
        "recordedBy": recordedBy,
        "reviewedBy": reviewedBy,
        "registeredDate": registeredDate,
        "author": author.toJson(),
      };
}
