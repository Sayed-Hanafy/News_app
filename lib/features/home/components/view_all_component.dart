import 'package:flutter/material.dart';
import 'package:news_app/core/them/light_color.dart';

class ViewAllComponent extends StatelessWidget {
  const ViewAllComponent({super.key, required this.title,this.textColor, required this.onTap});

  final String title;
  final Color? textColor;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
           title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: textColor ?? LightColor.background),
          ),
          InkWell(
            onTap: () => onTap(),
            child: Text(
              "View all",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color:textColor ?? LightColor.background,
                decoration: TextDecoration.underline,
                decorationColor: LightColor.background,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
