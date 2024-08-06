import 'package:flutter/material.dart';

class DealOfDay extends StatefulWidget {
  const DealOfDay({super.key});

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 10,top: 15),
          child: Text(
            'Deal of the day',
            style: TextStyle(
              fontSize: 20,

            ),
          ),
        ),
        Image.network("https://images.unsplash.com/photo-1593078166039-c9878df5c520?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8Mnw2MzYzNzA1NHx8ZW58MHx8fHx8",
        height: 235,
        fit: BoxFit.fitHeight,
        ),
        Container(
          padding: EdgeInsets.only(left: 15),
          alignment: Alignment.topLeft,
          child: Text('\$100', style: TextStyle(fontSize: 18),),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(right: 40,top: 5, left: 15),
          child: Text(
            'Soula ',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.network('https://images.unsplash.com/photo-1550222029-a7a8070f7673?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MTh8NjM2MzcwNTR8fGVufDB8fHx8fA%3D%3D',fit: BoxFit.fitWidth,width: 100,)
          ],
        )
      ],

    );
  }
}