import 'package:flutter/material.dart';
import 'package:islami_mon_c16_online/core/styles/app_colors.dart';
import 'package:islami_mon_c16_online/core/styles/text_styles.dart';
import 'package:islami_mon_c16_online/model/sura_dm.dart';
import 'package:islami_mon_c16_online/ui/home/tabs/quran_tab/most_recent_card.dart';
import 'package:islami_mon_c16_online/ui/home/tabs/quran_tab/sura_card.dart';
import 'package:islami_mon_c16_online/ui/sura_details/sura_details_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<SuraDM> searchList = [];
  List<SuraDM> mostRecent = [];

  @override
  void initState() {
    super.initState();
    _loadMostRecent();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/quran_bg.png"),
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextFormField(
                    onChanged: (input) {
                      _searchInSurasList(input);
                    },
                    decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: AppColors.black.withAlpha(70),
                      prefixIcon: ImageIcon(
                        AssetImage("assets/images/ic_quran.png"),
                        color: AppColors.gold,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: AppColors.gold),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: AppColors.gold),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      if (searchList.isEmpty) {
                        return CustomScrollView(
                          slivers: [
                            SliverToBoxAdapter(child: SizedBox(height: 16)),
                            if (mostRecent.isNotEmpty)
                              SliverToBoxAdapter(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0,
                                  ),
                                  child: Text(
                                    "Most Recent",
                                    style: TextStyles.smallLabel(
                                      textColor: AppColors.white,
                                    ),
                                  ),
                                ),
                              ),
                            if (mostRecent.isNotEmpty)
                              SliverToBoxAdapter(
                                child: SizedBox(
                                  height: 180,
                                  child: ListView.separated(
                                    padding: EdgeInsets.all(16),
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder:
                                        (context, index) => MostRecentCard(
                                          sura: mostRecent[index],
                                          onSuraClick: onSuraClick,
                                        ),
                                    separatorBuilder:
                                        (context, index) => SizedBox(width: 8),
                                    itemCount: mostRecent.length,
                                  ),
                                ),
                              ),
                            SliverToBoxAdapter(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0,
                                ),
                                child: Text(
                                  "Suras List",
                                  style: TextStyles.smallLabel(
                                    textColor: AppColors.white,
                                  ),
                                ),
                              ),
                            ),
                            SliverToBoxAdapter(child: SizedBox(height: 16)),
                            SliverList.separated(
                              itemBuilder:
                                  (context, index) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0,
                                    ),
                                    child: SuraCard(
                                      sura: SuraDM.surasList[index],
                                      onSuraClick: onSuraClick,
                                    ),
                                  ),
                              separatorBuilder:
                                  (_, _) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Divider(
                                      indent: 40,
                                      endIndent: 40,
                                      color: AppColors.white,
                                    ),
                                  ),
                              itemCount: SuraDM.surasList.length,
                            ),
                          ],
                        );
                      } else {
                        return ListView.separated(
                          padding: EdgeInsets.all(16),
                          itemBuilder:
                              (context, index) => SuraCard(
                                sura: searchList[index],
                                onSuraClick: onSuraClick,
                              ),
                          separatorBuilder:
                              (_, _) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Divider(
                                  indent: 40,
                                  endIndent: 40,
                                  color: AppColors.white,
                                ),
                              ),
                          itemCount: searchList.length,
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _searchInSurasList(String input) {
    if (input.isEmpty) {
      searchList = [];
    } else {
      searchList =
          SuraDM.surasList
              .where((sura) => sura.nameAr.contains(input))
              .toList();
      if (searchList.isEmpty) {
        searchList =
            SuraDM.surasList
                .where(
                  (sura) =>
                      sura.nameEn.toLowerCase().contains(input.toLowerCase()),
                )
                .toList();
      }
    }
    setState(() {});
  }

  Future<void> _loadMostRecent() async {
    mostRecent = [];
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var mostRecentList = preferences.getStringList("mostRecent") ?? [];
    for (String suraNumber in mostRecentList) {
      var number = int.parse(suraNumber);
      mostRecent.add(SuraDM.surasList[(number - 1)]);
    }
    setState(() {});
  }

  Future<void> storeSuraId(int suraNumber) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var mostRecent = sharedPreferences.getStringList("mostRecent") ?? [];
    if (mostRecent.contains(suraNumber.toString())) {
      mostRecent.removeWhere((e) => e == suraNumber.toString());
    }
    mostRecent = [suraNumber.toString(), ...mostRecent];
    await sharedPreferences.setStringList("mostRecent", mostRecent);
    _loadMostRecent();
  }

  onSuraClick(SuraDM sura) {
    // store sura id in shared preferences
    storeSuraId(sura.suraNumber);

    // here is a navigation to sura details screen
    Navigator.pushNamed(context, SuraDetailsScreen.routeName, arguments: sura);
  }
}
