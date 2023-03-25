import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:movie_rating_flutter/main.dart';
import 'package:movie_rating_flutter/services/movie_rating.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';


class Home extends StatefulWidget {
  // future: Firebase.initializeApp();
  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home> {

  final databaseReference = FirebaseDatabase.instance.reference().child("Movies");
  Map data = {};
  String username = "";
  late String movie;
  Future<List<dynamic>>? values;
  int count = 0;
  void createRecord(MovieRating instance)async{

    await databaseReference.child(count.toString()).set({
      'Title' : instance.Title,
      'Released' : instance.Released,
      'imdbRating' : instance.imdbRating,
    });
    count++;
  }

  Future<void> getData()async{
    DatabaseReference ref = FirebaseDatabase.instance.ref("Movies");
    Stream<DatabaseEvent>? stream = ref.onValue;


    stream.listen((DatabaseEvent event) {
      print('Event Type: ${event.type}'); // DatabaseEventType.value;
      var t = (event.snapshot.value as dynamic);
      // print(jsonDecode(event.snapshot.value.toString()));
    });
  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)?.settings.arguments as Map;
    username = data['name'];
    print(values);


    return Scaffold(

        appBar: AppBar(
          title: Text('Movie Rating',style: TextStyle(fontWeight: FontWeight.w500)),
          centerTitle: true,
          backgroundColor: Colors.grey[900],
        ),
        body: ListView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20,20,0,10),
                  child: Row(
                    children: const [
                      Icon(Icons.search,size: 50,color: Colors.grey,),
                      Text("  Enter Movie/Show",style: TextStyle(
                        color: Colors.grey,
                          fontFamily: 'sans',
                          fontSize: 25,
                          fontWeight: FontWeight.w300,
                          letterSpacing: 1
                      ),
                      )
                    ],
                  )
                ),

            Padding(
              padding: EdgeInsets.fromLTRB(20.0,20.0,20.0,0),
              child: TextField(
                style: TextStyle(color: Colors.grey,fontSize: 20,fontWeight: FontWeight.w300,letterSpacing: 1),
                decoration: InputDecoration(

                  prefixIcon: Icon(Icons.search,color:Colors.grey,),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.5),
                  ),
                ),
                onChanged: (text){
                  setState(() {
                    movie = text;
                  });
                },
              ),
            ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0,10,20,0),
                      child: ElevatedButton(
                        // clipBehavior: Clip(),
                        onPressed: () async {
                          MovieRating instance = MovieRating(url: '$movie');
                          await instance.getData();
                          createRecord(instance);
                          getData();
                          // ignore: use_build_context_synchronously
                          Navigator.pushNamed(context, '/detail',arguments: {
                          'Title' : instance.Title,
                          'Year' : instance.Year,
                          'Released' : instance.Released,
                          'Genre' : instance.Genre,
                          'Director' : instance.Director,
                          'Writer' : instance.Writer,
                          'Actors' : instance.Actors,
                          'Poster' : instance.Poster,
                          'imdbRating' : instance.imdbRating,
                          'Type' : instance.Type,
                            'totalSeasons' : instance.totalSeasons,
                            'Duration' : instance.Duration,
                            'Plot' : instance.Plot,
                            'Languages' : instance.Languages
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.orange[700], // Background color
                        ),
                        child: const Text(
                          'GO',
                          style: TextStyle(fontSize: 15,letterSpacing: 2),
                        ),

                          // enableFeedback: true,
                          // focusColor: Colors.purple,
                      ),
                    ),
                  ],
                )
            ]
            ),

          ],
        )
    );
  }
}
