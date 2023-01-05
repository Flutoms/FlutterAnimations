import 'package:flutter/material.dart';

import 'stars_widget.dart';

class ExpandedContentWidget extends StatelessWidget {
  const ExpandedContentWidget({super.key});

  @override
  Widget build(BuildContext context) => Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text('Atoms Workspace',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            buildAddressRating(),
            const SizedBox(height: 12),
            const CircleAvatar(
                radius: 16,
                backgroundColor: Colors.black12,
                backgroundImage: AssetImage('assets/user1.png'))
          ],
        ),
      );

  Widget buildAddressRating() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text('No 1.', style: TextStyle(color: Colors.black45)),
          StarsWidget(stars: 5),
        ],
      );
}
