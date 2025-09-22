import 'package:flutter/material.dart';
import 'package:islami_mon_c16_online/core/styles/app_colors.dart';

class BottomNavigationBarIcon extends StatelessWidget {
  final bool selected;
  final String image;

  const BottomNavigationBarIcon(this.selected, this.image, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.black.withAlpha(selected ? 70 : 0),
        borderRadius: BorderRadius.circular(100),
      ),
      child: ImageIcon(AssetImage(image)),
    );
  }
}
