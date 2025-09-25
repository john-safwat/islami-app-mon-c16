import 'package:flutter/material.dart';
import 'package:islami_mon_c16_online/core/styles/text_styles.dart';

class ContentDetailsWidget extends StatelessWidget {
  final String title;
  final String content;

  const ContentDetailsWidget({
    required this.title,
    required this.content,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Image.asset("assets/images/img_right_corner.png"),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyles.mediumLabel(),
                    textAlign: TextAlign.center,
                  ),
                ),
                Image.asset("assets/images/img_left_corner.png"),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Text(
                content,
                style: TextStyles.largeBody(),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Image.asset("assets/images/img_bottom_decoration.png"),
        ],
      ),
    );
  }
}
