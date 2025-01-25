import 'package:books/features/home/model/home_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CardHome extends StatelessWidget {
  final VolumeInfo? info;


  const CardHome({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()
        async {
          if (info?.infoLink != null) {
            await _launchUrl(info!.infoLink!);
          }
      },
      child: Card(
        color: Colors.red.shade100,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  height: 200,
                  child: CachedNetworkImage(
                    fit: BoxFit.fill,
                    imageUrl: info?.imageLinks?.smallThumbnail ?? "",
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            CircularProgressIndicator(
                                value: downloadProgress.progress),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
              Text(
                info?.title.toString() ?? "no authors",
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              Row(
                children: [
                  Text(
                    info?.pageCount.toString() ?? "no page count",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                        fontSize: 18),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "pages",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.save_alt,
                    color: Colors.red,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  Future<void> _launchUrl(String url) async {
    final Uri url = Uri.parse(info?.infoLink.toString()??"");
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
} /*
* {kind: books#volumes, totalItems: 768, items:
*  [{kind: books#volume, id: CsNiKdmufvYC, etag: ol5BEW15ROI, selfLink: https://www.googleapis.com/books/v1/volumes/CsNiKdmufvYC, volumeInfo: {title: Introduction to Computer Science, authors: [ITL Education Solutions Limited], publisher: Pearson Education India, publishedDate: 2011, description: Discusses most ideas behind a computer in a simple and straightforward manner. The book is also useful to computer enthusiasts who wish to gain fundamental knowledge of computers.,
*  industryIdentifiers: [{type: ISBN_10, identifier: 8131760308}, {type: ISBN_13, identifier: 9788131760307}],
*  readingModes: {text: false, image: true}, pageCount: 536, printType: BOOK, categories: [Computer science], averageRating: 4.5, ratingsCount: 6, maturityRating: NOT_MATURE, allowAnonLogging: false, contentVersion: 0.3.4.0.preview.1, panelizationSummary: {containsEpubBubbles: false, containsImageBubbles: false}, imageLinks: {smallThumbnail: http://books.google.com/books/content?id=CsNiKdmufvY
* */
