import 'package:arte_ctt_app/src/screens/components/card_picture.dart';
import 'package:arte_ctt_app/src/screens/components/search_input.dart';
import 'package:arte_ctt_app/src/utils/app_layout.dart';
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
      final Size size = AppLayout.getSize(context);
    return Column(
        children: [
     const Gap(60),
     SearchInput(
       onSearchChange: (value) {
         print("search value ${value}");
       },
     ),
     const Gap(60),
     Container(
      height: size.height - 290,
       child: GridView.count(
         shrinkWrap: true,
         crossAxisCount: 2,
         scrollDirection: Axis.vertical,
         children: const [
           Padding(padding: EdgeInsets.all(8),child: CardPicture(urlImage:  'https://culturatungurahua.com/wp-content/uploads/2022/12/cuadro-24.gif',title: "Caballos briosos",),),
           Padding(padding: EdgeInsets.all(8),child: CardPicture(urlImage:  'https://culturatungurahua.com/wp-content/uploads/2022/12/cuadro-24.gif',title: "Caballos briosos",),),
           Padding(padding: EdgeInsets.all(8),child: CardPicture(urlImage:  'https://culturatungurahua.com/wp-content/uploads/2022/12/cuadro-24.gif',title: "Caballos briosos",),),
           Padding(padding: EdgeInsets.all(8),child: CardPicture(urlImage:  'https://culturatungurahua.com/wp-content/uploads/2022/12/cuadro-24.gif',title: "Caballos briosos",),),
           Padding(padding: EdgeInsets.all(8),child: CardPicture(urlImage:  'https://culturatungurahua.com/wp-content/uploads/2022/12/cuadro-24.gif',title: "Caballos briosos",),),
           Padding(padding: EdgeInsets.all(8),child: CardPicture(urlImage:  'https://culturatungurahua.com/wp-content/uploads/2022/12/cuadro-24.gif',title: "Caballos briosos",),),
           Padding(padding: EdgeInsets.all(8),child: CardPicture(urlImage:  'https://culturatungurahua.com/wp-content/uploads/2022/12/cuadro-24.gif',title: "Caballos briosos",),),
           Padding(padding: EdgeInsets.all(8),child: CardPicture(urlImage:  'https://culturatungurahua.com/wp-content/uploads/2022/12/cuadro-24.gif',title: "Caballos briosos",),),
           Padding(padding: EdgeInsets.all(8),child: CardPicture(urlImage:  'https://culturatungurahua.com/wp-content/uploads/2022/12/cuadro-24.gif',title: "Caballos briosos",),),
           Padding(padding: EdgeInsets.all(8),child: CardPicture(urlImage:  'https://culturatungurahua.com/wp-content/uploads/2022/12/cuadro-24.gif',title: "Caballos briosos",),),
          
         ],
       ),
     )
        ],
      );
  }
}
