import 'package:appgain_task/data/movie_details_response.dart';
import 'package:appgain_task/providers/movie_details_title.dart';
import 'package:appgain_task/repos/movies_repo.dart';
import 'package:appgain_task/view/widgets/movie_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MovieDetails extends StatelessWidget {
  String movieID;

  MovieDetails({this.movieID});
  @override
  Widget build(BuildContext context) {
    print("MovieID-------:$movieID");
    return Container(
      color: Colors.grey[200],
      child: FutureBuilder<MovieDetailsResponse>(
        future: MoviesRepository.getMovieDetails(movieID),
        builder: (ctx, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Center(
                child: Center(
                  child: Text('No internet connection'),
                ),
              );
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.active:
            case ConnectionState.done:
              if (snapshot.hasError)
                return Center(
                  child: Text(
                    "Error:${snapshot.error.toString()}",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        decoration: TextDecoration.none),
                  ),
                );
              return MovieDetailsWidget(
                movieDetails: snapshot.data,
              );
            default:
              return Container();
          }
        },
      ),
    );
  }
}
