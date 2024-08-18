import 'package:flutter/material.dart';
import 'package:school_managment/config/app_colors.dart';

class ServiceWidget extends StatelessWidget {
  final isActive;

  final icon;

  final title;

  const ServiceWidget(
      {super.key,
      this.isActive = false,
      required this.title,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 70,
          width: 80,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.background,
                spreadRadius: 1,
                blurRadius: 1,
                // offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Icon(
            icon,
            color: Colors.white ,
            size: 40,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
              overflow: TextOverflow.ellipsis),
        )
      ],
    );
  }
}
