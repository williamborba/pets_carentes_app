import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pets_carentes_app/index.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final int pageIndex;
  final Function(int pageIndex) onChangePage;

  const BottomNavigationBarWidget({
    super.key,
    required this.pageIndex,
    required this.onChangePage,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (int index) => onChangePage(index),
      currentIndex: pageIndex,
      type: BottomNavigationBarType.fixed,
      selectedFontSize: 0,
      items: const [
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(top: SpacingParam.s6),
            child: Icon(
              FontAwesomeIcons.house,
            ),
          ),
          label: '',
        ),
        // BottomNavigationBarItem(
        //   icon: Padding(
        //     padding: EdgeInsets.only(top: 12),
        //     child: Icon(
        //       FontAwesomeIcons.basketShopping,
        //     ),
        //   ),
        //   label: '',
        // ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(top: SpacingParam.s6),
            child: Icon(
              FontAwesomeIcons.paw,
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(top: SpacingParam.s6),
            child: Icon(
              FontAwesomeIcons.message,
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(top: SpacingParam.s6),
            child: Icon(
              FontAwesomeIcons.userLarge,
            ),
          ),
          label: '',
        ),
      ],
    );
  }
}
