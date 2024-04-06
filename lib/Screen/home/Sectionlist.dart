import 'package:flutter/material.dart';

/*
 * 
 *    Manage Your Membership Section
 * 
 * 
 * 
 */
class Sectionlist extends StatelessWidget {
  const Sectionlist(
      {super.key,
      required this.ontap,
      required this.imageicon,
      required this.text});

  final VoidCallback ontap;
  final String imageicon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ListTile(
          leading: Image.asset(
            imageicon,
            width: 35,
            height: 35,
          ),
          title: Text(
            text,
            style: const TextStyle(color: Color(0xfffEDC967)),
          ),
          trailing: IconButton(
              onPressed: ontap,
              icon: const Icon(
                Icons.arrow_forward_ios_rounded,
                color: Color(0xfffEDC967),
              )),
        )
      ],
    );
  }
}
