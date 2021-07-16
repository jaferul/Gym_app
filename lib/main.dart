// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

void main() => runApp(MyApp());





class FavoriteWidget extends StatefulWidget{
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}
class _FavoriteWidgetState extends State<FavoriteWidget>{
  bool _isFavorited = true;
  int _favoriteCount = 41;
  @override
  Widget build(BuildContext context){
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            padding: EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (_isFavorited ? Icon(Icons.star) : Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 18,
          child: Container(
            child: Text('$_favoriteCount'),
          ),
        ),
      ],
    );
  }
  void _toggleFavorite(){
    setState(() {
      if(_isFavorited){
        _favoriteCount -= 1;
        _isFavorited = false;
      } else{
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }
}

Column _buildButtonColumn(Color color, IconData icon, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon, color: color),
      Container(
        margin: const EdgeInsets.only(top: 8),
          child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: color,
          ),
        ),
        ),
    ],
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Gym app',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                    ),
                  ),
                ),
                Text(
                  'Ez game Ez life',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 25,
                  ),
                ),
              ],
            ),
          ),
          FavoriteWidget(),
        ],
      ),
    );

    Widget buttonSection = Container(
      child: Column(
        children: [
        Row(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
              FlatButton(
                onPressed: () {},
                padding: EdgeInsets.all(10.0),
                child: //Column(
                  _buildButtonColumn(Colors.blueAccent, Icons.fitness_center, 'WORKOUTS'),
                ),
              FlatButton(
                onPressed: () {},
                padding: EdgeInsets.all(10.0),
                child: //Column(
                _buildButtonColumn(Colors.black, Icons.fastfood, 'FOOD'),
              ),
              FlatButton(
                onPressed: () {},
                padding: EdgeInsets.all(10.0),
                child: //Column(
                _buildButtonColumn(Colors.red, Icons.library_music, 'MUSIC'),
              ),
          ],
        ),
          SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(
              onPressed: () {},
              padding: EdgeInsets.all(10.0),
              child: //Column(
              _buildButtonColumn(Colors.black, Icons.access_time, 'PROGRESS')
            ),

          ],
        ),
      ],
      ),
    );

    return MaterialApp(
      title: 'Gym app demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Gym app demo'),
        ),
        body: ListView(
          children: [
            Image.asset(
              'images/lake.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            //textSection,
          ],
        ),
      ),
    );
  }
}

class WorkoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}
