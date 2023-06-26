import 'package:arte_ctt_app/src/data/in_memory_agenda.dart';
import 'package:arte_ctt_app/src/data/in_memory_pictures.dart';
import 'package:arte_ctt_app/src/domain/api/casa_cultura_tungurahua_api.dart';
import 'package:arte_ctt_app/src/domain/models/agenda.dart';
import 'package:arte_ctt_app/src/domain/models/picture.dart';
import 'package:arte_ctt_app/src/domain/repository/api_repository.dart';
import 'package:flutter/material.dart';

class ApiRepositoryImpl extends ApiRepositoryInterface {
  @override
  Future<List<Picture>> getPictures() async {
    var res = await Api.httpGet('/artworks');
    List<Picture> pictures = (res as List)
        .map(
          (p) => Picture.fromJson(p),
        )
        .toList();
    print(pictures);
    return pictures;
  }

  @override
  Future<List<Agenda>> getAgenda() async {
    await Future.delayed(const Duration(seconds: 1));
    return agendaItems;
  }

  @override
  Future<Picture> getPicture(String id) async {
    var res = await Api.httpGet('/artworks/$id');
    Picture picture = Picture.fromJson(res);
    print(picture);
    return picture;
  }

  @override
  Future<List<Picture>> getFeaturedPictures() async {
    var res = await Api.httpGet('/artworks/featured');
    List<Picture> featuredPictures = (res as List)
        .map(
          (p) => Picture.fromJson(p),
        )
        .toList();
    return featuredPictures;
  }
}
