import 'package:flutter/material.dart';

class HackathonMainDetail extends StatelessWidget {
  const HackathonMainDetail(
      {super.key,
      required this.hackathonImage,
      required this.hackathonName,
      required this.hackathonDetail});

  final String hackathonImage;
  final String hackathonName;
  final String hackathonDetail;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          hackathonImage,
        ),
      ),
      const SizedBox(height: 16),
      Text(
        hackathonName,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
      ),
      Text(hackathonDetail,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              )),
    ]);
  }
}
