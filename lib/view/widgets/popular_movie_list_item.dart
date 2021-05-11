import 'package:appgain_task/data/popular_movie_response.dart';
import 'package:appgain_task/network/ServicesURLs.dart';
import 'package:appgain_task/utils/Constants.dart';
import 'package:appgain_task/view/movie_details.dart';
import 'package:flutter/material.dart';

class PopularMoviewListItem extends StatelessWidget {
  Results moviewModel;
  PopularMoviewListItem({this.moviewModel});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: EdgeInsets.all(0),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (ctx) => MovieDetails(
                        movieID: moviewModel.id,
                      )));
        },
        leading: CircleAvatar(
          radius: 50,
          backgroundColor: Colors.grey[200],
          backgroundImage: NetworkImage(
            Constants.IMG_BASE_URL + moviewModel.posterPath,
          ),
        ),
        title: Text(moviewModel.title),
        subtitle: Text(moviewModel.releaseDate),
      ),
    );
  }
}
