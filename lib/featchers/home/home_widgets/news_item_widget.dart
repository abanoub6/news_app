import 'package:flutter/material.dart';

import '../../../data/api/news/article.dart';

class NewsItemWidget extends StatelessWidget {
  final Article? article;
  const NewsItemWidget({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            article?.urlToImage ?? 'assets/images/news.png',
            width: double.infinity,
            height: MediaQuery.of(context).size.height * .3,
            fit: BoxFit.fill,
          ),
          Text(
            article?.source.name ?? "",
            style: theme.bodySmall!.copyWith(fontSize: 10),
          ),
          Text(article?.content ?? "", style: theme.bodySmall),
        ],
      ),
    );
  }
}
