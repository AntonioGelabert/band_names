import 'package:flutter/material.dart';

import '../models/band.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Band>bands = [
     Band(id: '1', name: 'Metalllica', votes: 5),
    Band(id: '2', name: 'Queen', votes: 5),
    Band(id: '3', name: 'BonneyM', votes: 9),
    Band(id: '4', name: 'CCatch', votes: 8),
    Band(id: '5', name: 'Modern talking', votes: 7),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Band names',
          style: TextStyle(
            color: Colors.black87,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: ListView.builder(
          itemCount: bands.length,
          itemBuilder: (BuildContext context, int index) {
            return bandTile(bands[index]);
          },
      ),
        floatingActionButton: FloatingActionButton(
          onPressed: addNewBand,
          child: Icon(Icons.add),
          elevation: 1,

        ),
    );
  }

   Widget bandTile(Band band) {
    return Dismissible(
      key: Key(band.id),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction) {
        print('direction: $direction');
      },
      background: Container(
        padding: EdgeInsets.only(left: 8.0),
        color: Colors.amberAccent,
        child: Align(
          alignment: Alignment.centerLeft,
            child: Text('Delete band', style: TextStyle(color: Colors.white),)
        ),
      ),
      child: ListTile(
              leading: CircleAvatar(
                child: Text(band.name.substring(0,2)),
                backgroundColor: Colors.blue[100],

              ),
             title: Text('band.name'),
             trailing: Text('${band.votes}', style: TextStyle(fontSize: 20),),
             onTap: () => print(band.name),
            ),
    );
  }
  addNewBand() {
    final textController = TextEditingController();

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('New band name:'),
            content: TextField(
             controller: textController,
            ),
            actions: [
              MaterialButton(
                onPressed: () {
                  addBandTolist(textController.text);
                },
                child: Text('Add'),
                elevation: 5,
                textColor: Colors.blue,


              ),

            ],
          );
        },

    );
  }
  void addBandTolist( String name ) {
    if (name.length > 1) {
     this.bands.add(new Band(id: DateTime.now().toString(), name: name, votes: 4));
     setState(() {

     });
    }
    Navigator.pop(context);
  }
}
