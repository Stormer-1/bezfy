import 'package:bezfy/domain/repositories/filter/filter_repo.dart';
import 'package:bezfy/features/UI/pages/news_screen/cubit/news_screen_cubit.dart';
import 'package:bezfy/features/UI/pages/news_screen/widgets/filter_rectangle_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterView extends StatelessWidget {
  const FilterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsScreenCubit, NewsScreenState>(
      builder: (context, state) {
        return SizedBox(
          height: 30,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: FilterEnums.values.length,
            itemBuilder: (context, index) => FilterRecButton(
              filterModel: FilterEnums.values[index],
            ),
          ),
        );
      },
    );
  }
}
