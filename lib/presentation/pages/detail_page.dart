import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:like_button/like_button.dart';
import 'package:mauzy_food/bloc/add_review/add_review_bloc.dart';
import 'package:mauzy_food/bloc/list_favorite/list_favorite_bloc.dart';
import 'package:mauzy_food/bloc/theme/theme_bloc.dart';
import 'package:mauzy_food/common/extensions.dart';
import 'package:mauzy_food/common/global_variables.dart';
import 'package:mauzy_food/common/styles.dart';
import 'package:mauzy_food/data/models/request/review_restaurant_request_model.dart';
import 'package:mauzy_food/data/models/response/detail_restaurant_response_model.dart';
import 'package:mauzy_food/data/models/restaurant.dart';
import 'package:mauzy_food/presentation/pages/detail_review_list.dart';
import 'package:mauzy_food/presentation/widgets/drink_menu.dart';
import 'package:mauzy_food/presentation/widgets/food_menu.dart';
import 'package:mauzy_food/presentation/widgets/neumorphic_button.dart';
import 'package:mauzy_food/presentation/widgets/textfield_widget.dart';

import '../../bloc/detail_restaurant/detail_restaurant_bloc.dart';
import '../widgets/platform_widget.dart';

class DetailPage extends StatefulWidget {
  final String id;
  const DetailPage({super.key, required this.id});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  TextEditingController nameC = TextEditingController();
  TextEditingController reviewC = TextEditingController();
  @override
  void initState() {
    context
        .read<DetailRestaurantBloc>()
        .add(DetailRestaurantEvent.get(widget.id));
    context.read<AddReviewBloc>().add(const AddReviewEvent.started());
    context.read<ListFavoriteBloc>().add(const ListFavoriteEvent.get());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Restaurant'),
      ),
      body: BlocBuilder<DetailRestaurantBloc, DetailRestaurantState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => _buildLoading(),
            loaded: (data) => _buildContent(data),
            error: (message) => _buildError(message),
            orElse: () => _buildLoading(),
          );
        },
      ),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Detail Restaurant'),
      ),
      child: BlocBuilder<DetailRestaurantBloc, DetailRestaurantState>(
        builder: (context, state) => state.maybeWhen(
          loading: () => _buildLoading(),
          loaded: (data) => _buildContent(data),
          error: (message) => _buildError(message),
          orElse: () => _buildLoading(),
        ),
      ),
    );
  }

  Widget _buildContent(DetailRestaurantResponseModel restaurant) {
    final isDarkMode = BlocProvider.of<ThemeBloc>(context).state.isDarkmode;
    return ListView(
      children: [
        Hero(
          tag: restaurant.restaurant.pictureId,
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  GlobalVariables.image.large(restaurant.restaurant.pictureId),
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      restaurant.restaurant.name,
                      style: context.textTheme.headlineSmall?.copyWith(
                          color: isDarkMode ? whiteColor : blackColor),
                    ),
                  ),
                  BlocBuilder<ListFavoriteBloc, ListFavoriteState>(
                    builder: (context, state) {
                      final isFavorite = state.maybeWhen(
                        loaded: (data) => data.any((element) =>
                            element.id == restaurant.restaurant.id),
                        orElse: () => false,
                      );
                      Restaurant model = Restaurant(
                        id: restaurant.restaurant.id,
                        name: restaurant.restaurant.name,
                        description: restaurant.restaurant.description,
                        city: restaurant.restaurant.city,
                        pictureId: restaurant.restaurant.pictureId,
                        rating: restaurant.restaurant.rating.toDouble(),
                      );
                      return LikeButton(
                        isLiked: isFavorite,
                        onTap: (isLiked) async {
                          if (isFavorite) {
                            context
                                .read<ListFavoriteBloc>()
                                .add(ListFavoriteEvent.remove(model.id));
                          } else {
                            context
                                .read<ListFavoriteBloc>()
                                .add(ListFavoriteEvent.add(model));
                          }
                          return !isFavorite;
                        },
                      );
                    },
                  )
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.location_on),
                  const SizedBox(
                    width: 4.0,
                  ),
                  Text(
                    restaurant.restaurant.city,
                    style: context.textTheme.bodyLarge
                        ?.copyWith(color: isDarkMode ? whiteColor : blackColor),
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.star),
                  const SizedBox(
                    width: 4.0,
                  ),
                  Text(
                    restaurant.restaurant.rating.toString(),
                    style: context.textTheme.bodyLarge
                        ?.copyWith(color: isDarkMode ? whiteColor : blackColor),
                  ),
                ],
              ),
              const Divider(),
              Text(
                restaurant.restaurant.description,
                style: context.textTheme.bodyMedium
                    ?.copyWith(color: isDarkMode ? whiteColor : blackColor),
              ),
              const Divider(),
              Text(
                'Menu makanan',
                style: context.textTheme.headlineSmall
                    ?.copyWith(color: isDarkMode ? whiteColor : blackColor),
              ),
              FoodMenu(
                items: restaurant.restaurant.menus,
              ),
              // const Divider(),
              Text(
                'Menu minuman',
                style: context.textTheme.headlineSmall
                    ?.copyWith(color: isDarkMode ? whiteColor : blackColor),
              ),
              DrinkMenu(
                items: restaurant.restaurant.menus,
              ),
              const Divider(),
              Text(
                'Review Restaurant',
                style: context.textTheme.headlineSmall
                    ?.copyWith(color: isDarkMode ? whiteColor : blackColor),
              ),
              Text(
                'Nama',
                style: context.textTheme.bodySmall
                    ?.copyWith(color: isDarkMode ? whiteColor : blackColor),
              ),
              TextFieldWidget(
                controller: nameC,
                hint: 'Isi nama',
              ),
              6.sh,
              Text(
                'Review',
                style: context.textTheme.bodySmall
                    ?.copyWith(color: isDarkMode ? whiteColor : blackColor),
              ),
              TextFieldWidget(
                controller: reviewC,
                hint: 'Isi review',
                maxLines: 3,
              ),
              10.sh,
              NeumorphicButton(
                onTap: () {
                  final data = ReviewRestaurantRequestModel(
                    id: restaurant.restaurant.id,
                    name: nameC.text,
                    review: reviewC.text,
                  );
                  if (nameC.text.isNotEmpty && reviewC.text.isNotEmpty) {
                    context
                        .read<AddReviewBloc>()
                        .add(AddReviewEvent.post(data));
                    nameC.clear();
                    reviewC.clear();
                  }
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    'Add Review',
                    style: context.textTheme.labelLarge
                        ?.copyWith(color: isDarkMode ? whiteColor : blackColor),
                  ),
                ),
              ),
              6.sh,
              BlocBuilder<AddReviewBloc, AddReviewState>(
                builder: (context, state) => state.maybeWhen(
                  loading: () => _buildLoading(),
                  loaded: (data) {
                    return DetailReviewList(data: data);
                  },
                  error: (message) => _buildError(message),
                  orElse: () => const SizedBox(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLoading() {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Center(
          child: CircularProgressIndicator(
            color: state.isDarkmode ? blueColor : purpleColor,
          ),
        );
      },
    );
  }

  Widget _buildError(String errorMessage) {
    return Center(
      child: Text(
        errorMessage,
        style: const TextStyle(color: Colors.red),
      ),
    );
  }
}
