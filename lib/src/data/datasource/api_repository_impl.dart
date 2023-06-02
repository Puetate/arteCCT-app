import 'package:arte_ctt_app/src/data/in_memory_agenda.dart';
import 'package:arte_ctt_app/src/data/in_memory_pictures.dart';
import 'package:arte_ctt_app/src/domain/models/agenda.dart';
import 'package:arte_ctt_app/src/domain/models/picture.dart';
import 'package:arte_ctt_app/src/domain/repository/api_repository.dart';

class ApiRepositoryImpl extends ApiRepositoryInterface {
  @override
  Future<List<Picture>> getPictures() async {
    await Future.delayed(const Duration(seconds: 1));
    return pictures;
  }

  @override
  Future<List<Agenda>> getAgenda() async {
    await Future.delayed(const Duration(seconds: 1));
    return agendaItems;
  }
}
