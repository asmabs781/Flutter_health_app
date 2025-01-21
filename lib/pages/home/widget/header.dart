import 'package:flutter/material.dart';
 
class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top:MediaQuery.of(context).padding.top,
        left:20,
        right:20,

      ),
      //height:350,
      //color: Colors.orange,
      child: Row(children:[
        Column(children: const[
          Text(
          'Welcome,',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          )  
          )
          
          ],
          
      ),
      ]),
    );
  }
}