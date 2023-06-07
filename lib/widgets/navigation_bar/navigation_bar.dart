import 'package:flutter/material.dart';

class NavigationBar extends StatelessWidget {
  const NavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) { 
    return Container(
      height: 100,
      child: Row(
        children: <Widget>[
          SizedBox(
            height: 80,
            width: 150,
            child: Image.asset('assets/logo.png'),  
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[],
          )
        ],
      ),
    );
  }
}

class _NavbarItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Text(style: TextStyle(fontSize: 18),""
    );
  }
}