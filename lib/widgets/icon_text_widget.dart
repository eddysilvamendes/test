import 'package:flutter/cupertino.dart';
import 'package:shopping_app/widgets/text_widget.dart';

class IconAndTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  final Color iconColor;
  final double? size;
  IconAndTextWidget(
      {Key? key,
      required this.text,
      this.color = const Color(0xFF76c5bb),
      this.iconColor = const Color.fromRGBO(24, 85, 149, 1),
      required this.icon,
      this.size = 12})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor),
        SizedBox(
          width: 5,
        ),
        TextWidget(
          text: text,
          color: color,
          size: size!,
        )
      ],
    );
  }
}
