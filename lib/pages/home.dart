import 'package:bund_names/models/band.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Band> bands = [
    Band(id: '1', name: 'Legião Urbana', votes: 5),
    Band(id: '2', name: 'Roque Santeiro', votes: 2),
    Band(id: '3', name: 'Los Bocós', votes: 1),
    Band(id: '4', name: 'Caipiras do Sul', votes: 2),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BandNames', style: TextStyle( color: Colors.black87),),
        backgroundColor: Colors.white,
      ),
      body: _buildListView(),
      floatingActionButton: FloatingActionButton(
        child: Icon( Icons.add ),
        onPressed: addNewBand,
      ),
     );
  }

  
  ListView _buildListView() {
    return ListView.builder(
      itemCount: bands.length,
      itemBuilder: (BuildContext context, int index) {
      return Dismissible(
        key: Key(bands[index].id),
        direction: DismissDirection.startToEnd,
        onDismissed: ( direction ) {
          print( 'dire ${bands[index].id}' );
        },
        background: Container(
          padding: EdgeInsets.only(left: 8.0),
          color: Colors.red,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text('Deletar Banda',
            style: TextStyle(color: Colors.white),
           ),
        ),
        ),
        child: ListTile(
          leading: CircleAvatar(
            child: Text(bands[index].name.substring(0,2)),
            backgroundColor: Colors.blue[100],         
            ),
            title: Text( bands[index].name ),
            trailing: Text( bands[index].votes.toString() ),
            onTap: () {
              print(bands[index].name);
            },
        ),
      );
     },
    );
  }

addNewBand() {
    final textControler = TextEditingController();
    showDialog(
      context: context, 
      builder: ( context ){
        return AlertDialog(
          title: Text( 'New Band Name' ),
          content: TextField(
            controller: textControler,
          ),
          actions: [
            MaterialButton(
              child: Text('Add'),
              textColor: Colors.blue,
              elevation: 5,
              onPressed: () => addBandToList(textControler.text),
            )
          ],

        );
      }
      );
  }

  addBandToList(text) {
    if (text.length > 1) {
      this.bands.add( new Band(id: DateTime.now().toString(), name: text, votes: 3  ) );
      setState(() {});
      
    }
    Navigator.pop(context);
  }



}