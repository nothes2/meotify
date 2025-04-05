import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meowdify/core/utilities/general.dart';

class ContentPromotion extends StatelessWidget {
  const ContentPromotion({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          // image: DecorationImage(image: AssetImage(''), fit: BoxFit.cover)
          ),
      height: 200,
      child: Row(
        children: [
          const MeoShimmer(hight: 200, width: 200),
          const SizedBox(
            width: 8,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const Text(
                    "title",
                    style: TextStyle(fontSize: 24),
                  ),
                  const Text("info"),
                ],
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Theme.of(context).colorScheme.onPrimary),
                child: const Text("listen rn!"),
              )
            ],
          )
        ],
      ),
    );
  }
}
