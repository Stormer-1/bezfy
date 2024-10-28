import 'package:bezfy/assets/app_sizes.dart';
import 'package:bezfy/domain/repositories/filter/filter_repo.dart';
import 'package:bezfy/features/UI/pages/news_screen/cubit/news_screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterRecButton extends StatelessWidget {
  const FilterRecButton({
    super.key,
    required this.filterModel,
  });

  final FilterEnums filterModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.read<NewsScreenCubit>().toggleFilter(filterModel),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        margin: const EdgeInsets.only(left: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.black54,
        ),
        child: BlocBuilder<NewsScreenCubit, NewsScreenState>(
          builder: (context, state) {
            final isSelected =
                state is NewsScreenSuccess && state.filter == filterModel;
            return Row(
              children: [
                if (isSelected) ...[
                  const Icon(
                    Icons.check,
                    size: 15,
                    color: Colors.black54,
                  ),
                  gapW6,
                ],
                Text(
                  filterModel.categoryText,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
