import 'package:bezfy/assets/app_sizes.dart';
import 'package:flutter/material.dart';

class NewsOfTheHour extends StatelessWidget {
  const NewsOfTheHour({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
            height: 150,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  "assets/images/jpeg.jpeg",
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 30,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: Colors.white60,
                    ),
                    child: const Center(child: Text("Тема часа")),
                  ),
                  gapH32,
                  const SizedBox(
                    width: 200,
                    child: Text(
                      "Президент заявилб, что военные сделают все для нормализации жизни шко...",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}