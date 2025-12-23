import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;
import 'package:url_launcher/url_launcher.dart';

class DesktopHomePage extends StatelessWidget {
  const DesktopHomePage({super.key});
  @override
  Widget build(BuildContext context) {
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
          itemCount: 20,
          itemBuilder: (context, index) {
            if (index == 0) {
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
                        "Добро пожаловать на главную страницу!",
                        style: TextStyle(fontSize: 22),
                        textAlign: TextAlign.center,
                      ),

                      TextButton(
                        onPressed: () async {
                          if (kIsWeb) {
                            html.window.open(
                              'https://github.com/StasyaoSan93',
                              '_blank',
                            );
                          } else {
                            final uri = Uri.parse(
                              'https://github.com/StasyaoSan93',
                            );
                            if (await canLaunchUrl(uri)) {
                              await launchUrl(
                                uri,
                                mode: LaunchMode.externalApplication,
                              );
                            } else {
                              throw 'Could not launch';
                              // всплывающее окно с ошибкой сделать...
                            }
                          }
                        },
                        child: const Text(
                          'Мой GitHib',
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Colors.black, width: 3),
                ),
                alignment: Alignment.center,
                child: Text('Item $index'),
              );
            }
          },
        ),
      ),
    );
  }
}
