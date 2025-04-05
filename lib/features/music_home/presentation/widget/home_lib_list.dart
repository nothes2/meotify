import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meowdify/core/widgets/general.dart';

class MusicLib extends StatelessWidget {
  const MusicLib({super.key});

// TODO GET PLAYLIST FROM BACKEND
  @override
  Widget build(BuildContext context) {
    return MeoCard(
        padding: 0,
        radius: 5,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 5, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Your library", style: TextStyle(fontSize: 16)),
                  TextButton(onPressed: () {}, child: const Text("aa")),
                ],
              ),
            ),
            Expanded(
              child: ScrollConfiguration(
                behavior:
                    ScrollConfiguration.of(context).copyWith(scrollbars: false),
                child: ListView.builder(
                  itemCount: 10, // Replace with the actual number of items
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: SvgPicture.asset(
                        'assets/images/icon /ic_loved.svg',
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
              ),
            )
          ],
        ));
  }
}
