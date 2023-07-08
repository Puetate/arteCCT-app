import 'dart:async';

import 'package:arte_ctt_app/src/data/datasource/api_repository_impl.dart';
import 'package:arte_ctt_app/src/domain/models/picture.dart';
import 'package:arte_ctt_app/src/screens/components/card_picture.dart';
import 'package:arte_ctt_app/src/screens/components/search_input.dart';
import 'package:arte_ctt_app/src/utils/app_layout.dart';
import 'package:arte_ctt_app/src/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  late ApiRepositoryImpl service;
  String title = "Buscar Obras";
  String _query = "";
  Timer? _debounce;
  @override
  void initState() {
    super.initState();
    service = ApiRepositoryImpl();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = AppLayout.getSize(context);

    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Text(
              title,
              style: Styles.textStyleTitle,
            ),
          ),
          SearchInput(
            onSearchChange: (value) {
              if (_debounce?.isActive ?? false) _debounce?.cancel();
              _debounce = Timer(const Duration(milliseconds: 300), () {
                setState(() {
                  _query = value;
                });
              });
            },
          ),
          const Gap(10),
          SizedBox(
            height: size.height - 240,
            child: FutureBuilder(
              future: service.getPictures(_query),
              builder: (context, snapshot) {
                if (snapshot.hasData &&
                    snapshot.data!.isNotEmpty &&
                    snapshot.connectionState == ConnectionState.done) {
                  List<Picture> pictures = snapshot.data!;
                  return CustomScrollView(
                    slivers: [
                      SliverGrid(
                          delegate: SliverChildBuilderDelegate(
                              childCount: pictures.length, (context, index) {
                            Picture picture = pictures[index];

                            return CardPicture(
                              picture: picture,
                            );
                          }),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: 200,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5,
                          )),
                    ],
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
          ),
        ],
      ),
    );
  }
}