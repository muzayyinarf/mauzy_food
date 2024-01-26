import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import 'package:mauzy_food/common/global_variables.dart';
import 'package:mauzy_food/data/datasources/restaurant_remote_datasource.dart';
import 'package:mauzy_food/data/models/request/review_restaurant_request_model.dart';
import 'package:mauzy_food/data/models/response/detail_restaurant_response_model.dart';
import 'package:mauzy_food/data/models/response/list_restaurant_response_model.dart';
import 'package:mauzy_food/data/models/response/review_restaurant_response_model.dart';
import 'package:mauzy_food/data/models/response/search_restaurant_response_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'restaurante_remote_datasource_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late MockClient mockClient;
  late RestaurantRemoteDatasource datasource;

  setUp(() {
    mockClient = MockClient();
    datasource = RestaurantRemoteDatasource(client: mockClient);
  });

  group('getListRestaurant', () {
    test(
        'should return ListRestaurantResponseModel when the call is successful',
        () async {
      when(mockClient.get(Uri.parse('${GlobalVariables.baseUrl}/list')))
          .thenAnswer((_) async => http.Response(
              '{"error":false,"message":"success","count":20,"restaurants":[]}',
              200));

      final result = await datasource.getListRestaurant();

      expect(
          result,
          isA<Right<dynamic, ListRestaurantResponseModel>>().having(
              (r) => r.value, 'value', isA<ListRestaurantResponseModel>()));
    });

    test('should return Left when the call is unsuccessful', () async {
      when(mockClient.get(Uri.parse('${GlobalVariables.baseUrl}/list')))
          .thenAnswer((_) async => http.Response('Error', 404));

      final result = await datasource.getListRestaurant();

      expect(result, const Left('Mendapat list restaurant gagal'));
    });
  });

  group('getDetailRestaurant', () {
    test(
        'should return DetailRestaurantResponseModel when the call is successful',
        () async {
      when(mockClient.get(Uri.parse(
              '${GlobalVariables.baseUrl}/detail/dwg2wt3is19kfw1e867')))
          .thenAnswer((_) async => http.Response(
              '{"error":false,"message":"success","restaurant":'
              '{"id":"dwg2wt3is19kfw1e867","name":"Test Restaurant",'
              '"description":"Test Description","city":"Test City",'
              '"address":"Test Address","pictureId":"Test Picture",'
              '"categories":[],"menus":{"foods":[],"drinks":[]},'
              '"rating":4.2,"customerReviews":[]}}',
              200));

      final result =
          await datasource.getDetailRestaurant('dwg2wt3is19kfw1e867');

      expect(
          result,
          isA<Right<dynamic, DetailRestaurantResponseModel>>().having(
              (r) => r.value, 'value', isA<DetailRestaurantResponseModel>()));
    });

    test('should return Left when the call is unsuccessful', () async {
      when(mockClient.get(Uri.parse('${GlobalVariables.baseUrl}/detail/id')))
          .thenAnswer((_) async => http.Response('Error', 404));

      final result = await datasource.getDetailRestaurant('id');

      expect(result, const Left('Mendapatkan deskripsi restoran gagal'));
    });
  });

  group('searchRestaurant', () {
    test(
        'should return SearchRestaurantResponseModel when the call is successful',
        () async {
      when(mockClient
              .get(Uri.parse('${GlobalVariables.baseUrl}/search?q=query')))
          .thenAnswer((_) async => http.Response(
              '{"error":false,"founded":0,"restaurants":[]}', 200));

      final result = await datasource.searchRestaurant('query');

      expect(
          result,
          isA<Right<dynamic, SearchRestaurantResponseModel>>().having(
              (r) => r.value, 'value', isA<SearchRestaurantResponseModel>()));
    });

    test('should return Left when the call is unsuccessful', () async {
      when(mockClient
              .get(Uri.parse('${GlobalVariables.baseUrl}/search?q=query')))
          .thenAnswer((_) async => http.Response('Error', 404));

      final result = await datasource.searchRestaurant('query');

      expect(result, const Left('Mencari restaurant gagal'));
    });
  });

  group('addReview', () {
    test(
        'should return ReviewRestaurantResponseModel when the call is successful',
        () async {
      when(mockClient.post(
        Uri.parse('${GlobalVariables.baseUrl}/review'),
        headers: {'Content-Type': 'application/json'},
        body: anyNamed('body'),
      )).thenAnswer((_) async => http.Response(
          '{"error":false,"message":"success","customerReviews":[]}', 201));

      final result = await datasource.addReview(
          ReviewRestaurantRequestModel(id: '', name: '', review: ''));

      expect(
          result,
          isA<Right<dynamic, ReviewRestaurantResponseModel>>().having(
              (r) => r.value, 'value', isA<ReviewRestaurantResponseModel>()));
    });

    test('should return Left when the call is unsuccessful', () async {
      when(mockClient.post(
        Uri.parse('${GlobalVariables.baseUrl}/review'),
        headers: {'Content-Type': 'application/json'},
        body: anyNamed('body'),
      )).thenAnswer((_) async => http.Response('Error', 500));

      final result = await datasource.addReview(
          ReviewRestaurantRequestModel(id: '', name: '', review: ''));

      expect(result, const Left('Review gagal'));
    });
  });
}
