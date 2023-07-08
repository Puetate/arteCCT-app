import 'dart:async';

import 'package:arte_ctt_app/src/data/datasource/api_repository_impl.dart';
import 'package:arte_ctt_app/src/domain/models/agenda.dart';
import 'package:arte_ctt_app/src/providers/manager_proxy_provider.dart';
import 'package:arte_ctt_app/src/screens/components/card_agenda.dart';
import 'package:arte_ctt_app/src/utils/app_layout.dart';
import 'package:arte_ctt_app/src/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CulturalAgendaScreen extends StatefulWidget {
  const CulturalAgendaScreen({
    super.key,
  });

  @override
  State<CulturalAgendaScreen> createState() => _CulturalAgendaScreenState();
}

class _CulturalAgendaScreenState extends State<CulturalAgendaScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final service = ApiRepositoryImpl();
    final Size size = AppLayout.getSize(context);

    return Scaffold(
        backgroundColor: Styles.primaryColor,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Styles.white),
          backgroundColor: Styles.primaryColor,
          centerTitle: true,
          title: Text(
            "Agenda Cultural",
            style: Styles.textStyleTitle.copyWith(fontSize: 20),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder<List<Agenda>>(
            future: context.read<ManagerProxyProvider>().getAgenda(),
            builder: (context, snapshot) {
              if (snapshot.hasData &&
                  snapshot.data!.isNotEmpty &&
                  snapshot.connectionState == ConnectionState.done) {
                List<Widget> children = snapshot.data!.map((agenda) {
                  return CardAgenda(agenda: agenda);
                }).toList();
                return ListView(
                  children: children,
                );
              } else {
                return SizedBox(
                  height: size.height,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Styles.white,
                    ),
                  ),
                );
              }
            },
          ),
        ));
  }
}
