import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movie_rating_flutter/main.dart';
import 'package:avatars/avatars.dart';


class Detail extends StatefulWidget {

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)?.settings.arguments as Map;
    String imgUrl = "";
    // if(data['Title'].length>=20){
    //   data['Title'] = data['Title'].substring(0,17);
    //   data['Title'] = data['Title'] + "...";
    // }
    print(data['Title']);
    imgUrl = data['Poster'].toString();
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: ListView(
        children: [
          SizedBox(
            height: 250,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(imgUrl, fit: BoxFit.cover),
                ClipRRect( // Clip it cleanly.
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      color: Colors.grey.withOpacity(0.1),
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0,30,0,0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 80.0,
                                    backgroundImage: NetworkImage(imgUrl),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Material(
              elevation: 10,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0),topRight: Radius.circular(20)),
              child: Container(
                height: MediaQuery.of(context).size.height + 100,

                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0),topRight: Radius.circular(20)),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black, //New
                        blurRadius: 75.0,
                        offset: Offset(0,-1))
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30.0, 25.0, 30.0,0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data['Title'],style: TextStyle(
                          color: Colors.orangeAccent,
                          letterSpacing: 3.0,
                          fontSize: 30.0,
                          fontWeight: FontWeight.w400)
                      ),
                      const Divider(
                        height: 60.0,
                        color: Colors.grey,
                      ),
                      Row(
                        children: [
                          Image.network("https://img.icons8.com/color/256/imdb.png",scale: 5,),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(15.0,0,0,0),
                        child: Text(data['imdbRating'],style: TextStyle(
                            color: Colors.orangeAccent,
                            letterSpacing: 1.0,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w300)
                        ),
                      ),
                      SizedBox(height: 15,),
                      Text(
                        'Duration',
                        style: TextStyle(
                            color: Colors.grey,
                            letterSpacing: 2.0,
                            fontSize: 18.0
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text(data['Duration'],style: TextStyle(
                          color: Colors.orangeAccent,
                          letterSpacing: 2.0,
                          fontSize: 25.0,
                          fontWeight: FontWeight.w300)
                      ),
                      SizedBox(height: 15,),
                      Text(
                        'Type',
                        style: TextStyle(
                            color: Colors.grey,
                            letterSpacing: 2.0,
                            fontSize: 18.0
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text(data['Type'],style: TextStyle(
                          color: Colors.orangeAccent,
                          letterSpacing: 2.0,
                          fontSize: 25.0,
                          fontWeight: FontWeight.w300)
                      ),
                      SizedBox(height: 15,),
                      Text(
                        'Released in',
                        style: TextStyle(
                            color: Colors.grey,
                            letterSpacing: 2.0,
                            fontSize: 18.0
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text(data['Released'],style: TextStyle(
                          color: Colors.orangeAccent,
                          letterSpacing: 2.0,
                          fontSize: 25.0,
                          fontWeight: FontWeight.w300)
                      ),
                      SizedBox(height: 15,),
                      Text(
                        'Total Seasons',
                        style: TextStyle(
                            color: Colors.grey,
                            letterSpacing: 2.0,
                            fontSize: 18.0
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text(data['totalSeasons'],style: TextStyle(
                          color: Colors.orangeAccent,
                          letterSpacing: 2.0,
                          fontSize: 25.0,
                          fontWeight: FontWeight.w300)
                      ),
                      
                      SizedBox(height: 40,),
                      Text(
                        'More details',
                        style: TextStyle(
                            color: Colors.grey,
                            letterSpacing: 2.0,
                            fontSize: 18.0
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text(
                        'Genre : ',
                        style: TextStyle(
                            color: Colors.grey,
                            letterSpacing: 1.0,
                            fontSize: 16.0
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text(data['Genre'],style: TextStyle(
                          color: Colors.orangeAccent,
                          letterSpacing: 1.0,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w300)
                      ),
                      SizedBox(height: 10,),
                      Text(
                        'Director : ',
                        style: TextStyle(
                            color: Colors.grey,
                            letterSpacing: 1.0,
                            fontSize: 16.0
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text(data['Director'],style: TextStyle(
                          color: Colors.orangeAccent,
                          letterSpacing: 1.0,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w300)
                      ),
                      SizedBox(height: 10,),
                      Text(
                        'Writer : ',
                        style: TextStyle(
                            color: Colors.grey,
                            letterSpacing: 1.0,
                            fontSize: 16.0
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text(data['Writer'],style: TextStyle(
                          color: Colors.orangeAccent,
                          letterSpacing: 1.0,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w300)
                      ),
                      SizedBox(height: 10,),
                      Text(
                        'Actors : ',
                        style: TextStyle(
                            color: Colors.grey,
                            letterSpacing: 1.0,
                            fontSize: 16.0
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text(data['Actors'],style: TextStyle(
                          color: Colors.orangeAccent,
                          letterSpacing: 1.0,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w300)
                      ),
                      SizedBox(height: 10,),
                      Text(
                        'Languages : ',
                        style: TextStyle(
                            color: Colors.grey,
                            letterSpacing: 1.0,
                            fontSize: 16.0
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text(data['Languages'],style: TextStyle(
                          color: Colors.orangeAccent,
                          letterSpacing: 1.0,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w300)
                      ),
                      SizedBox(height: 10,),
                      Text(
                        'Plot : ',
                        style: TextStyle(
                            color: Colors.grey,
                            letterSpacing: 1.0,
                            fontSize: 16.0
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text(data['Plot'],style: TextStyle(
                          color: Colors.orangeAccent,
                          letterSpacing: 1.0,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w300)
                      ),

                    ],

                  ),
                ),
              )
          )
        ],

      ),
    );
  }
}
