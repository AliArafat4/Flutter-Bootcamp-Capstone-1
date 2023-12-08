import 'package:flutter/material.dart';

class SkillSection extends StatelessWidget {
  const SkillSection({super.key, required this.skillName});
  final String skillName;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: const Color(0xff95beff).withOpacity(0.2),
            ),
            width: MediaQuery.of(context).size.width / 4,
            height: MediaQuery.of(context).size.height / 22,
            child: Center(
              child: Text(skillName,
                  style: const TextStyle(
                    color: Color(0xff0477f4),
                  )),
            )),
        const SizedBox(
          width: 16,
        )
      ],
    );
  }
}
