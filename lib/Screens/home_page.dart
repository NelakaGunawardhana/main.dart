import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ict_expert/Screens/model_papers_page.dart';
import 'package:ict_expert/Screens/notes_page.dart';
import 'package:ict_expert/Screens/past_papers_page.dart';
import 'package:ict_expert/Screens/teachers_guide_page.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:ict_expert/globles.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth < 760) {
            if (MediaQuery.of(context).size.aspectRatio > 0.51) {
              return _buildSmallPhoneContainer();
            } else {
              return _buildNormalContainer();
            }
          } else {
            return _buildWideContainers();
          }
        },
      ),
    );
  }

  Widget _buildWideContainers() {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    print("Wide Layout Loaded \n" +
        MediaQuery.of(context).size.width.toString() +
        "\n" +
        MediaQuery.of(context).size.height.toString() +
        "\n" +
        MediaQuery.of(context).size.aspectRatio.toString());
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/b.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 15.0),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: CircleAvatar(
                              backgroundImage: AssetImage(
                            "images/p.png",
                          )),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(width * 0.592, 0, 0, 10),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: ToggleSwitch(
                              minWidth: width * 0.1562,
                              minHeight: height * 0.0488,
                              fontSize: height * 0.022,
                              cornerRadius: 10.0,
                              activeBgColor: Color.fromARGB(255, 98, 80, 61),
                              activeFgColor: Colors.white,
                              inactiveBgColor: Colors.grey,
                              inactiveFgColor: Colors.white,
                              labels: ['English', 'Sinhala'],
                              onToggle: (index) {
                                if (index == 0) {
                                  isEnglish = true;
                                  Fluttertoast.showToast(
                                      msg: "Switched to English",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.grey[800],
                                      textColor: Colors.white,
                                      fontSize: 12.0);
                                } else {
                                  isEnglish = false;
                                  Fluttertoast.showToast(
                                      msg: "Switched to Sinhala",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.grey[800],
                                      textColor: Colors.white,
                                      fontSize: 12.0);
                                }
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 6.0),
                      child: Text(
                        "Hi !",
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              color: Colors.white,
                              letterSpacing: .5,
                              fontSize: width * 0.08,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 6.0),
                      child: Text(
                        "Welcome to",
                        style: GoogleFonts.robotoSlab(
                          textStyle: TextStyle(
                              color: Color.fromARGB(255, 98, 80, 61),
                              letterSpacing: .5,
                              fontSize: width * 0.045,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        "ICT\nEXPERT",
                        style: GoogleFonts.robotoMono(
                          textStyle: TextStyle(
                              color: Colors.black,
                              letterSpacing: .5,
                              fontSize: width * 0.1,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Text(
                      "Join With Us to Sharpen Your Al IT Knowledge",
                      style: GoogleFonts.koHo(
                        textStyle: TextStyle(
                            color: Color.fromARGB(255, 98, 80, 61),
                            letterSpacing: .5,
                            fontSize: width * 0.045,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.15,
              ),
              Container(
                child: Expanded(
                  child: GridView.count(
                    primary: false,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.all(5.0),
                    crossAxisCount: 4,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 8.0,
                    children: [
                      Card(
                        color: Color.fromARGB(255, 98, 80, 61),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Material(
                          color: Color.fromARGB(255, 98, 80, 61),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(21)),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => notesPage()),
                              );
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "images/acard.png",
                                  width: width * 0.13,
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                                  child: Text(
                                    "Notes",
                                    style: GoogleFonts.raleway(
                                      textStyle: TextStyle(
                                          color: Colors.white,
                                          letterSpacing: .5,
                                          fontSize: width * 0.03,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        color: Color.fromARGB(255, 98, 80, 61),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(21)),
                        child: Material(
                          color: Color.fromARGB(255, 98, 80, 61),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(21)),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => pastPapersPage()),
                              );
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "images/bcard.png",
                                  width: width * 0.1,
                                ),
                                Text(
                                  "GCE A/L\n Past Papers",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.raleway(
                                    textStyle: TextStyle(
                                        color: Colors.white,
                                        letterSpacing: .5,
                                        fontSize: width * 0.029,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        color: Color.fromARGB(255, 98, 80, 61),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(21)),
                        child: Material(
                          color: Color.fromARGB(255, 98, 80, 61),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(21)),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => modelPapersPage()),
                              );
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "images/ccard.png",
                                  width: width * 0.1,
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(0, 9, 0, 0),
                                  child: Text(
                                    "Model Papers",
                                    style: GoogleFonts.raleway(
                                      textStyle: TextStyle(
                                          color: Colors.white,
                                          letterSpacing: .5,
                                          fontSize: width * 0.029,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        color: Color.fromARGB(255, 98, 80, 61),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(21)),
                        child: Material(
                          color: Color.fromARGB(255, 98, 80, 61),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(21)),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => teachersGuidePage()),
                              );
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "images/dcard.png",
                                  height: width * 0.1,
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  child: Text(
                                    "Teachers Guide",
                                    style: GoogleFonts.raleway(
                                      textStyle: TextStyle(
                                          color: Colors.white,
                                          letterSpacing: .5,
                                          fontSize: width * 0.029,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Divider(
                color: Color.fromARGB(255, 98, 80, 61),
                indent: 50.0,
                endIndent: 50.0,
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        'images/f.png',
                        width: width * 0.08,
                      ),
                      Image.asset(
                        'images/i.png',
                        width: width * 0.09,
                      ),
                      Image.asset(
                        'images/t.png',
                        width: width * 0.08,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNormalContainer() {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    print("Normal Layout Loaded \n" +
        MediaQuery.of(context).size.width.toString() +
        "\n" +
        MediaQuery.of(context).size.height.toString() +
        "\n" +
        MediaQuery.of(context).size.aspectRatio.toString());
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/b.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 15.0),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: CircleAvatar(
                              backgroundImage: AssetImage(
                            "images/p.png",
                          )),
                        ),
                        Container(
                          padding:
                              EdgeInsets.fromLTRB((width * 0.43), 0, 0, 10),
                          child: ToggleSwitch(
                            minWidth: width * 0.2,
                            minHeight: height * 0.06,
                            cornerRadius: 10.0,
                            activeBgColor: Color.fromARGB(255, 98, 80, 61),
                            activeFgColor: Colors.white,
                            inactiveBgColor: Colors.grey,
                            inactiveFgColor: Colors.white,
                            labels: ['English', 'Sinhala'],
                            onToggle: (index) {
                              if (index == 0) {
                                isEnglish = true;
                                Fluttertoast.showToast(
                                    msg: "Switched to English",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.grey[800],
                                    textColor: Colors.white,
                                    fontSize: 12.0);
                              } else {
                                isEnglish = false;
                                Fluttertoast.showToast(
                                    msg: "Switched to Sinhala",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.grey[800],
                                    textColor: Colors.white,
                                    fontSize: 12.0);
                              }
                            },
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 6.0),
                      child: Text(
                        "Hi !",
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              color: Colors.white,
                              letterSpacing: .5,
                              fontSize: width * 0.08,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 6.0),
                      child: Text(
                        "Welcome to",
                        style: GoogleFonts.robotoSlab(
                          textStyle: TextStyle(
                              color: Color.fromARGB(255, 98, 80, 61),
                              letterSpacing: .5,
                              fontSize: width * 0.045,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: Text(
                        "ICT\nEXPERT",
                        style: GoogleFonts.robotoMono(
                          textStyle: TextStyle(
                              color: Colors.black,
                              letterSpacing: .5,
                              fontSize: width * 0.1,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Text(
                      "Join With Us to Sharpen Your Al IT Knowledge",
                      style: GoogleFonts.koHo(
                        textStyle: TextStyle(
                            color: Color.fromARGB(255, 98, 80, 61),
                            letterSpacing: .1,
                            wordSpacing: .2,
                            fontSize: width * 0.044,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Container(
                child: Expanded(
                  child: GridView.count(
                    primary: false,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.all(5.0),
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 8.0,
                    children: [
                      Card(
                        color: Color.fromARGB(255, 98, 80, 61),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(21)),
                        child: Material(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => notesPage()),
                              );
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "images/acard.png",
                                  width: width * 0.33,
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                                  child: Text(
                                    "Notes",
                                    style: GoogleFonts.raleway(
                                      textStyle: TextStyle(
                                          color: Colors.white,
                                          letterSpacing: .5,
                                          fontSize: width * 0.06,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          color: Color.fromARGB(255, 98, 80, 61),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(21)),
                        ),
                      ),
                      Card(
                        color: Color.fromARGB(255, 98, 80, 61),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(21)),
                        child: Material(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => pastPapersPage()),
                              );
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "images/bcard.png",
                                  width: width * 0.28,
                                ),
                                Text(
                                  "GCE A/L\n Past Papers",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.raleway(
                                    textStyle: TextStyle(
                                        color: Colors.white,
                                        letterSpacing: .5,
                                        fontSize: width * 0.058,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          color: Color.fromARGB(255, 98, 80, 61),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(21)),
                        ),
                      ),
                      Card(
                        color: Color.fromARGB(255, 98, 80, 61),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(21)),
                        child: Material(
                          color: Color.fromARGB(255, 98, 80, 61),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(21)),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => modelPapersPage()),
                              );
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "images/ccard.png",
                                  width: width * 0.3,
                                ),
                                Text(
                                  "Model Papers",
                                  style: GoogleFonts.raleway(
                                    textStyle: TextStyle(
                                        color: Colors.white,
                                        letterSpacing: .5,
                                        fontSize: width * 0.058,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        color: Color.fromARGB(255, 98, 80, 61),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(21)),
                        child: Material(
                          color: Color.fromARGB(255, 98, 80, 61),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(21)),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => teachersGuidePage()),
                              );
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "images/dcard.png",
                                  height: width * 0.3,
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
                                  child: Text(
                                    "Teachers Guide",
                                    style: GoogleFonts.raleway(
                                      textStyle: TextStyle(
                                          color: Colors.white,
                                          letterSpacing: .5,
                                          fontSize: width * 0.058,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Divider(
                color: Color.fromARGB(255, 98, 80, 61),
                indent: 50.0,
                endIndent: 50.0,
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        'images/f.png',
                        width: width * 0.09,
                      ),
                      Image.asset(
                        'images/i.png',
                        width: width * 0.11,
                      ),
                      Image.asset(
                        'images/t.png',
                        width: width * 0.09,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSmallPhoneContainer() {
    print("Small Layout Loaded \n" +
        MediaQuery.of(context).size.width.toString() +
        "\n" +
        MediaQuery.of(context).size.height.toString() +
        "\n" +
        MediaQuery.of(context).size.aspectRatio.toString());
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/b.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 15.0),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 0.5),
                          child: CircleAvatar(
                              backgroundImage: AssetImage(
                            "images/p.png",
                          )),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.fromLTRB(width * 0.375, 0, 0, 0),
                          child: ToggleSwitch(
                            minWidth: width * 0.2125,
                            minHeight: height * 0.07,
                            cornerRadius: 10.0,
                            activeBgColor: Color.fromARGB(255, 98, 80, 61),
                            activeFgColor: Colors.white,
                            inactiveBgColor: Colors.grey,
                            inactiveFgColor: Colors.white,
                            labels: ['English', 'Sinhala'],
                            onToggle: (index) {
                              if (index == 0) {
                                isEnglish = true;
                                Fluttertoast.showToast(
                                    msg: "Switched to English",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.grey[800],
                                    textColor: Colors.white,
                                    fontSize: 12.0);
                              } else {
                                isEnglish = false;
                                Fluttertoast.showToast(
                                    msg: "Switched to Sinhala",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.grey[800],
                                    textColor: Colors.white,
                                    fontSize: 12.0);
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 1.0),
                      child: Text(
                        "Hi !",
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              color: Colors.white,
                              letterSpacing: .5,
                              fontSize: width * 0.08,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 0.0),
                      child: Text(
                        "Welcome to",
                        style: GoogleFonts.robotoSlab(
                          textStyle: TextStyle(
                              color: Color.fromARGB(255, 98, 80, 61),
                              letterSpacing: .5,
                              fontSize: width * 0.044,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 0.0),
                      child: Text(
                        "ICT\nEXPERT",
                        style: GoogleFonts.robotoMono(
                          textStyle: TextStyle(
                              color: Colors.black,
                              letterSpacing: .5,
                              fontSize: width * 0.09,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Text(
                      "Join With Us to Sharpen Your Al IT Knowledge",
                      style: GoogleFonts.koHo(
                        textStyle: TextStyle(
                            color: Color.fromARGB(255, 98, 80, 61),
                            letterSpacing: .1,
                            wordSpacing: .2,
                            fontSize: width * 0.044,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Expanded(
                  child: GridView.count(
                    primary: false,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.all(5.0),
                    crossAxisCount: 2,
                    crossAxisSpacing: 11.0,
                    mainAxisSpacing: 5,
                    children: [
                      Card(
                        color: Color.fromARGB(255, 98, 80, 61),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(21)),
                        child: Material(
                          color: Color.fromARGB(255, 98, 80, 61),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(21)),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => notesPage()),
                              );
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "images/acard.png",
                                  width: width * 0.33,
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                                  child: Text(
                                    "Notes",
                                    style: GoogleFonts.raleway(
                                      textStyle: TextStyle(
                                          color: Colors.white,
                                          letterSpacing: .5,
                                          fontSize: width * 0.06,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        color: Color.fromARGB(255, 98, 80, 61),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(21)),
                        child: Material(
                          color: Color.fromARGB(255, 98, 80, 61),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(21)),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => pastPapersPage()),
                              );
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "images/bcard.png",
                                  width: width * 0.28,
                                ),
                                Text(
                                  "GCE A/L\n Past Papers",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.raleway(
                                    textStyle: TextStyle(
                                        color: Colors.white,
                                        letterSpacing: .5,
                                        fontSize: width * 0.058,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        color: Color.fromARGB(255, 98, 80, 61),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(21)),
                        child: Material(
                          color: Color.fromARGB(255, 98, 80, 61),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(21)),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => modelPapersPage()),
                              );
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "images/ccard.png",
                                  width: width * 0.27,
                                ),
                                Text(
                                  "Model Papers",
                                  style: GoogleFonts.raleway(
                                    textStyle: TextStyle(
                                        color: Colors.white,
                                        letterSpacing: .5,
                                        fontSize: width * 0.057,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        color: Color.fromARGB(255, 98, 80, 61),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(21)),
                        child: Material(
                          color: Color.fromARGB(255, 98, 80, 61),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(21)),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => teachersGuidePage()),
                              );
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "images/dcard.png",
                                  height: width * 0.28,
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
                                  child: Text(
                                    "Teachers Guide",
                                    style: GoogleFonts.raleway(
                                      textStyle: TextStyle(
                                          color: Colors.white,
                                          letterSpacing: .5,
                                          fontSize: width * 0.056,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Divider(
                color: Color.fromARGB(255, 98, 80, 61),
                indent: 50.0,
                endIndent: 50.0,
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 3.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        'images/f.png',
                        width: width * 0.09,
                      ),
                      Image.asset(
                        'images/i.png',
                        width: width * 0.11,
                      ),
                      Image.asset(
                        'images/t.png',
                        width: width * 0.09,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
