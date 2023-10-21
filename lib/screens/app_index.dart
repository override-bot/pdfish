// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pdfish/utils/textstyle.dart';
import 'package:pdfish/viewmodels/base_viewmodel.dart';
import 'package:provider/provider.dart';

class AppIndex extends StatefulWidget {
  const AppIndex({super.key});

  @override
  State<AppIndex> createState() => _AppIndexState();
}

class _AppIndexState extends State<AppIndex> {
  List<Widget> children = [
    Container(),
    Container(),
    Container(),
    Container(),
  ];
  @override
  Widget build(BuildContext context) {
    BaseViewmodel _baseViewmodel = Provider.of<BaseViewmodel>(context);
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.white,
        ),
        child: BottomNavigationBar(
          currentIndex: _baseViewmodel.currentIndex,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey,
          selectedLabelStyle:
              ResponsiveTextStyle(fontSize: 10, color: Colors.red)
                  .textStyle(context),
          unselectedLabelStyle:
              ResponsiveTextStyle(fontSize: 10, color: Colors.grey)
                  .textStyle(context),
          elevation: 5.0,
          // ignore: prefer_const_literals_to_create_immutables
          items: [
            BottomNavigationBarItem(
                label: "Home",
                icon: Icon(
                  Icons.home_outlined,
                  size: 20,
                )),
            BottomNavigationBarItem(
                label: "Documents",
                icon: Icon(
                  Icons.folder_outlined,
                  size: 20,
                )),
            BottomNavigationBarItem(
                label: "Tools",
                icon: Icon(
                  Icons.category_outlined,
                  size: 20,
                )),
            BottomNavigationBarItem(
                label: "Me",
                icon: Icon(
                  Icons.person_outline_outlined,
                  size: 20,
                ))
          ],
          onTap: (index) {
            _baseViewmodel.setCurrentIndex(index);
          },
        ),
      ),
      body: children[_baseViewmodel.currentIndex],
    );
  }
}
