// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:camera/camera.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: MyApp(),
  ));
}

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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WorkoutPage()),
                  );

                },
                padding: EdgeInsets.all(10.0),
                child: //Column(
                  _buildButtonColumn(Colors.blueAccent, Icons.fitness_center, 'WORKOUTS'),
                ),
              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FoodPage()),
                  );

                },
                padding: EdgeInsets.all(10.0),
                child: //Column(
                _buildButtonColumn(Colors.black, Icons.fastfood, 'FOOD'),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MusicPage()),
                  );

                },
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProgressPage()),
                  );

                },
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
          title: Text("Workouts"),
        ),
        body: ListView(
          children: [
            CarouselSlider(
              items: [
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage('https://m.economictimes.com/thumb/msid-77342362,width-1200,height-900,resizemode-4,imgsize-419941/gym.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage('https://m.economictimes.com/thumb/msid-77342362,width-1200,height-900,resizemode-4,imgsize-419941/gym.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage('https://m.economictimes.com/thumb/msid-77342362,width-1200,height-900,resizemode-4,imgsize-419941/gym.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],

              options: CarouselOptions(
                height: 180.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
            ),
            ListTile(
              leading: Icon(Icons.fitness_center),
              title: Text('Chest'),
            ),
            ListTile(
              leading: Icon(Icons.fitness_center),
              title: Text('Back'),
            ),
            ListTile(
              leading: Icon(Icons.fitness_center),
              title: Text('Legs'),
            ),
            ListTile(
              leading: Icon(Icons.fitness_center),
              title: Text('Shoulders'),
            ),
            ListTile(
              leading: Icon(Icons.fitness_center),
              title: Text('Arms'),
            ),
            ListTile(
              leading: Icon(Icons.fitness_center),
              title: Text('My Workouts'),
            ),
          ],
        ),
      );
    }
  }

class FoodPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Food"),
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

class ProgressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Progress"),
      ),
      body: Center(
        child: FlatButton(
          onPressed: () {
            //Navigator.pop(context);
            _showOptions(context);
            _showPhotoLibrary();
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}

class MusicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Music"),
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

void _showOptions(BuildContext context) {

  showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
            height: 150,
            child: Column(children: <Widget>[
              ListTile(
                  leading: Icon(Icons.photo_camera),
                  title: Text("Take a picture from camera")
              ),
              ListTile(
                  leading: Icon(Icons.photo_library),
                  title: Text("Choose from photo library")
              )
            ])
        );
      }
  );

}

void _showPhotoLibrary() async {
  final file = await ImagePicker.pickImage(source: ImageSource.gallery);
  print(file.path);
}
