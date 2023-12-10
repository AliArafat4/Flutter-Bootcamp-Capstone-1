import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key, required this.bio});

  final String bio;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width - 32,
          child: Text(bio,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onPrimary)
              // TextStyle(color: Colors.black.withOpacity(0.6), fontSize: 14),
              ),
        )
      ],
    );
  }
}
