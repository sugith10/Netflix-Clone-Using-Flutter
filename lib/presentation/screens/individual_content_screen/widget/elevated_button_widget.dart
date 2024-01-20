import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final Color color;
  final Color textColor;
  final IconData iconData;
  final String text;
  const ElevatedButtonWidget({
    required this.color,
    required this.textColor,
    required this.iconData,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(
              color,
            ),
            shape: MaterialStatePropertyAll(ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(5))),
            fixedSize: const MaterialStatePropertyAll(Size(double.infinity, 50))),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
            iconData,
              color: textColor,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 15.5,
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ));
    ;
  }
}
