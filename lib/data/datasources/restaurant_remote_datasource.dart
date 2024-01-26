import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'package:mauzy_food/common/global_variables.dart';
import 'package:mauzy_food/data/models/request/review_restaurant_request_model.dart';
import 'package:mauzy_food/data/models/response/detail_restaurant_response_model.dart';
import 'package:mauzy_food/data/models/response/list_restaurant_response_model.dart';
import 'package:mauzy_food/data/models/response/review_restaurant_response_model.dart';
import 'package:mauzy_food/data/models/response/search_restaurant_response_model.dart';

class RestaurantRemoteDatasource {
  late final Client client;
  RestaurantRemoteDatasource({Client? client}) {
    this.client = client ?? http.Client();
  }
  Future<Either<String, ListRestaurantResponseModel>>
      getListRestaurant() async {
    final response =
        await client.get(Uri.parse('${GlobalVariables.baseUrl}/list'));
    if (response.statusCode == 200) {
      return Right(ListRestaurantResponseModel.fromJson(response.body));
    } else {
      return const Left('Mendapat list restaurant gagal');
    }
  }

  Future<Either<String, DetailRestaurantResponseModel>> getDetailRestaurant(
      String id) async {
    final response =
        await client.get(Uri.parse('${GlobalVariables.baseUrl}/detail/$id'));
    if (response.statusCode == 200) {
      return Right(DetailRestaurantResponseModel.fromJson(response.body));
    } else {
      return const Left('Mendapatkan deskripsi restoran gagal');
    }
  }

  Future<Either<String, SearchRestaurantResponseModel>> searchRestaurant(
      String query) async {
    if (query.isEmpty) {
      return const Left('Pencarian tidak boleh kosong, ulangi pencarian ulang');
    }
    final response = await client
        .get(Uri.parse('${GlobalVariables.baseUrl}/search?q=$query'));
    if (response.statusCode == 200) {
      return Right(SearchRestaurantResponseModel.fromJson(response.body));
    } else {
      return const Left('Mencari restaurant gagal');
    }
  }

  Future<Either<String, ReviewRestaurantResponseModel>> addReview(
      ReviewRestaurantRequestModel model) async {
    final response = await client.post(
      Uri.parse('${GlobalVariables.baseUrl}/review'),
      headers: {'Content-Type': 'application/json'},
      body: model.toJson(),
    );
    if (response.statusCode == 201) {
      return Right(ReviewRestaurantResponseModel.fromJson(response.body));
    } else {
      return const Left('Review gagal');
    }
  }
}
