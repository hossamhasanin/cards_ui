import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  Animation cardAnimation, delayedCardAnymation, fabButtonsAnimation , infoAnimation;
  AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(duration: Duration(seconds: 3) , vsync: this);
    cardAnimation = Tween(begin: 0.0 , end: -0.025).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.fastOutSlowIn
    ));

    delayedCardAnymation = Tween(begin: 0.0 , end: -0.05).animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(0.5 , 1.0 , curve: Curves.fastOutSlowIn)
    ));

    fabButtonsAnimation = Tween(begin: 1.0 , end: -0.005).animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(0.8 , 1.0 , curve: Curves.fastOutSlowIn)
    ));

    infoAnimation = Tween(begin: 0.0 , end: 0.025).animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(0.7 , 1.0 , curve: Curves.fastOutSlowIn)
    ));
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    animationController.forward();
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context , Widget child){
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                color: Colors.black,
                onPressed: (){}),
            title: Text(
              "Near By",
              style: TextStyle(
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.bold,
                  color: Colors.black
              ),
            ),
            actions: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: FlutterLogo(
                  colors: Colors.blue,
                  size: 40.0,
                ),
              )
            ],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 40.0),
                child: Stack(
                  overflow: Overflow.visible,
                  children: <Widget>[
                    Positioned(
                      left: 20.0,
                      child: Container(
                        transform: Matrix4.translationValues(0.0, delayedCardAnymation.value * height, 0.0),
                        width: 260.0,
                        height: 400.0,
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                      ),
                    ),
                    Positioned(
                      left: 10.0,
                      child: Container(
                        transform: Matrix4.translationValues(0.0, cardAnimation.value * height, 0.0),
                        width: 280.0,
                        height: 400.0,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                      ),
                    ),
                    Container(
                      width: 300.0,
                      height: 400.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                              image: AssetImage("assets/girl.jpeg"),
                              fit: BoxFit.cover
                          )
                      ),
                    ),
                    Positioned(
                      top: 320.0,
                      left: 15.0,
                      child: Container(
                        transform: Matrix4.translationValues(0.0, infoAnimation.value * height, 0.0),
                        width: 270.0,
                        height: 90.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 1.0,
                                color: Colors.black12,
                              )
                            ]
                        ),
                        child: Container(
                          padding: EdgeInsets.all(7.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text(
                                    "Ghada",
                                    style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  SizedBox(width: 4.0),
                                  Image.asset("assets/female.png",
                                    height: 20.0,
                                    width: 20.0,
                                  ),
                                  SizedBox(width: 90.0),
                                  Text(
                                    "5.5KM",
                                    style: TextStyle(
                                        fontFamily: "Montserrat",
                                        fontSize: 20.0,
                                        color: Colors.grey
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 9.0),
                              Row(
                                children: <Widget>[
                                  Text(
                                    "Fate is wonderful .",
                                    style: TextStyle(
                                        fontFamily: "Montserrat",
                                        fontSize: 15.0,
                                        color: Colors.grey
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                transform: Matrix4.translationValues(0.0, fabButtonsAnimation.value * height, 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    FloatingActionButton(
                        onPressed: (){},
                        elevation: 0.0,
                        child: Icon(
                            Icons.close,
                            color: Colors.black
                        ),
                        backgroundColor: Colors.white
                    ),
                    Container(
                      height: 70.0,
                      width: 70.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(35.0),
                          border: Border.all(
                              color: Colors.transparent,
                              style: BorderStyle.solid,
                              width: 2.0
                          )
                      ),
                      child: Container(
                        child: Center(
                          child: IconButton(
                            icon: Image.asset("assets/chatbubble.png"),
                            color: Colors.lightBlueAccent[300],
                            onPressed: (){},
                          ),
                        ),
                      ),
                    ),
                    FloatingActionButton(
                        elevation: 0.0,
                        onPressed: (){},
                        child: Icon(
                            Icons.favorite,
                            color: Colors.pink
                        ),
                        backgroundColor: Colors.white
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

