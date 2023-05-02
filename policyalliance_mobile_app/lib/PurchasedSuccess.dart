import 'package:flutter/material.dart';

import 'main.dart';

class PurchasedSuccess extends StatefulWidget {
  final String image;
  const PurchasedSuccess({Key? key, required this.image}) : super(key: key);

  @override
  State<PurchasedSuccess> createState() => _PurchasedSuccessState(image);
}

class _PurchasedSuccessState extends State<PurchasedSuccess> {
  final String image;

  _PurchasedSuccessState(this.image);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(110.0),
        child: AppBar(
            leading: Container(
              child: Icon(Icons.arrow_back, color: Color(0xFF707070),),
            ),
            toolbarHeight: 100,
            backgroundColor: Color(0xFFF4F9FF),
            title: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 11),
                  height: 48,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 3,
                        blurRadius: 3,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: TextField(

                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.white,
                          ),
                        ),
                        hintText: 'Order Summary',
                        icon: Icon(Icons.search)
                    ),
                  ),
                )
              ],
            )


        ),
      ),
      body:
          Stack(
            children: [
                Container(
                  margin: EdgeInsets.only(top: 12, left: 20, right: 21),
                  width: double.infinity,
                  child: ClipRRect(
                      borderRadius:
                      BorderRadius.circular(10),
                      child: Image.network(widget.image, fit: BoxFit.fill,)
                  ),
                ),
              Container(
                child: AlertDialog(
                  content: Container(
                    width: 300.0,
                    height: 150.0,
                    child: Column(
                      children: [
                        Icon(Icons.offline_pin, color: Colors.green, size: 40.0),
                        SizedBox(width: 16.0),
                        Container(
                          margin: EdgeInsets.only(top: 15),
                          child: Text(
                            'Purchased Successfully',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Color(0xFF3F3F57)
                            ),
                          ),
                        ),
                        Container(
                          margin:EdgeInsets.only(top:15),
                          height: 48,
                          width: 245,
                          child: ElevatedButton(
                            child: Text('Done'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>PolicyAlliance(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF07539D),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  actions: [

                  ],
                ),
              ),
            ],
          ),

        );

  }
}
