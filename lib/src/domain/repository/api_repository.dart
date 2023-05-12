import 'package:arte_ctt_app/src/domain/models/picture.dart';

abstract class ApiRepositoryInterface {
  Future<List<Picture>> getPictures();
}
