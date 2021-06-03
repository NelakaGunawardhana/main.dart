import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

class past_paper_view extends StatefulWidget {
  @override
  _past_paper_viewState createState() => _past_paper_viewState();
}


class _past_paper_viewState extends State<past_paper_view> {
  String imageUrl="";
  int index=1;

  @override
  void initState() {
    FirebaseStorage.instance.ref("PastPapers/2020/image_1.PNG").getDownloadURL().then((value){
      setState(() {
        imageUrl=value;
      });
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 9,
          itemBuilder: (context, index){
            return Image.network(imageUrl);
          }
      ),
    );
  }
}
