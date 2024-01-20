import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mauzy_food/common/extensions.dart';
import 'package:mauzy_food/common/global_variables.dart';
import 'package:mauzy_food/data/models/response/search_restaurant_response_model.dart';

import 'package:mauzy_food/routes/names_route.dart';

import '../widgets/neumorphic_button.dart';

class SearchRestaurantList extends StatelessWidget {
  final SearchRestaurantResponseModel items;
  const SearchRestaurantList({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: items.restaurants.length,
        itemBuilder: (context, index) {
          final item = items.restaurants[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: NeumorphicButton(
              onTap: () {},
              child: Material(
                color: Colors.grey.shade100,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: GestureDetector(
                  onTap: () {
                    context.goNamed(Routes.detail,
                        pathParameters: {'id': item.id});
                  },
                  child: Row(
                    children: [
                      Hero(
                        tag: item.pictureId,
                        child: Container(
                          width: 120,
                          height: 90,
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(GlobalVariables.image
                                    .small(item.pictureId)),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          color: Colors.transparent,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.name,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(Icons.location_on),
                                  2.sw,
                                  Text(item.city),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(Icons.star),
                                  2.sw,
                                  Text('${item.rating}'),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
