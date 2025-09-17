import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../data/data_models/article.dart';

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
          CachedNetworkImage(
            imageUrl: article?.urlToImage ?? '',
            width: double.infinity,
            height: MediaQuery.of(context).size.height * .3,
            fit: BoxFit.fill,
            placeholder:
                (context, url) => Center(child: CircularProgressIndicator()),
            errorWidget:
                (context, url, error) => Image.asset(
                  'assets/images/notAvailable.png',
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * .3,
                  fit: BoxFit.fill,
                ),
          ),

          Text(
            article?.source.name ?? "",
            style: theme.bodySmall!.copyWith(fontSize: 10),
          ),
          Text(article?.description ?? "", style: theme.bodySmall),
        ],
      ),
    );
  }
}
