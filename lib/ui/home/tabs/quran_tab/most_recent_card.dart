import 'package:flutter/material.dart';
import 'package:islami_mon_c16_online/core/styles/app_colors.dart';
import 'package:islami_mon_c16_online/core/styles/text_styles.dart';
import 'package:islami_mon_c16_online/model/sura_dm.dart';

class MostRecentCard extends StatelessWidget {
  final SuraDM sura;

  final Function(SuraDM) onSuraClick;

  const MostRecentCard({
    required this.sura,
    required this.onSuraClick,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onSuraClick(sura);
      },
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.gold,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sura.nameEn,
                  style: TextStyles.mediumLabel(textColor: AppColors.black),
                ),
                Text(
                  sura.nameAr,
                  style: TextStyles.mediumLabel(textColor: AppColors.black),
                ),
                Text(
                  sura.ayatNumber,
                  style: TextStyles.mediumLabel(textColor: AppColors.black),
                ),
              ],
            ),
            Image.asset("assets/images/img_most_recent.png"),
          ],
        ),
      ),
    );
  }
}
