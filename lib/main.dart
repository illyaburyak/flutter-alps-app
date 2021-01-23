import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample App',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: Person(),
    );
  }
}

class Favorite extends StatefulWidget {
  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  bool _isFavorited = false;
  int _favoriteCount = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          child: IconButton(
            icon: (_isFavorited
                ? Icon(Icons.favorite)
                : Icon(Icons.favorite_border)),
            onPressed: _toggleFavorite,
            color: Colors.red[500],
          ),
        ),
        SizedBox(
          width: 40,
          child: Container(
            child: Text(
                ('$_favoriteCount'),
            ),
          ),
        ),
      ],
    );
  }

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _isFavorited = false;
        _favoriteCount -= 1;
      } else {
        _isFavorited = true;
        _favoriteCount += 1;
      }
    });
  }
}

class Person extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('The Alps'),
      ),
      body: Container(
        child: _builMainColumn(),
      ),
    );
  }

  Widget _builMainColumn() => ListView(
        children: [
          _buildTopImage(),
          Center(
            child: Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(5),
                    child: _buildRating(),
                  ),
                  Card(
                    elevation: 5,
                    margin: EdgeInsets.all(5),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: _buildAction(),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    child: _buildDescr(),
                  ),
                ],
              ),
            ),
          ),
        ],
      );

  Widget _buildTopImage() => Container(
        child: Card(
          margin: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
          ),
          elevation: 5,
          child: Image.asset(
            'assets/images/mypic.jpg',
            fit: BoxFit.cover,
          ),
        ),
      );

  Widget _buildRating() => ListTile(
        title: Center(
          child: Text(
            'The Alps',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 19,
            ),
          ),
        ),
        subtitle: Center(child: Text(' Only in Europe')),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Favorite(),
          ],
        ),
      );

  Widget _buildAction() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildButton('Beautiful', Icons.panorama, Colors.black),
          _buildButton('Height 1.200 km', Icons.accessibility_new, Colors.black),
          _buildButton(
              'Age 24', Icons.ac_unit, Colors.black),
        ],
      );

  Widget _buildButton(
    String label,
    IconData icon,
    Color color,
  ) =>
      Column(
        children: [
          Icon(
            icon,
            color: Colors.black,
          ),
          Container(
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          )
        ],
      );

  Widget _buildDescr() => Text(
        'The Alps are the highest and most extensive mountain range system that '
        'lies entirely in Europe, and stretch approximately 1,200 km across eight Alpine countries: France, Switzerland, Monaco, Italy, Liechtenstein, Austria, Germany, and Slovenia',
        softWrap: true,
        style: TextStyle(fontSize: 18),
      );
}
