import 'package:bezfy/features/UI/pages/news_screen/cubit/news_screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: Row(
        children: [
          Flexible(
            child: TextField(
              onChanged: context.read<NewsScreenCubit>().searchArticles,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.clear,
                    color: Colors.grey.shade800,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade800,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade800,
                  ),
                ),
                // fillColor: Colors.grey.shade300,
                // filled: true,
                hintText: "Moscow",
                hintStyle: TextStyle(color: Colors.grey.shade800),
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
