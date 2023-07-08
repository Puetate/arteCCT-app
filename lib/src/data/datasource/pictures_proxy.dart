import 'package:arte_ctt_app/src/data/datasource/api_repository_impl.dart';
import 'package:arte_ctt_app/src/domain/models/picture.dart';
import 'package:arte_ctt_app/src/domain/models/agenda.dart';
import 'package:arte_ctt_app/src/domain/repository/api_repository.dart';

class PictureProxy extends ApiRepositoryInterface {
  ApiRepositoryInterface service;
  var featuredPictures;
  var agenda;

  PictureProxy(this.service);

  @override
  Future<List<Agenda>> getAgenda() async {
    if (agenda == null || agenda.isEmpty) {
      agenda = List<Agenda>.empty(growable: true);
      agenda = await service.getAgenda();
    }
    return agenda;
  }

  @override
  Future<List<Picture>> getFeaturedPictures(bool needReset) async {
    if (featuredPictures == null || needReset) {
      featuredPictures = List<Picture>.empty(growable: true);
      featuredPictures = await service.getFeaturedPictures(needReset);
    }
    return featuredPictures;
  }

  @override
  Future<Picture?> getPicture(String id) async {
    return await service.getPicture(id);
  }

  @override
  Future<List<Picture>> getPictures(value) async {
    return await service.getPictures(value);
  }
}
