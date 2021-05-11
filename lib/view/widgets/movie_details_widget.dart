import 'package:appgain_task/data/movie_details_response.dart';
import 'package:appgain_task/providers/movie_details_title.dart';
import 'package:appgain_task/utils/Constants.dart';
import 'package:appgain_task/view/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class MovieDetailsWidget extends StatelessWidget {
  MovieDetailsResponse movieDetails;
  MovieDetailsWidget({this.movieDetails});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(movieDetails.title),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Get.offAll(Home());
              }),
        ),
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 3 + 20,
              width: MediaQuery.of(context).size.width,
              color: Colors.grey[200],
              child: Image.network(
                Constants.IMG_BASE_URL + movieDetails.posterPath,
                cacheHeight: 200,
                width: 200,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              trailing: CircularPercentIndicator(
                radius: 45.0,
                lineWidth: 5.0,
                percent: 1.0,
                center: new Text(movieDetails.voteAverage.toString()),
                progressColor: Colors.green,
              ),
              title: Text(
                "${movieDetails.title}  (${movieDetails.releaseDate.split('-')[0]})",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                  "${movieDetails.releaseDate} . ${movieDetails.genres.map((e) => e.name)} "),
            ),
            ListTile(
              title: Text(
                "Overview",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("${movieDetails.overview}"),
            ),
            ListTile(
              title: Text(
                "Status",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("${movieDetails.status}"),
            )
          ],
        ));
  }
}
