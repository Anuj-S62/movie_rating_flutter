import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';


class MovieRating {
  late String url;

  String? Title;
  String? Year;
  String? Released;
  String? Genre;
  String? Director;
  String? Writer;
  String? Actors;
  String? Poster;
  String? imdbRating;
  String? Type;
  String? totalSeasons = 'N/A';
  String? Duration;
  String? Plot;
  String? Languages;

  MovieRating({required this.url});
  Future<void> getData() async{
    try{
      Response response =  await get(Uri.parse('http://www.omdbapi.com/?t=${url}&apikey=5dc2abe2'));
      Map data = jsonDecode(response.body);

        Title = data['Title'];
        Year = data['Year'];
        Released = data['Released'];
        Genre = data['Genre'];
        Director = data['Director'];
        Writer = data['Writer'];
        Actors = data['Actors'];
        Poster = data['Poster'];
        imdbRating = data['imdbRating'];
        Type = data['Type'];
        Duration = data['Runtime'];
        Plot = data['Plot'];
        Languages = data['Language'];
        if(Type=="series"){
          totalSeasons = data['totalSeasons'];
      }
      // print(Title);
      // print(Year);
      // print(Released);
      // print(Genre);
      // print(Writer);
    }
    catch(e){
      print('caught error: $e');
      Title = 'Enter valid name';
    }


  }

}
