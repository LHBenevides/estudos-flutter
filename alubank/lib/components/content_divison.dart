import 'package:alubank/themes/theme_colors.dart';
import 'package:flutter/material.dart';

class ContentDivison extends StatelessWidget {
const ContentDivison({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      height: 1,
      decoration: BoxDecoration(
        border: Border.all(color: ThemeColors.division)
      ),
    );
  }
}