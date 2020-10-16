import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final String title = 'Circle Avatar';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.deepOrange),
        home: MainPage(title: title),
      );
}

class MainPage extends StatefulWidget {
  final String title;

  const MainPage({
    @required this.title,
  });

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView(
          children: [
            buildMinMaxAvatar(),
            CircleAvatar(
              backgroundColor: Colors.orange,
              radius: 80,
              child: CircleAvatar(
                backgroundColor: Colors.cyan[100],
                backgroundImage: AssetImage('assets/image.jpg'),
                radius: 78,
              ),
            ),
            buildListTile(
              title: 'Johanna',
              image: AssetImage('assets/image.jpg'),
            ),
            buildListTile(
              title: 'Laura',
              image: NetworkImage(
                'https://images.unsplash.com/photo-1601974959109-a1217f73728c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
              ),
            ),
            buildListTile(
              title: 'Emily',
              image: NetworkImage(
                  'https://images.unsplash.com/photo-601974959109-a1217f73728c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80'),
            ),
            buildListTile(title: 'Tom'),
          ],
        ),
      );

  Widget buildListTile({
    @required String title,
    ImageProvider image,
  }) =>
      ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: CircleAvatar(
          backgroundColor: Colors.cyan[100],
          backgroundImage: image,
          foregroundColor: Colors.white,
          radius: 48,
          onBackgroundImageError: image != null
              ? (e, stackTrace) {
                  print('e: ${e}');
                }
              : null,
          child: image == null
              ? Text(
                  title[0].toUpperCase(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                )
              : Container(height: 0, width: 0),
        ),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      );

  Widget buildMinMaxAvatar() {
    final double size = 100;

    return Container(
      width: size,
      height: size,
      child: Center(
        child: CircleAvatar(
          backgroundImage: AssetImage('assets/image.jpg'),
          minRadius: 12,
          maxRadius: 36,
        ),
      ),
    );
  }
}
