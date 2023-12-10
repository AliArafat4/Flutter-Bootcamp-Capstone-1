import 'package:flutter/material.dart';

class HackathonCard extends StatelessWidget {
  const HackathonCard(
      {super.key,
      required this.hackathonName,
      required this.hackathonLocation,
      required this.hackathonDate,
      required this.hackathonField});

  final String hackathonName;
  final String hackathonLocation;
  final String hackathonDate;
  final String hackathonField;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).colorScheme.secondary),
      height: MediaQuery.of(context).size.height * 0.44,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12), topRight: Radius.circular(12)),
            child: Image.asset(
              "assets/images/hackImage.png",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hackathonName,
                  style:
                      const TextStyle(fontSize: 20, color: Color(0xff62c1c7)),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    const Icon(Icons.location_on_outlined),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(hackathonLocation),
                  ],
                ),
                const SizedBox(
                  height: 8,
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
                Text(hackathonField),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
