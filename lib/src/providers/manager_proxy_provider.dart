import 'package:arte_ctt_app/src/data/datasource/api_repository_impl.dart';
import 'package:arte_ctt_app/src/data/datasource/pictures_proxy.dart';
import 'package:arte_ctt_app/src/domain/models/agenda.dart';
import 'package:arte_ctt_app/src/domain/models/picture.dart';
import 'package:flutter/material.dart';

class ManagerProxyProvider {
    late ApiRepositoryImpl picturesService;
  late PictureProxy picturesProxy;

  ManagerProxyProvider(){
    picturesService = ApiRepositoryImpl();
    picturesProxy = PictureProxy(picturesService);
  }

  Future<List<Agenda>> getAgenda() async {
    return await picturesProxy.getAgenda();
  }

  Future<List<Picture>> getFeaturedPictures(bool needReset) async {
    return picturesProxy.getFeaturedPictures(needReset);
  }


}