import 'package:bezfy/features/UI/pages/news_screen/widgets/drawer/main_drawer.dart';
import 'package:bezfy/features/UI/pages/news_screen/widgets/news_screen_list/news_screen_list.dart';
import 'package:flutter/material.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  static const routeName = '/';

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          children: [
            Text("The Moscow Post"),
            Text(
              "Умеренный взгляд на сложные веши",
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.black54,
      ),
      drawer: const MainDrawer(),
      body: const NewsScreenList(),
    );
  }
}
