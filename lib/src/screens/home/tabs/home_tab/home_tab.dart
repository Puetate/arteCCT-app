import 'package:arte_ctt_app/src/data/datasource/api_repository_impl.dart';
import 'package:arte_ctt_app/src/domain/models/picture.dart';
import 'package:arte_ctt_app/src/screens/components/gradient_container.dart';
import 'package:arte_ctt_app/src/screens/home/tabs/home_tab/components/picture_component.dart';
import 'package:arte_ctt_app/src/utils/app_layout.dart';
import 'package:arte_ctt_app/src/utils/app_styles.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  ApiRepositoryImpl serviceApi = ApiRepositoryImpl();
  @override
  Widget build(BuildContext context) {
    final Size size = AppLayout.getSize(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ListView(
        children: [
          Stack(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    PictureFrontPage(
                      heightPicture: (size.height - 112),
                      width: size.width,
                      heightGradient: (size.height * 0.13),
                      picture: Picture(
                          id: '1',
                          name: 'name',
                          autor: 'autor',
                          image: 'assets/images/image_1.png'),
                    ),
                    PictureFrontPage(
                      heightPicture: (size.height - 112),
                      width: size.width,
                      heightGradient: (size.height * 0.13),
                      picture: Picture(
                          id: '1',
                          name: 'pepeniño',
                          autor: 'autor',
                          image: 'assets/images/image_1.png'),
                    ),
                  ],
                ),
              ),
              GradientContainer(
                  turn: 0,
                  withContainer: size.width,
                  heightContainer: (size.height * 0.13)),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15, left: 20),
                    child: Text(
                      "Buenos Dias",
                      style: Styles.textStyleTitle,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Text('texto---'),
          Text('texto---'),
          Text('texto---'),
          Text('texto---'),
          Text('texto---'),
          Text('texto---'),
          Text('texto---'),
          Text('texto---'),
          Text('texto---'),
          Text('texto---'),
          Text('texto---'),
          Text('texto---'),
          Text('texto---'),
          Text('texto---'),
          Text('texto---'),
          Text('texto---'),
        ],
      ),
    );
  }
}

/* 
SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: FutureBuilder<List<Picture>>(
                  future: serviceApi.getPictures(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return snapshot.data!.isNotEmpty
                          ? ListView.builder(
                              itemCount: snapshot.data?.length,
                              itemBuilder: (context, index) {
                                final picture = snapshot.data![index];
                                return PictureFrontPage(
                                  heightPicture: (size.height - 112),
                                  width: size.width,
                                  heightGradient: (size.height * 0.13),
                                  picture: picture,
                                );
                              },
                            )
                          : const Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 15),
                                child: Text(
                                  "No existen pinturas destacadas",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Styles.primaryColor,
                        ),
                      );
                    }
                  },
                ),
              ), */