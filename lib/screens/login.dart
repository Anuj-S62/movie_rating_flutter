import 'package:flutter/material.dart';
import 'package:movie_rating_flutter/main.dart';

class Login extends StatefulWidget {

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController nameController = TextEditingController();
  late String name;
  late String pass;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login',style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: Container(
        color: Colors.cyan,

        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0,15.0,15.0,0),
              child: Text("Hello!",style: TextStyle(
                fontSize: 35,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 2,
                fontFamily: 'Sans'
              ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text("Movie",style: TextStyle(
                      fontSize: 30,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      letterSpacing: 3,
                      fontFamily: 'Sans'
                  ),
                  ),
                  Text(" Ratings",style: TextStyle(
                      fontSize: 30,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                      letterSpacing: 3,
                      fontFamily: 'Sans'
                  ),
                  ),
                ],
              ),

            ),
            SizedBox(height: 25,),
            Material(
              elevation: 10,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0),topRight: Radius.circular(30)),
              child: Container(
                height: MediaQuery.of(context).size.height - 220,

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0),topRight: Radius.circular(30)),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.cyan, //New
                        blurRadius: 75.0,
                        offset: Offset(0,-1))
                  ],
                  ),
                child: Column(
                  children: [
                    SizedBox(height: 70,),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20.0,20.0,20.0,0),
                      child: TextField(
                        // controller: nameController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person,color:Colors.grey,),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.cyan, width: 1.5),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey, width: 1.5),
                          ),
                          hintText: 'Name',

                        ),
                          onChanged: (text){
                          setState(() {
                            name = text;
                          });
                          },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20.0,20.0,20.0,0),
                      child: TextField(
                        // controller: nameController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock,color:Colors.grey,),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.cyan, width: 1.5),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey, width: 1.5),
                          ),
                          hintText: 'Password',
                        ),
                        onChanged: (text){
                          setState(() {
                            pass = text;
                          });
                        },
                      ),
                    ),
                    IconButton(
                        color: Colors.grey,
                        onPressed: () {
                          Map temp = {'name' : name,'pass' : pass};
                          // Navigator.popAndPushNamed(context, routeName)
                          Navigator.popAndPushNamed(context, '/home',arguments: {
                            'name':name,
                            'pass':pass
                          });
                        },
                        enableFeedback: true,
                        icon: Icon(Icons.login)
                    ),
                  ],
                ),


              ),
            ),

          ],
        )

      )
    );
  }
}


// IconButton(onPressed: (){}, )