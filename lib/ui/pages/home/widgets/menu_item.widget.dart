import 'package:flutter/material.dart';

class MenuItemWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const MenuItemWidget(
      {super.key,
      required this.icon,
      required this.title,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,

            ),
          )
        ],
      ),
      onTap: () {
        onTap();
      },
    );
  }
}
