import 'package:flutter/material.dart';

class HackathonInfo extends StatelessWidget {
  const HackathonInfo({super.key, required this.title, required this.icon});
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 8),
          Text(title),
        ],
      ),
    );
  }
}
