import 'package:flutter/material.dart';
import 'package:meowdify/core/widgets/general.dart';

import 'package:get/get.dart';
import 'package:meowdify/features/music_creator/presentation/controller/monthly_toggle_button.dart';
import 'package:meowdify/features/music_creator/presentation/widget/common.dart';

class Overview extends StatelessWidget {
  const Overview({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          DashboardTitle(),
          Padding(padding: EdgeInsets.all(10), child: DiagramArea()),
          TotalData(),
        ],
      ),
    );
  }
}
// TODO need track listen interaction table for data record 

class TotalData extends StatelessWidget {
  const TotalData({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child: MeoCard(
          padding: 10,
          radius: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Total listener",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 4),
              Text("13.4k"),
            ],
          ),
        )),
        SizedBox(width: 10),
        Expanded(
            child: MeoCard(
          padding: 10,
          radius: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Total Listen amount",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 4),
              Text("13.4k"),
            ],
          ),
        )),
        SizedBox(width: 10),
        Expanded(
            child: MeoCard(
          padding: 10,
          radius: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Total follow amount",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 4),
              Text("13.4k"),
            ],
          ),
        )),
      ],
    );
  }
}

class DiagramArea extends StatelessWidget {
  const DiagramArea({super.key});

  @override
  Widget build(BuildContext context) {
    final OverviewController controller = Get.put(OverviewController());
    return Obx(() {
      return controller.isMonthly.value
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MeoDiagram(
                  values: List.generate(
                    controller.isMonthly.value ? 30 : 7,
                    (i) => generateNumber(),
                  ),
                  isMonthly: true,
                ),
                const SizedBox(height: 4),
                secondaryTitileText("Music Play Diagram"),
                const SizedBox(height: 10),
                MeoDiagram(
                  values: List.generate(
                    controller.isMonthly.value ? 30 : 7,
                    (i) => generateNumber(),
                  ),
                  isMonthly: true,
                ),
                const SizedBox(height: 4),
                secondaryTitileText("Music Likes Diagram"),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(children: [
                  MeoDiagram(
                      values: List.generate(
                    controller.isMonthly.value ? 30 : 7,
                    (i) => generateNumber(),
                  )),
                  const SizedBox(height: 4),
                  secondaryTitileText("Music Like Diagram"),
                ]),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    MeoDiagram(
                      values: List.generate(
                        controller.isMonthly.value ? 30 : 7,
                        (i) => generateNumber(),
                      ),
                    ),
                    const SizedBox(height: 4),
                    secondaryTitileText("Music Like Diagram"),
                  ],
                )
              ],
            );
    });
  }
}

class DashboardTitle extends StatelessWidget {
  const DashboardTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Music Analytics",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        MonthlyToggleButton()
      ],
    );
  }
}

class MonthlyToggleButton extends StatelessWidget {
  const MonthlyToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    final OverviewController controller = Get.put(OverviewController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Obx(() {
          return controller.isMonthly.value
              ? OutlinedButton(
                  onPressed: () => controller.toggleView(false),
                  child: const Text("Weekly"),
                )
              : ElevatedButton(
                  onPressed: () => controller.toggleView(false),
                  child: const Text("Weekly"),
                );
        }),
        const SizedBox(width: 10),
        Obx(() {
          return controller.isMonthly.value
              ? ElevatedButton(
                  onPressed: () => controller.toggleView(true),
                  child: const Text("Monthly"),
                )
              : OutlinedButton(
                  onPressed: () => controller.toggleView(true),
                  child: const Text("Monthly"),
                );
        }),
      ],
    );
  }
}

class MeoDiagram extends StatelessWidget {
  final List<double> values;
  final bool isMonthly; // true = 30 days, false = 7 days (week)

  const MeoDiagram({
    super.key,
    required this.values,
    this.isMonthly = false,
  });

  @override
  Widget build(BuildContext context) {
    final displayCount = isMonthly ? 30 : 7;
    final displayedValues = values.take(displayCount).toList();

    final max = displayedValues.isNotEmpty
        ? displayedValues.reduce((a, b) => a > b ? a : b)
        : 1;

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: List.generate(displayedValues.length, (index) {
          final value = displayedValues[index];
          final height = value == 0 ? 0.0 : (value / max) * 140;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 20,
                  height: height,
                  decoration: BoxDecoration(
                    color: value == 0
                        ? Colors.transparent
                        : Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  value.toStringAsFixed(0),
                  style: const TextStyle(fontSize: 10),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
