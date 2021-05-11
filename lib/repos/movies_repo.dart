import 'dart:convert';

import 'package:appgain_task/data/movie_details_response.dart';
import 'package:appgain_task/data/popular_movie_response.dart';
import 'package:appgain_task/network/networkCallback/NetworkCallback.dart';
import 'package:appgain_task/utils/Constants.dart';
import 'package:appgain_task/utils/Enums.dart';

class MoviesRepository {
  static Future<PopularMovieResponse> getPopularMovies() async {
    return PopularMovieResponse.fromJson(await NetworkCall.makeCall(
        endPoint: "3/movie/popular",
        method: HttpMethod.GET,
        queryParams: {"api_key": Constants.token}));
  }

  static Future<MovieDetailsResponse> getMovieDetails(String movieId) async {
    return MovieDetailsResponse.fromJson(await NetworkCall.makeCall(
        endPoint: "3/movie/$movieId",
        method: HttpMethod.GET,
        queryParams: {"api_key": Constants.token}));
  }
}
