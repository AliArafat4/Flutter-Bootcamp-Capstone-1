import 'package:flutter/material.dart';
import 'package:team_hack/extentions/size_extention.dart';

class SkillSection extends StatelessWidget {
  const SkillSection({super.key, required this.skillName});
  final String skillName;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Chip(
            color: MaterialStatePropertyAll<Color>(
              const Color(0xff62c1c7).withOpacity(0.1),
            ),
            label: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Text(skillName,
                  style: const TextStyle(
                    color: Color(0xff62c1c7),
                  )),
            )),
        SizedBox(
          width: context.getWidth(factor: 0.01),
        ),
      ],
    );
  }
}
