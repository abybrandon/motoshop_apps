import 'package:flutter/material.dart';
import 'package:motoshop_reborn/page/splashpage_menu/Splashpage.dart';
import 'package:motoshop_reborn/theme.dart';
import 'package:motoshop_reborn/wrapper.dart';

class Onbording extends StatefulWidget {
  @override
  _OnbordingState createState() => _OnbordingState();
}

class _OnbordingState extends State<Onbording> {
  int currentIndex = 0;
  PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image(
            image: AssetImage("assets/bg.png"),
          ),
          Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  itemCount: contents.length,
                  onPageChanged: (int index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (_, i) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 250,
                            width: 250,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(contents[i].image))),
                          ),
                          SizedBox(height: 30),
                          Text(
                            contents[i].title,
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            contents[i].discription,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    contents.length,
                    (index) => buildDot(index, context),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width * 0.50,
                      // ignore: deprecated_member_use
                      child: FlatButton(
                        child: Text(currentIndex == contents.length - 1
                            ? "Login"
                            : "Next"),
                        onPressed: () {
                          if (currentIndex == contents.length - 1) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) => SplashPage2(),
                              ),
                            );
                          }
                          _controller.nextPage(
                            duration: Duration(milliseconds: 100),
                            curve: Curves.bounceIn,
                          );
                        },
                        color: AppTheme.redConst,
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      height: 60,
                      width: MediaQuery.of(context).size.width * 0.30,
                      // ignore: deprecated_member_use
                      child: FlatButton(
                        child: Text("Skip"),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => Wrapperr(),
                            ),
                          );
                        },
                        color: Colors.black,
                        textColor: AppTheme.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppTheme.redConst,
      ),
    );
  }
}

class UnbordingContent {
  String image;
  String title;
  String discription;

  UnbordingContent({this.image, this.title, this.discription});
}

List<UnbordingContent> contents = [
  UnbordingContent(
      title: 'SecondNew Shop',
      image: 'assets/logoonly3.png',
      discription: "Jual Beli Motor Second Like New "),
  UnbordingContent(
      title: 'Cash On Delivery',
      image: 'assets/search.png',
      discription: "Melayani jual beli Motor Second \n "
          "Mulai dari Motor Matic, Sport, hingga Motor Custom \n"
          "50 CC - 250 CC "),
  UnbordingContent(
      title: 'Best Service',
      image: 'assets/tipe_motor.jpg',
      discription: "Melayani COD Jabodetabek S&K berlaku \n "
          "Sudah diservice dan siap digunakan \n"
          "Siap Mengaspal bukan siap ke bengkel"),
];
