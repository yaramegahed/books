

import 'package:books/features/home/cubit/books_cubit.dart';
import 'package:books/features/home/model/home_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CardHome extends StatelessWidget {
  final VolumeInfo info;

  const CardHome({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => DetailsScreen(
        //         model: model,
        //       ),
        //     ));
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Expanded(
                child: CachedNetworkImage(
                  imageUrl: info.imageLinks.toString(),
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(
                          value: downloadProgress.progress),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              // Expanded(
              //     child: Image.network(
              //   model.image,
              //   height: 160,
              //   width: 150,
              //   fit: BoxFit.cover,
              // )),

            ],
          ),
        ),
      ),
    );
  }
}
