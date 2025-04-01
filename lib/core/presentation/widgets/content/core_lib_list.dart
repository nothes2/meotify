import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MusicLib extends StatelessWidget {
  const MusicLib({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: 10, // Replace with the actual number of items
      itemBuilder: (context, index) {
        return ListTile(
          leading: SvgPicture.asset(
            'assets/images/icon/ic_loved.svg',
            height: 48,
            width: 48,
          ),
          title: Text('Song Title $index'),
          subtitle: Text('Artist Name'),
          onTap: () {
            // Handle item tap
          },
        );
      },
    );
  }
}
