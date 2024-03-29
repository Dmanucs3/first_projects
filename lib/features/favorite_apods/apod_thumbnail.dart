import 'package:navigationn/features/shared/models/apod.dart';
import 'package:flutter/material.dart';

class ApodThumbnail extends StatelessWidget {
  const ApodThumbnail(
    this.apod, {
    Key? key,
  }) : super(key: key);

  final Apod apod;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(apod.displayImageUrl!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            apod.title,
            maxLines: 1,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            apod.copyright,
            style: Theme.of(context).textTheme.bodyText1,
          )
        ],
      ),
    );
  }
}