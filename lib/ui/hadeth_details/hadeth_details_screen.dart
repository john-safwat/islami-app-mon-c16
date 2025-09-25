import 'package:flutter/material.dart';
import 'package:islami_mon_c16_online/core/styles/app_colors.dart';
import 'package:islami_mon_c16_online/model/hadeth_dm.dart';
import 'package:islami_mon_c16_online/ui/widgets/content_details_widget.dart';

class HadethDetailsScreen extends StatelessWidget {
  static const String routeName = "hadeth_details_screen";

  const HadethDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var hadeth = ModalRoute.of(context)!.settings.arguments as HadethDm;
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        title: Text("Hadeth Details"),
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.gold,
      ),
      body: ContentDetailsWidget(title: hadeth.title, content: hadeth.content),
    );
  }
}
