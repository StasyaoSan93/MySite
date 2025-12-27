import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:isaprog_mainsite/core/providers/main_provider.dart';
import 'package:provider/provider.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});
  @override
  Widget build(BuildContext context) {
    final mainProvider = context.watch<MainProvider>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: mainProvider.infoPageDatas.datas.length,
                itemBuilder: (context, index) {
                  final infoPageDataItem =
                      mainProvider.infoPageDatas.datas[index];
                  if (index == 0) {
                    return Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(55),
                          child: SizedBox(
                            height: 300,
                            width: 300,
                            child: CachedNetworkImage(
                              imageUrl:
                                  'https://isaprog.com/downloadfiles/myPhoto.jpeg',
                              fit: BoxFit.cover,
                              placeholder: (context, url) =>
                                  Center(child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.image, size: 125),
                            ),
                          ),
                        ),
                        Divider(),
                        Text(infoPageDataItem.headertext),
                        Text(
                          infoPageDataItem.bodytext,
                          textAlign: TextAlign.justify,
                        ),
                        Divider(),
                      ],
                    );
                  } else {
                    return Column(
                      children: [
                        Text(infoPageDataItem.headertext),
                        Text(
                          infoPageDataItem.bodytext,
                          textAlign: TextAlign.justify,
                        ),
                        Divider(),
                      ],
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
