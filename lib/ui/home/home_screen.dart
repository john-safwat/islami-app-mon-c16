import 'package:flutter/material.dart';
import 'package:islami_mon_c16_online/core/styles/app_colors.dart';
import 'package:islami_mon_c16_online/model/sura_dm.dart';
import 'package:islami_mon_c16_online/ui/home/bottom_navigation_bar_icon.dart';
import 'package:islami_mon_c16_online/ui/home/tabs/hadeth_tab.dart';
import 'package:islami_mon_c16_online/ui/home/tabs/quran_tab/quran_tab.dart';
import 'package:islami_mon_c16_online/ui/home/tabs/radio_tab.dart';
import 'package:islami_mon_c16_online/ui/home/tabs/sebha_tab.dart';
import 'package:islami_mon_c16_online/ui/home/tabs/time_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/homeScreen";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    SuraDM.generateSurasList();
  }

  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab(),
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: tabs[selectedIndex],
      backgroundColor: AppColors.black,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.gold,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedItemColor: AppColors.white,
        unselectedItemColor: AppColors.black,
        items: [
          BottomNavigationBarItem(
            icon: BottomNavigationBarIcon(
              selectedIndex == 0,
              "assets/images/ic_quran.png",
            ),
            label: "Quran",
          ),
          BottomNavigationBarItem(
            icon: BottomNavigationBarIcon(
              selectedIndex == 1,
              "assets/images/ic_hadeth.png",
            ),
            label: "Hadeth",
          ),
          BottomNavigationBarItem(
            icon: BottomNavigationBarIcon(
              selectedIndex == 2,
              "assets/images/ic_sebha.png",
            ),
            label: "Sebha",
          ),
          BottomNavigationBarItem(
            icon: BottomNavigationBarIcon(
              selectedIndex == 3,
              "assets/images/ic_radio.png",
            ),
            label: "Radio",
          ),
          BottomNavigationBarItem(
            icon: BottomNavigationBarIcon(
              selectedIndex == 4,
              "assets/images/ic_time.png",
            ),
            label: "Time",
          ),
        ],
      ),
    );
  }
}
