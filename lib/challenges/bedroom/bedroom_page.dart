import 'package:flutter/material.dart';
import 'package:uitrain/challenges/bedroom/bedroom_widget.dart';

class BedroomPage extends StatefulWidget {
  @override
  _BedroomPageState createState() => _BedroomPageState();
}

class _BedroomPageState extends State<BedroomPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getBody(),
    );
  }

  Widget _getBody(){

    return BedroomWidget();
  }
}
