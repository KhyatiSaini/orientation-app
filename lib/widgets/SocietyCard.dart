import 'package:flutter/material.dart';
import 'package:orientation_app/classes/society.dart';
import 'package:orientation_app/widgets/society_screen.dart';

class SocietyCard extends StatelessWidget {
  Society society;

  SocietyCard(this.society);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30)
        ),
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: CircleAvatar(
                    maxRadius: 50,
                    child: ClipRRect(
                      borderRadius: new BorderRadius.circular(1500.0),
                      child:Image.network(society.imageUrl),
                    ),
                  ),
                  title: Text(society.societyName),
                  trailing: IconButton(icon:Icon(Icons.info, color: Colors.black,), onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => SocietyDetail(society)));
                  },),
                ),
              ),
            ),
        ),
        ),
    );
  }
}
