import 'package:flutter/material.dart';

class HackathonCard extends StatelessWidget {
  const HackathonCard(
      {super.key,
      required this.hackathonName,
      required this.hackathonLocation,
      required this.hackathonDate});

  final String hackathonName;
  final String hackathonLocation;
  final String hackathonDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).colorScheme.secondary),
      height: MediaQuery.of(context).size.height * 0.4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12), topRight: Radius.circular(12)),
            child: Image.asset(
              "assets/images/hackathon_image.png",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hackathonName,
                  style: const TextStyle(fontSize: 20, color: Color(0xff62c1c7)),
                ),
                const SizedBox(
                  height: 22,
                ),
                Row(
                  children: [
                    const Icon(Icons.location_on),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(hackathonLocation),
                  ],
                ),
                const SizedBox(
                  height: 14,
                ),
                Row(
                  children: [
                    const Icon(Icons.date_range),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(hackathonDate),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
