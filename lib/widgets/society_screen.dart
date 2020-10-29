import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:orientation_app/classes/society.dart';
import 'package:transparent_image/transparent_image.dart';

class SocietyDetail extends StatelessWidget {
  Society society;

  SocietyDetail(this.society);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(society.societyName),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Stack(
                  children: [
                    Container(
                        height: 200,
                        child: Center(
                            child: SpinKitCircle(
                          color: Colors.blue,
                          size: 60,
                        ))),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Center(
                          child: FadeInImage.memoryNetwork(
                            placeholder: kTransparentImage,
                            image: society.imageUrl,
                          ),
                        ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Text(
                    society.societyName,
                    style: TextStyle(fontSize: 25, color: Colors.blue),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.blue, width: 2)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      society.description,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if (society.president.id !=
                      "81979dbf-c573-48ed-b178-b25a216456b3")
                    Text(
                      "President",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    ),
                  if (society.vicePresident.id !=
                      "1b6d6efc-436f-4b98-86b0-daca7eec29c8")
                    Text(
                      "Vice President",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    if (society.president.id !=
                        "81979dbf-c573-48ed-b178-b25a216456b3")
                      Center(
                        child: CircleAvatar(
                          child: CircleAvatar(
                            maxRadius: 50,
                            backgroundImage:
                                NetworkImage(society.president.imageUrl),
                          ),
                          maxRadius: 53,
                          backgroundColor: Colors.blue,
                        ),
                      ),
                    if (society.vicePresident.id !=
                        "1b6d6efc-436f-4b98-86b0-daca7eec29c8")
                      Center(
                        child: CircleAvatar(
                          child: CircleAvatar(
                            maxRadius: 50,
                            backgroundImage:
                                NetworkImage(society.vicePresident.imageUrl),
                          ),
                          maxRadius: 53,
                          backgroundColor: Colors.blue,
                        ),
                      ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    if (society.president.id !=
                        "81979dbf-c573-48ed-b178-b25a216456b3")
                      Container(
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                                child: Text(
                              society.president.name,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300),
                            )),
                          )),
                    if (society.vicePresident.id !=
                        "1b6d6efc-436f-4b98-86b0-daca7eec29c8")
                      Container(
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                                child: Text(
                              society.vicePresident.name,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300),
                            )),
                          )),
                  ],
                ),
              ),
              SizedBox(
                height: 55,
              )
            ],
          ),
        ),
      ),
    );
  }
}
