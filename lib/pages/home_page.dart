import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:isaprog_mainsite/core/app_config.dart';
import 'package:isaprog_mainsite/core/models/data_responce_model.dart';
import 'package:isaprog_mainsite/core/providers/main_provider.dart';
import 'package:isaprog_mainsite/core/utils/toast_helper.dart';
import 'package:provider/provider.dart';
import 'package:universal_html/html.dart' as html;
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final mainProvider = context.watch<MainProvider>();
    final sortedList = List<DataResponseModel>.from(
      mainProvider.siteDatas.datas,
    )..sort((a, b) => a.id.compareTo(b.id));
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: screenSize.width < 500
                ? screenSize.width - 25
                : 475,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1,
          ),
          itemCount: sortedList.length,
          itemBuilder: (context, index) {
            final curretntData = sortedList[index];
            final url = curretntData.imageurl;
            return LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadiusGeometry.only(
                          topLeft: Radius.circular(47),
                          topRight: Radius.circular(47),
                        ),
                        child: SizedBox(
                          width: constraints.maxWidth,
                          height: constraints.maxHeight * 0.7, // 30% высоты
                          child: CachedNetworkImage(
                            imageUrl: url,
                            fit: BoxFit.cover,
                            placeholder: (context, url) =>
                                Center(child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.image, size: 125),
                          ),
                        ),
                      ),
                      Spacer(),
                      Text(
                        curretntData.headertext,
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                      TextButton(
                        onPressed: () async {
                          if (kIsWeb) {
                            html.window.open(curretntData.siteurl, '_blank');
                          } else {
                            final uri = Uri.parse(curretntData.siteurl);
                            if (await canLaunchUrl(uri)) {
                              await launchUrl(
                                uri,
                                mode: LaunchMode.externalApplication,
                              );
                            } else {
                              ToastHelper.show(AppConfig.errorOpenPageText);
                            }
                          }
                        },
                        child: const Text(
                          AppConfig.goButtonText,
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
