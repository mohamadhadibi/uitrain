import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uitrain/challenges/bedroom/custom_switch_widget.dart';
import 'package:uitrain/utils/routs.dart';

class BedroomWidget extends StatefulWidget {

  @override
  _BedroomWidgetState createState() => _BedroomWidgetState();
}

class _BedroomWidgetState extends State<BedroomWidget>
    with TickerProviderStateMixin
{

  bool isDay = true;
  Color _textColor = Colors.black54;
  AnimationController _animationController;
  AnimationController _animationController2;
  AnimationController _animationController3;
  Animation _animationSwitch;
  Animation _animationBackgroundDay;
  Animation _animationBackgroundNight;
  Animation _animationSlideDay;
  Animation _animationSlideNight;
  Animation _animationList1;
  Animation _animationList2;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animationController2 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    _animationController3 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));

    _animationSwitch = Tween<Offset>(
      begin: Offset(0, 0),
      end: Offset(0, -0.1),
    ).animate(_animationController);

    _animationBackgroundDay = Tween<Offset>(
      begin: Offset(0, 0),
      end: Offset(0, -1),
    ).animate(_animationController);

    _animationBackgroundNight = Tween<Offset>(
      begin: Offset(0, 1),
      end: Offset(0, 0),
    ).animate(_animationController);

    _animationSlideDay = Tween<Offset>(
      begin: Offset(0, 0),
      end: Offset(-1, 0),
    ).animate(_animationController);

    _animationSlideNight = Tween<Offset>(
      begin: Offset(1, 0),
      end: Offset(0, 0),
    ).animate(_animationController);

    _animationList1 = CurvedAnimation(
      parent: _animationController2,
      curve: Curves.easeInToLinear,
    );

    _animationList2 = CurvedAnimation(
      parent: _animationController3,
      curve: Curves.easeInToLinear,
    );

    _animationController2.forward();
    _animationController3.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          SlideTransition(
            position: _animationBackgroundDay,
            child: Container(
              color: Colors.yellow,
            ),
          ),
          SlideTransition(
            position: _animationBackgroundNight,
            child: Container(
              color: Colors.black54,
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: Container(
              margin: EdgeInsets.only(top: 30),
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                color: _textColor,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          SlideTransition(
            position: _animationSlideDay,
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 120,
                height: 120,
                margin: EdgeInsets.only(top: 50),
                child: Image.asset(getPng('img_day')),
              ),
            ),
          ),
          SlideTransition(
            position: _animationSlideNight,
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 120,
                height: 120,
                margin: EdgeInsets.only(top: 50),
                child: Image.asset(getPng('img_night')),
              ),
            ),
          ),
          SlideTransition(
            position: _animationBackgroundNight,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 200,
                height: 200,
                margin: EdgeInsets.only(bottom: 50),
                child: Image.asset(getPng('img_sleep')),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 10),
              width: 300,
              height: 200,
              child: Column(
                children: [
                  FadeTransition(
                    opacity: _animationList1,
                    child: Container(
                      height: 100,
                      child: Card(
                        elevation: 20,
                        child: ClipPath(
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                top: 2,
                                right: 2,
                                child: Icon(Icons.add, color: Colors.green,),
                              ),
                              Positioned(
                                top: 10,
                                left: 12,
                                child: Column(
                                  children: [
                                    Text(
                                      'Task one to do',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child: Text(
                                        'Woody is first.',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.deepOrange
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                bottom: 10,
                                right: 20,
                                child: Text(
                                  'at 11:20 AM',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey
                                  ),
                                ),
                              ),
                            ],
                          ),
                          clipper: ShapeBorderClipper(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  FadeTransition(
                    opacity: _animationList2,
                    child: Container(
                      height: 100,
                      child: Card(
                        elevation: 20,
                        child: ClipPath(
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                top: 2,
                                right: 2,
                                child: Icon(Icons.add, color: Colors.green,),
                              ),
                              Positioned(
                                top: 10,
                                left: 12,
                                child: Column(
                                  children: [
                                    Text(
                                      'Happiness is everything.',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child: Text(
                                        'Allen is last.',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.deepOrange
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                bottom: 10,
                                right: 20,
                                child: Text(
                                  'at 11:15 AM',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey
                                  ),
                                ),
                              ),
                            ],
                          ),
                          clipper: ShapeBorderClipper(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            width: double.infinity,
            margin: EdgeInsets.only(left: 30, bottom: 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 200,
                  child: Text(
                    'Bedroom',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w700,
                      color: _textColor,
                    ),
                  ),
                ),
                Container(
                  width: 200,
                  child: Text(
                    '74°',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20,
                      color: _textColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SlideTransition(
            position: _animationSwitch,
            child: Container(
              alignment: Alignment.topRight,
              margin: EdgeInsets.only(right: 50),
              child: Container(
                width: 3,
                height: MediaQuery.of(context).size.height/2,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            margin: EdgeInsets.only(right: 37, bottom: 40),
            child: CustomSwitch(
              onChanged: (bool value) {
                /*_animationController.forward().whenComplete(() {
                      // put here the stuff you wanna do when animation completed!
                    });*/
                _changeDayNight(value);
              },
              value: isDay,
            ),
          ),
        ],
      ),
    );
  }


  void _changeDayNight(bool day){
    if (_animationController.isCompleted) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }

    if (_animationController2.isCompleted) {
      _animationController2.reverse();
    } else {
      _animationController2.forward();
    }

    if (_animationController3.isCompleted) {
      _animationController3.reverse();
    } else {
      _animationController3.forward();
    }
    setState(() {
      isDay = day;
      if(isDay){
        _textColor = Colors.black87;
      }else{
        _textColor = Colors.white;
      }
    });
  }
}
