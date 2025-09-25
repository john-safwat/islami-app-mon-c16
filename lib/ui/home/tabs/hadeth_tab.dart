import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_mon_c16_online/core/styles/app_colors.dart';
import 'package:islami_mon_c16_online/model/hadeth_dm.dart';
import 'package:islami_mon_c16_online/ui/hadeth_details/hadeth_details_screen.dart';

class HadethTab extends StatefulWidget {
  const HadethTab({super.key});

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<HadethDm> ahadeth = [];

  @override
  void initState() {
    super.initState();
    _loadAhadeth();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/hadith_bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.black.withAlpha(70), AppColors.black],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/images/img_header.png",
                    width: MediaQuery.of(context).size.width * 0.6,
                  ),
                ),
                SizedBox(height: 16),
                Expanded(
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: double.infinity,
                      viewportFraction: 0.75,
                      enableInfiniteScroll: true,
                      enlargeCenterPage: true,
                    ),
                    items:
                        ahadeth
                            .map(
                              (hadeth) => InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    HadethDetailsScreen.routeName,
                                    arguments: hadeth,
                                  );
                                },
                                child: Container(
                                  width: double.infinity,

                                  decoration: BoxDecoration(
                                    color: AppColors.gold,
                                    borderRadius: BorderRadius.circular(24),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        "assets/images/HadithCardBackGround 1.png",
                                      ),
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Row(
                                          children: [
                                            ImageIcon(
                                              AssetImage(
                                                "assets/images/img_left_corner.png",
                                              ),
                                              size: 64,
                                              color: AppColors.black,
                                            ),
                                            Expanded(
                                              child: Text(
                                                hadeth.title,
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            ImageIcon(
                                              AssetImage(
                                                "assets/images/img_right_corner.png",
                                              ),
                                              size: 64,
                                              color: AppColors.black,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Text(
                                            hadeth.content,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                      Image.asset(
                                        "assets/images/img_bottom_decoration.png",
                                        color: AppColors.black,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                  ),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _loadAhadeth() async {
    var content = await rootBundle.loadString("assets/files/ahadeeth.txt");
    var ahadethStrings = content.trim().split("#");
    for (String hadethString in ahadethStrings) {
      var hadethLines = hadethString.trim().split("\n");
      String title = hadethLines[0];
      hadethLines = hadethLines.sublist(1);
      String content = hadethLines.join(" ");
      ahadeth.add(HadethDm(title, content));
    }
    setState(() {});
  }
}
