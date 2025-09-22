import 'package:flutter/material.dart';
import 'package:islami_mon_c16_online/core/styles/app_colors.dart';
import 'package:islami_mon_c16_online/core/styles/text_styles.dart';
import 'package:islami_mon_c16_online/model/sura_dm.dart';
import 'package:islami_mon_c16_online/ui/home/tabs/quran_tab/sura_card.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

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
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "Suras List",
                    style: TextStyles.smallLabel(textColor: AppColors.white),
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.all(16),
                    itemBuilder:
                        (context, index) =>
                            SuraCard(sura: SuraDM.surasList[index],),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
