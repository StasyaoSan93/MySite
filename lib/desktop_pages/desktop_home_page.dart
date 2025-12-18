import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;
import 'package:url_launcher/url_launcher.dart';

class DesktopHomePage extends StatelessWidget {
  const DesktopHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
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
                    final uri = Uri.parse('https://github.com/StasyaoSan93');
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
      ],
    );
  }
}
