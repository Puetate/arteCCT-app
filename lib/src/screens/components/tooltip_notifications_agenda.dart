import 'package:arte_ctt_app/src/data/datasource/api_repository_impl.dart';
import 'package:arte_ctt_app/src/domain/models/agenda.dart';
import 'package:flutter/material.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';

import '../../utils/app_styles.dart';
import 'card_agenda.dart';
import 'package:badges/badges.dart' as badges;

class TooltipNotificationsAgenda extends StatelessWidget {
  const TooltipNotificationsAgenda({
    super.key,
    required this.tooltipController,
  });

  final JustTheController tooltipController;

  @override
  Widget build(BuildContext context) {
    final service = ApiRepositoryImpl();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: JustTheTooltip(
        isModal: true,
        controller: tooltipController,
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 500,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Agenda Cultural',
                        style: Styles.textStyleTitleAgendaCultural
                            .copyWith(color: Styles.primaryColor),
                      ),
                    ],
                  ),
                  FutureBuilder<List<Agenda>>(
                    future: service.getAgenda(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData &&
                          snapshot.connectionState == ConnectionState.done) {
                        List<Widget> children = snapshot.data!.map((agenda) {
                          return CardAgenda(agenda: agenda);
                        }).toList();
                        return Column(
                          children: children,
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        child: badges.Badge(
          position: badges.BadgePosition.topEnd(top: -10, end: -5),
          showBadge: true,
          ignorePointer: false,
          badgeContent: const Text(" "),
          badgeAnimation: const badges.BadgeAnimation.slide(),
          child: const Icon(Icons.notifications, size: 27, color: Colors.white),
        ),
      ),
    );
  }
}
