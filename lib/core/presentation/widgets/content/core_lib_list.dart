import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meowdify/core/widgets/effect.dart';

class MusicLib extends StatelessWidget {
  const MusicLib({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white, boxShadow: cardShadow(context)),
          child: ScrollConfiguration(
            behavior:
                ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: ListView.builder(
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
                  subtitle: const Text('Artist Name'),
                  onTap: () {
                    // Handle item tap
                  },
                );
              },
            ),
          )),
    );
  }
}
