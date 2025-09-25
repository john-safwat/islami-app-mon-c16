import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_mon_c16_online/core/styles/app_colors.dart';
import 'package:islami_mon_c16_online/core/styles/text_styles.dart';
import 'package:islami_mon_c16_online/model/sura_dm.dart';
import 'package:islami_mon_c16_online/ui/widgets/content_details_widget.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = "/suraDetails";

  SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  late SuraDM sura;

  String? content;

  @override
  Widget build(BuildContext context) {
    sura = ModalRoute.of(context)?.settings.arguments as SuraDM;
    if (content == null) {
      readSuraDetails(sura.suraNumber);
    }
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.gold,
        title: Text(sura.nameEn, style: TextStyles.mediumLabel()),
      ),
      body:
          content == null
              ? Center(child: CircularProgressIndicator())
              : Directionality(
                textDirection: TextDirection.rtl,
                child: ContentDetailsWidget(
                  title: sura.nameAr,
                  content: content ?? "",
                ),
              ),
    );
  }

  // async / await
  Future<void> readSuraDetails(int suraNumber) async {
    String suraContent = await rootBundle.loadString(
      "assets/files/$suraNumber.txt",
    );
    List<String> suraAyas = suraContent.trim().split("\n");
    suraContent = "";
    for (int i = 0; i < suraAyas.length; i++) {
      suraContent = "$suraContent[${i + 1}] ${suraAyas[i].trim()} ";
    }
    content = suraContent;
    setState(() {});
  }
}
