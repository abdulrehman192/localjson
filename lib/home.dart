
import 'dart:convert';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Local Json Parser'),
      ),
      backgroundColor: Colors.grey,
      body: Center(
        child: FutureBuilder(
          future: DefaultAssetBundle.of(context).loadString('assets/film.json'),
          builder: (context, snapshot)
            {
              if(snapshot.hasData)
                {
                  List<dynamic> films = json.decode(snapshot.data.toString());
                  return movieCard(films);
                }
              else
                {
                  return CircularProgressIndicator();
                }
            }
        ),
      ),
    );
  }

  Widget movieCard(List<dynamic> films)
{
  return ListView.builder(
    itemCount: films.length,
      itemBuilder: (context, index)
          {
            return Card(
              child: ListTile(
                tileColor: Colors.white,
                leading: CircleAvatar(
                  backgroundImage: NetworkImage('${films[index]['Images'][0]}'),
                ),
                title: Text('${films[index]['Title']}'),
                subtitle: Text('${films[index]['Plot']}'),
                trailing: Text('${films[index]['Year']}'),
              ),
            );
          }

  );
}


}
