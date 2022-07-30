import 'package:flutter/material.dart';
import '../models/Tutorial.dart';
import '../page_transitions.dart';
import '../screens/home.dart';
import '../screens/details.dart';

class NotasCard extends StatelessWidget {
  final Tutorial data;

  const NotasCard({
     Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // return Card(
    //   child: ListTile(
    //     leading: Icon(Icons.person),
    //     trailing: Icon(Icons.view_list),
    //     title: Text(
    //       data.name!,
    //       style: TextStyle(fontSize: 20),
    //     ),
    //     onTap: () {
    //       Navigator.push(
    //         context,
    //         EnterExitRoute(
    //           exitPage: Home(),
    //           enterPage: Details(student: data),
    //         ),
    //       );
    //     },
    //   ),
    // );




    return
      InkWell(
        onTap: () {
            //  Navigator.push(
            //    context,
            //   EnterExitRoute(
            //     exitPage: Home(),
            //      enterPage: Details(student: data),
            //    ),
            // );
           },
    child: Card(
      color: Colors.white,
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.network(
              data.name,
              width: 80,
              height: 80,
            ),
          ),
          Padding(padding: EdgeInsets.only(left: 15)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      data.name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF333333),
                      ),

                    ),
                    Text(
                      data.name,
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xFF999999),
                      ),


                    )
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 2)),
                Text(
                  data.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF999999),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    )
      );
  }
}
