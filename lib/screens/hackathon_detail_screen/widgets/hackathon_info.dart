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
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(200),
              color: const Color(0xff695678).withOpacity(0.1),
            ),
            width: 40,
            height: 40,
            child: Icon(
              icon,
            ),
          ),
          const SizedBox(width: 8),
          Text(title, style: Theme.of(context).textTheme.titleMedium
              //TextStyle(color: Colors.black.withOpacity(0.8),),
              ),
        ],
      ),
    );
  }
}
