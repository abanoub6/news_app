import 'package:flutter/material.dart';

class NewsItemWidget extends StatelessWidget {
  final String source;
  const NewsItemWidget({super.key, required this.source});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            "assets/images/football.png",
            width: double.infinity,
            height: MediaQuery.of(context).size.height * .3,
            fit: BoxFit.fill,
          ),
          Text(source, style: theme.bodySmall!.copyWith(fontSize: 10)),
          Text(
            "Why are football's biggest clubs starting a new tournament?",
            style: theme.bodySmall,
          ),
        ],
      ),
    );
  }
}
