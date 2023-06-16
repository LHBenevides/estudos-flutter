import 'package:alubank/components/box_card.dart';
import 'package:alubank/components/color_dot.dart';
import 'package:alubank/components/content_divison.dart';
import 'package:alubank/themes/theme_colors.dart';
import 'package:flutter/material.dart';

class PointsAccount extends StatelessWidget {
  const PointsAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Text("Pontos da conta",
                style: Theme.of(context).textTheme.titleMedium),
          ),
          const BoxCard(boxContent: _PointsAccountContent()),
        ],
      ),
    );
  }
}

class _PointsAccountContent extends StatelessWidget {
  const _PointsAccountContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 8.0),
          child: Text("Pontos totais:"),
        ),
        Text('3000', style: Theme.of(context).textTheme.bodyLarge),
        const Padding(
          padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: ContentDivison(),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            "Objetivos:",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                right: 4.0,
              ),
              child: ColorDot(color: ThemeColors.accountPoints['delivery']),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 4.0),
              child: Text("Entrega grátis: 150000pts"),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 4.0),
              child: ColorDot(color: ThemeColors.accountPoints['streaming']),
            ),
            const Text("1 mês de streaming: 300000pts")
          ],
        ),
      ],
    );
  }
}
