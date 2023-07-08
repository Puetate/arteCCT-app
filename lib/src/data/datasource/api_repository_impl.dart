import 'package:arte_ctt_app/src/domain/api/casa_cultura_tungurahua_api.dart';
import 'package:arte_ctt_app/src/domain/models/agenda.dart';
import 'package:arte_ctt_app/src/domain/models/picture.dart';
import 'package:arte_ctt_app/src/domain/repository/api_repository.dart';

class ApiRepositoryImpl extends ApiRepositoryInterface {
  @override
  Future<List<Picture>> getPictures(value) async {
    var res = await Api.httpGet('/artworks/search/$value');
    List<Picture> pictures = (res as List)
        .map(
          (p) => Picture.fromJson(p),
        )
        .toList();
    return pictures;
  }

  @override
  Future<List<Agenda>> getAgenda() async {
    var res = await Api.httpGet('/agenda');
    if (res == null) return List<Agenda>.empty();
    List<Agenda> agenda = (res as List).map((a) => Agenda.fromJson(a)).toList();
    return agenda;
  }

  @override
  Future<Picture?> getPicture(String id) async {
    var res = await Api.httpGet('/artworks/$id');
    if (res == null) return null;
    Picture picture = Picture.fromJson(res);
    return picture;
  }

  @override
  Future<List<Picture>> getFeaturedPictures(needReset) async {
    var res = await Api.httpGet('/artworks/featured');
    if (res == null) return List<Picture>.empty();
    List<Picture> featuredPictures = (res as List)
        .map(
          (p) => Picture.fromJson(p),
        )
        .toList();
    return featuredPictures;
  }
}
