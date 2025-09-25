import 'package:flutter/material.dart';
import 'package:islami_mon_c16_online/core/styles/app_colors.dart';
import 'package:islami_mon_c16_online/core/styles/text_styles.dart';
import 'package:islami_mon_c16_online/model/sura_dm.dart';
import 'package:islami_mon_c16_online/ui/sura_details/sura_details_screen.dart';

class SuraCard extends StatelessWidget {
  final SuraDM sura;

  const SuraCard({required this.sura, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // here is a navigation to sura details screen
        Navigator.pushNamed(
          context,
          SuraDetailsScreen.routeName,
          arguments: sura,
        );
      },
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset("assets/images/img_sur_number_frame.png", width: 72),
              Text(
                sura.suraNumber.toString(),
                style: TextStyles.smallLabel(textColor: AppColors.white),
              ),
            ],
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sura.nameEn,
                  style: TextStyles.mediumLabel(textColor: AppColors.white),
                ),
                Text(
                  sura.ayatNumber,
                  style: TextStyles.mediumBody(textColor: AppColors.white),
                ),
              ],
            ),
          ),
          SizedBox(width: 16),
          Text(
            sura.nameAr,
            style: TextStyles.mediumLabel(textColor: AppColors.white),
          ),
        ],
      ),
    );
  }
}
