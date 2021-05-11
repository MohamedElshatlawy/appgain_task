import 'package:appgain_task/data/popular_movie_response.dart';
import 'package:appgain_task/repos/movies_repo.dart';
import 'package:appgain_task/view/widgets/popular_movie_list_item.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular Movies'),
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: FutureBuilder<PopularMovieResponse>(
          initialData: PopularMovieResponse(results: []),
          future: MoviesRepository.getPopularMovies(),
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
                    child: Text("Error:${snapshot.error.toString()}"),
                  );

                return ListView(
                  children: [
                    ...List.generate(
                        snapshot.data.results.length,
                        (index) => PopularMoviewListItem(
                              moviewModel: snapshot.data.results[index],
                            ))
                  ],
                );
              default:
                return Container();
            }
          },
        ),
      ),
    );
  }
}
