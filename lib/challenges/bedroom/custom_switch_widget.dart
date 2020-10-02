import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  CustomSwitch({Key key, @required this.value, @required this.onChanged})
      : super(key: key);

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch>
    with SingleTickerProviderStateMixin {
  Animation _circleAnimation;
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _circleAnimation = AlignmentTween(
      begin: widget.value ? Alignment.bottomCenter : Alignment.topCenter,
      end: widget.value ? Alignment.topCenter : Alignment.bottomCenter,
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.linear),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            if (_animationController.isCompleted) {
              _animationController.reverse();
            } else {
              _animationController.forward();
            }
            widget.value == false
                ? widget.onChanged(true)
                : widget.onChanged(false);
          },
          child: Container(
            width: 30,
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: _circleAnimation.value == Alignment.topCenter
                  ? Colors.black26
                  : Colors.black26,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 7, left: 2, right: 2, bottom: 7),
              child: Container(
                alignment: _circleAnimation.value,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
