import 'package:arte_ctt_app/src/domain/models/agenda.dart';
import 'package:arte_ctt_app/src/domain/models/picture.dart';

abstract class ApiRepositoryInterface {
  Future<List<Picture>> getPictures();
  Future<List<Agenda>> getAgenda();
}
