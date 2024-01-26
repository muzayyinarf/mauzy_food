import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mauzy_food/bloc/theme/theme_bloc.dart';
import 'package:mauzy_food/common/extensions.dart';
import 'package:mauzy_food/common/styles.dart';
import 'package:mauzy_food/data/models/response/review_restaurant_response_model.dart';

class DetailReviewList extends StatelessWidget {
  final ReviewRestaurantResponseModel data;
  const DetailReviewList({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = BlocProvider.of<ThemeBloc>(context).state.isDarkmode;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Customer Review',
          style: context.textTheme.headlineSmall
              ?.copyWith(color: isDarkMode ? whiteColor : Colors.black),
        ),
        3.sh,
        ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: data.customerReviews.length,
          itemBuilder: (context, index) {
            final customerReview = data.customerReviews[index];
            return Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                color: isDarkMode ? shadow1DarkModeColor : Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        child: Icon(Icons.person),
                      ),
                      8.sw,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            customerReview.name,
                            style: context.textTheme.bodyMedium?.copyWith(
                                color: isDarkMode ? whiteColor : blackColor),
                          ),
                          Text(
                            customerReview.date,
                            style: context.textTheme.bodySmall?.copyWith(
                                color: isDarkMode ? whiteColor : blackColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                  8.sh,
                  SizedBox(
                    child: Text(
                      customerReview.review,
                      maxLines: 5,
                      style: context.textTheme.bodyLarge?.copyWith(
                          color: isDarkMode ? whiteColor : blackColor),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
