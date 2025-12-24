import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
                : 475, // максимальная ширина одного элемента
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1,
          ),
          itemCount: sortedList.length,
          itemBuilder: (context, index) {
            final curretntData = sortedList[index];
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Colors.black, width: 3),
              ),
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      curretntData.headertext,
                      style: TextStyle(fontSize: 22),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      curretntData.bodytext,
                      style: TextStyle(fontSize: 12),
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
                            ToastHelper.show('Ошибка открытия страницы');
                          }
                        }
                      },
                      child: const Text(
                        'Перейти',
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
