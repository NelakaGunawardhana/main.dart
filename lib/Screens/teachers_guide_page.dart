import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ict_expert/globles.dart';
import 'package:cached_network_image/cached_network_image.dart';


class teachersGuidePage extends StatefulWidget {
  @override
  _teachersGuidePageState createState() => _teachersGuidePageState();
}

class _teachersGuidePageState extends State<teachersGuidePage> {

  @override

  Widget build(BuildContext context) {
    final Size size=MediaQuery.of(context).size;

    String lang="";

    if(isEnglish==true){
      lang="English";

    }else{
      lang="Sinhala";
    }
    final width = MediaQuery.of(context).size.width;

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
                "Teachers' Guide",
                style: GoogleFonts.mateSc(
                  textStyle: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      letterSpacing: .5,
                      fontWeight: FontWeight.bold),
                ),
              ),
              backgroundColor: Color.fromARGB(100, 98, 80, 61),
              expandedHeight: 100.0,
              flexibleSpace: FlexibleSpaceBar(
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
                    ),
                  ),
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate((context,index){
                  return GetContent(index);
                },
                  childCount: 10,
                )
            )
          ],
        ),
      ),
    );
  }
}


class GetContent extends StatefulWidget {
  final int index;
  const GetContent(this.index);

  @override
  _GetContentState createState() => _GetContentState();
}

class _GetContentState extends State<GetContent> {
  String imageUrl = "";

  @override
  void initState(){
    super.initState();
    FirebaseStorage.instance.ref("TeachersGuide/English/eGr13TG ICT-001.jpg").getDownloadURL().then((value) {
      this.setState(() {
        imageUrl = value;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    print(imageUrl);
    return CachedNetworkImage(
      imageUrl: imageUrl,
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          CircularProgressIndicator(value: downloadProgress.progress),
      errorWidget: (context, url, error) => Icon(Icons.error_outline_rounded),
    );
  }
}


