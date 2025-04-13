import 'package:flutter/material.dart';

List<BoxShadow> cardShadow(BuildContext context) {
  return [
    BoxShadow(
        blurRadius: 2,
        offset: const Offset(1, 1),
        color: Theme.of(context).colorScheme.onPrimary.withAlpha(20),
        spreadRadius: 0),
    BoxShadow(
        blurRadius: 2,
        offset: const Offset(-1, -1),
        color: Theme.of(context).colorScheme.surface.withAlpha(20),
        spreadRadius: 0),
  ];
}
