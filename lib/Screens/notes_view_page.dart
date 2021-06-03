import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:ict_expert/globles.dart';



class NotesView extends StatefulWidget {
  String subject="";
  NotesView(String subject){
    this.subject=subject;
  }

  @override
  _NotesViewState createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {

  var photos={
    "Elemental Concepts of ICT":[
      "assets/Notes/Lesson1/image_1.PNG",
      "assets/Notes/Lesson1/image_2.PNG",
      "assets/Notes/Lesson1/image_3.PNG",
      "assets/Notes/Lesson1/image_4.PNG",
      "assets/Notes/Lesson1/image_5.PNG",
      "assets/Notes/Lesson1/image_6.PNG",
      "assets/Notes/Lesson1/image_7.PNG",
      "assets/Notes/Lesson1/image_8.PNG",
      "assets/Notes/Lesson1/image_9.PNG",
    ]
  };

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final Size size=MediaQuery.of(context).size;
    String lang="";

    if(isEnglish==true){
      lang="English";

    }else{
      lang="Sinhala";
    }

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/b.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text(
                      widget.subject,
                      style: GoogleFonts.mateSc(
                        textStyle: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        letterSpacing: .5,
                            fontSize: size.width*0.06,
                            fontWeight: FontWeight.bold),
                         ),
                       ),
              backgroundColor: Color.fromARGB(100, 98, 80, 61),
              expandedHeight: 100.0,
              flexibleSpace: FlexibleSpaceBar(
                stretchModes: [StretchMode.fadeTitle],
                title: Container(
                  padding: EdgeInsets.all(2.0),
                  color: Color.fromARGB(255, 98, 80, 61),
                  child: Text(lang,
                    style: GoogleFonts.mateSc(
                      textStyle: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          letterSpacing: .5,
                          fontSize: size.width*0.03,
                          fontWeight: FontWeight.normal),
                    ),),
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate((context,index){
                  return Image.asset(photos[widget.subject]![index]);
                },
                  childCount: photos[widget.subject]!.length
              )
            )
          ],
        ),
      ),
    );
  }
}
