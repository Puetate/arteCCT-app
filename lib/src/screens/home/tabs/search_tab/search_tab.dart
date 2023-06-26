import 'package:arte_ctt_app/src/screens/components/card_picture.dart';
import 'package:arte_ctt_app/src/screens/components/search_input.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children:[
         Column(
        children: [
          const Gap(60),
          SearchInput(
            onSearchChange: (value) {
              print("search value ${value}");
            },
          ),
          const Gap(60),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            children: const [
              Padding(padding: EdgeInsets.all(8),child: CardPicture(),),
              Padding(padding: EdgeInsets.all(8),child: CardPicture(),),
              Padding(padding: EdgeInsets.all(8),child: CardPicture(),),
              Padding(padding: EdgeInsets.all(8),child: CardPicture(),),
              Padding(padding: EdgeInsets.all(8),child: CardPicture(),),
              Padding(padding: EdgeInsets.all(8),child: CardPicture(),),
          
            ],
          )
        ],
      ),
      ]
    );
  }
}
