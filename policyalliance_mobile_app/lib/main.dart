import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:policyalliance_mobile_app/Customers.dart';
import 'package:policyalliance_mobile_app/Registration.dart';
import 'Splash.dart';

void main()
{
  runApp(MaterialApp(
    home:Splash(),
    debugShowCheckedModeBanner: false,
  ));
}


class PolicyAlliance extends StatefulWidget {
  @override
  State<PolicyAlliance> createState() => _PolicyAllianceState();
}

class _PolicyAllianceState extends State<PolicyAlliance> {
  num get StarIcons => 2;

  get items => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:PreferredSize(
        preferredSize: Size.fromHeight(150.0),
        child: AppBar(
          leading: Container(
            child: Container(
              child: Image.asset('assets/images/Group 18.jpg'),
              height: 150.0,
              width: 500.0,
              margin: EdgeInsets.only(left: 10.0,top: 8.0),
            ),
          ),
          leadingWidth: 200.0,
          toolbarHeight: 100,
          backgroundColor: Color(0xFFF4F9FF),
            title:Container(
              height: 48,
              width: 220,
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
                  hintText: 'Search your company',
                  icon: Icon(Icons.search)
                ),
              ),
            )


        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                color: Color(0xFFF4F9FF),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width :430,
                            color: Color(0xFFF4F9FF),
                          ),
                          Stack(
                            children:[
                              Container(
                              margin: EdgeInsets.only(left: 20),
                              height: 159,
                              width: 300,
                              decoration: BoxDecoration(
                                  color: Color(0xFF07539D),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                              ),
                            ),
                              ),

                              Container(
                                margin: EdgeInsets.only(left: 230),
                                height: 159,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                      topLeft: Radius.circular(100),
                                      bottomLeft: Radius.circular(100)
                                    ),
                                   child: Image.asset('assets/images/female doctor.jpg'),
                                  ),
                              ),
                              Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 40,top: 12),
                                    child: Text('Term Insurance and \nInvestment Plan',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Color(0xFFFFFFFF)),),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 12,
                                    width: 12,
                                    margin: EdgeInsets.only(left: 40,top: 62),
                                    child:CircleAvatar(
                                        backgroundImage:AssetImage('assets/images/Save-Tax.jpg')
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 62,left: 7),
                                    child: Text('Tax Savings upto Rs 46,800',style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,color: Color(0xFFFFFFFF))),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 12,
                                    width: 12,
                                    margin: EdgeInsets.only(left: 40,top: 84),
                                    child:CircleAvatar(
                                        backgroundImage:AssetImage('assets/images/Save-Tax.jpg')
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 84,left: 7),
                                    child: Text('99.34% Claims Paid Ratio',style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,color: Color(0xFFFFFFFF))),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 12,
                                    width: 12,
                                    margin: EdgeInsets.only(left: 40,top: 107),
                                    child:CircleAvatar(
                                        backgroundImage:AssetImage('assets/images/Save-Tax.jpg')
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 107,left: 7),
                                    child: Text('5% Discount',style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,color: Color(0xFFFFFFFF))),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 12,
                                    width: 12,
                                    margin: EdgeInsets.only(left: 40,top: 129),
                                    child:CircleAvatar(
                                        backgroundImage:AssetImage('assets/images/Save-Tax.jpg')
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 129,left: 7),
                                    child: Text('Zero Commission',style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,color: Color(0xFFFFFFFF))),
                                  )
                                ],
                              )
                            ]
                          ),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 15,left:20),
                                child: Text('Top Category',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Color(0xFF07539D)),),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 180,top: 15),
                                width: 80,
                                height: 25,
                                child: ElevatedButton(
                                  child: Text('view all',style: TextStyle(fontSize:12,fontWeight: FontWeight.normal,color: Color(0xFF07539D)),),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.zero,
                                      )
                                  ),
                                  onPressed: (){},
                                ),
                              )
                            ],
                          ),

                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child:  Row(
                              children: [
                                Container(
                                  height: 150,
                                  width: 200,
                                  margin: EdgeInsets.only(left: 20,top: 15,bottom: 10),
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color:Colors.grey,
                                        blurRadius: 3.0,
                                        offset: Offset(0.0, 0.0),
                                      )
                                    ],
                                  ),
                                  child:Column(
                                    children: [
                                      Container(
                                        margin:EdgeInsets.only(top:16),
                                        child:CircleAvatar(
                                          backgroundImage:AssetImage('assets/images/Save-Tax.jpg'),
                                        ),
                                        height: 70,
                                        width: 70,

                                        decoration: BoxDecoration(
                                          border: Border.all(width: 1, color: Colors.black),
                                          borderRadius: BorderRadius.circular(100), //<-- SEE HERE
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top:10),
                                        child: Text('Business Companies',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:Color(0xFF07539D)),),
                                      ),

                                    ],
                                  ),
                                ),
                                Container(
                                  height: 150,
                                  width: 200,
                                  margin: EdgeInsets.only(left: 20,top: 15,bottom: 10),
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color:Colors.grey,
                                        blurRadius: 3.0,
                                        offset: Offset(0.0, 0.0),
                                      )
                                    ],
                                  ),
                                  child:Column(
                                    children: [
                                      Container(
                                        margin:EdgeInsets.only(top:16),
                                        child:CircleAvatar(
                                          backgroundImage:AssetImage('assets/images/Save-Tax.jpg'),
                                        ),
                                        height: 70,
                                        width: 70,

                                        decoration: BoxDecoration(
                                          border: Border.all(width: 1, color: Colors.black),
                                          borderRadius: BorderRadius.circular(100), //<-- SEE HERE
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top:10),
                                        child: Text('Personal Healthy',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:Color(0xFF07539D)),),
                                      ),

                                    ],
                                  ),
                                ),
                                Container(
                                  height: 150,
                                  width: 200,
                                  margin: EdgeInsets.only(left: 20,top: 15,bottom: 10),
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color:Colors.grey,
                                        blurRadius: 3.0,
                                        offset: Offset(0.0, 0.0),
                                      )
                                    ],
                                  ),
                                  child:Column(
                                    children: [
                                      Container(
                                        margin:EdgeInsets.only(top:16),
                                        child:CircleAvatar(
                                          backgroundImage:AssetImage('assets/images/Save-Tax.jpg'),
                                        ),
                                        height: 70,
                                        width: 70,

                                        decoration: BoxDecoration(
                                          border: Border.all(width: 1, color: Colors.black),
                                          borderRadius: BorderRadius.circular(100), //<-- SEE HERE
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top:10),
                                        child: Text('Life Insurance',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:Color(0xFF07539D)),),
                                      ),

                                    ],
                                  ),
                                ),
                                Container(
                                  height: 150,
                                  width: 200,
                                  margin: EdgeInsets.only(left: 20,top: 15,bottom: 10),
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color:Colors.grey,
                                        blurRadius: 3.0,
                                        offset: Offset(0.0, 0.0),
                                      )
                                    ],
                                  ),
                                  child:Column(
                                    children: [
                                      Container(
                                        margin:EdgeInsets.only(top:16),
                                        child:CircleAvatar(
                                          backgroundImage:AssetImage('assets/images/Save-Tax.jpg'),
                                        ),
                                        height: 70,
                                        width: 70,

                                        decoration: BoxDecoration(
                                          border: Border.all(width: 1, color: Colors.black),
                                          borderRadius: BorderRadius.circular(100), //<-- SEE HERE
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top:10),
                                        child: Text('Educationa Fund',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:Color(0xFF07539D)),),
                                      ),

                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 28,left: 82),
                            child: Text('Our Plan for Your Strategies',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Color(0xFF07539D)),),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 12,left: 40,right: 37),
                            child: Text('Discover Health Insurance With Opd At Shopwebly! - Easily Found! Easy Access. Quick Results.\nMany Products. Search and Discover. Compare Products. Find Easily. Types: News, Video, Images, Web, Wiki.',style: TextStyle(fontSize: 12),),
                          ),
                          Row(
                            children: [
                              Container(
                                  height: 40,
                                  width: 273,
                                  color: Color(0xFF07539D),
                                  margin: EdgeInsets.only(top: 15,left: 79),
                                  child:Row(
                                    children: [
                                      Container(
                                        height: 30,
                                        width:131,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.zero,
                                            ),
                                          ),
                                          child:Text('Annually Plan',style: TextStyle(color: Color(0xFF07539D),fontSize: 10),),
                                          onPressed: (){},
                                        ),
                                        margin: EdgeInsets.only(top: 0,left: 10),
                                      ),
                                      Container(
                                        height: 30,
                                        width:131,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Color(0xFF07539D),
                                            shadowColor: Color(0),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.zero,
                                            ),
                                          ),
                                          child:Text('Monthly Plan',style: TextStyle(fontSize: 10),),
                                          onPressed: (){},
                                        ),
                                        margin: EdgeInsets.only(top: 0,),
                                      )
                                    ],
                                  )
                              ),
                            ],
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Container(
                                    margin: EdgeInsets.only(top: 17,left: 20),
                                    width: 225,
                                    height:300,
                                    decoration: BoxDecoration(
                                        color: Color(0xFFD3E9FF),
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    child:Column(
                                      children:[
                                        Container(

                                          child: Text('Lite Plan',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Color(0xFF014A71)),),
                                          padding:EdgeInsets.only(top: 20.25),
                                          alignment: Alignment.topCenter,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 7),
                                          child: Text('Lite Plan allows you and your family\nto purchase affordable short-term medical\ncoverage for physician services,\nsurgery, outpatient and inpatient care.',style: TextStyle(fontSize:10,fontWeight: FontWeight.bold),),
                                          alignment: Alignment.topCenter,
                                        ),
                                        Container(
                                          margin:EdgeInsets.only(top: 12),
                                          child: Text(r"$150/month",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Color(0xFF014A71)),),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 12),
                                          child: Text('3 Months of care',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
                                          alignment: Alignment.topCenter,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 12),
                                          child: Text('4 Part health plan',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold)),
                                          alignment: Alignment.topCenter,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 12),
                                          child: Text('Health plan update',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold)),
                                          alignment: Alignment.topCenter,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 10.5),
                                          width: 184,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Color(0xFF98D6F7),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.zero,
                                              ),
                                            ),
                                            child: Text('Select Plan',style: TextStyle(fontSize: 12,color: Color(0xFF014A71)),),
                                            onPressed: (){},
                                          ),
                                        )
                                      ] ,
                                    )


                                ),
                                Container(
                                    margin: EdgeInsets.only(top: 17,left: 10),
                                    width: 225,
                                    height:300,
                                    decoration: BoxDecoration(
                                        color: Color(0xFFFED662),
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    child:Column(
                                      children:[
                                        Container(

                                          child: Text('Basic Plan',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Color(0xFF014A71)),),
                                          padding:EdgeInsets.only(top: 20.25),
                                          alignment: Alignment.topCenter,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 7,left: 20),
                                          child: Text('Lite Plan allows you and your family\nto purchase affordable short-term medical\ncoverage for physician services,\nsurgery, outpatient and inpatient care.',style: TextStyle(fontSize:10,fontWeight: FontWeight.bold),),
                                          alignment: Alignment.topCenter,
                                        ),
                                        Container(
                                          margin:EdgeInsets.only(top: 12),
                                          child: Text(r"$250/month",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Color(0xFF014A71)),),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 12),
                                          child: Text('12 Months of care',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
                                          alignment: Alignment.topCenter,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 12),
                                          child: Text('12 Part health plan',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold)),
                                          alignment: Alignment.topCenter,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 12),
                                          child: Text('Health plan update',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold)),
                                          alignment: Alignment.topCenter,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 10.5),
                                          width: 184,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Color(0xFF07539D),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.zero,
                                              ),
                                            ),
                                            child: Text('Select Plan',style: TextStyle(fontSize: 12,color: Colors.white),),
                                            onPressed: (){},
                                          ),
                                        )
                                      ] ,
                                    )


                                ),
                                Container(
                                    margin: EdgeInsets.only(top: 17,left: 10),

                                    width: 225,
                                    height:300,
                                    decoration: BoxDecoration(
                                        color: Color(0xFFD3E9FF),
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    child:Column(
                                      children:[
                                        Container(

                                          child: Text('Premium Plan',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Color(0xFF014A71)),),
                                          padding:EdgeInsets.only(top: 20.25),
                                          alignment: Alignment.topCenter,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 7,left: 20),
                                          child: Text('Premium plans offer coverage\nagainst several types of ailments and surgeries,\nalong with other aspects of medical treatment',style: TextStyle(fontSize:10,fontWeight: FontWeight.bold),),
                                          alignment: Alignment.topCenter,
                                        ),
                                        Container(
                                          margin:EdgeInsets.only(top: 12),
                                          child: Text(r"$500/month",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Color(0xFF014A71)),),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 12),
                                          child: Text('Unlimited of Care',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
                                          alignment: Alignment.topCenter,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 12),
                                          child: Text('50 Part health plan',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold)),
                                          alignment: Alignment.topCenter,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 12),
                                          child: Text('Health plan update',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold)),
                                          alignment: Alignment.topCenter,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 10.5),
                                          width: 200,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Color(0xFF98D6F7),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.zero,
                                              ),
                                            ),
                                            child: Text('Select Plan',style: TextStyle(fontSize: 12,color: Color(0xFF014A71)),),
                                            onPressed: (){},
                                          ),
                                        )
                                      ] ,
                                    )


                                ),
                              ],
                            ),
                          ),

                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 30,left: 20),
                                child: Text('Recommended Company',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Color(0xFF07539D)),),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 150,top: 30),
                                width: 80,
                                height: 25,
                                child: ElevatedButton(
                                  child: Text('view all',style: TextStyle(fontSize:12,fontWeight: FontWeight.normal,color: Color(0xFF07539D)),),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.zero,
                                      )
                                  ),
                                  onPressed: (){},
                                ),
                              )
                            ],
                          ),

                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Container(
                                    margin: EdgeInsets.only(top: 15,left: 20),
                                    width: 230,
                                    height:240,
                                    child:Column(
                                      children:[
                                        Container(

                                          child: Image.asset('assets/images/StarHealth.jpg'),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 20),
                                          child: Text('Star Health Insurance',style: TextStyle(fontSize:17,fontWeight: FontWeight.bold),),
                                          alignment: Alignment.centerLeft,

                                        ),
                                        Container(
                                          margin:EdgeInsets.only(top: 10),
                                          child: Text('Base Plan'),
                                          alignment: Alignment.centerLeft,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 10.0),
                                          alignment: Alignment.centerLeft,
                                          child: Row(
                                            children: [
                                              for (var i = 0; i < 5; i++)
                                                Icon(
                                                  i < StarIcons ? Icons.star : Icons.star_border,
                                                  color: i < StarIcons
                                                      ? Color(0xFFF26F20)
                                                      : Color(0xFFF26F20),
                                                  size: 15,
                                                ),
                                            ],
                                          ),
                                        ),

                                      ] ,
                                    )


                                ),
                                Container(
                                    margin: EdgeInsets.only(top: 15,left: 10),
                                    width: 230,
                                    height:240,
                                    child:Column(
                                      children:[
                                        Container(

                                          child: Image.asset('assets/images/StarHealth.jpg'),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 20),
                                          child: Text('Star Health Insurance',style: TextStyle(fontSize:17,fontWeight: FontWeight.bold),),
                                          alignment: Alignment.centerLeft,

                                        ),
                                        Container(
                                          margin:EdgeInsets.only(top: 10),
                                          child: Text('Base Plan'),
                                          alignment: Alignment.centerLeft,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 10.0),
                                          alignment: Alignment.centerLeft,
                                          child: Row(
                                            children: [
                                              for (var i = 0; i < 5; i++)
                                                Icon(
                                                  i < StarIcons ? Icons.star : Icons.star_border,
                                                  color: i < StarIcons
                                                      ? Color(0xFFF26F20)
                                                      : Color(0xFFF26F20),
                                                  size: 15,
                                                ),
                                            ],
                                          ),
                                        ),

                                      ] ,
                                    )


                                ),
                                Container(
                                    margin: EdgeInsets.only(top: 15,left: 10),
                                    width: 230,
                                    height:240,
                                    child:Column(
                                      children:[
                                        Container(

                                          child: Image.asset('assets/images/StarHealth.jpg'),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 20),
                                          child: Text('Star Health Insurance',style: TextStyle(fontSize:17,fontWeight: FontWeight.bold),),
                                          alignment: Alignment.centerLeft,

                                        ),
                                        Container(
                                          margin:EdgeInsets.only(top: 10),
                                          child: Text('Base Plan'),
                                          alignment: Alignment.centerLeft,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 10.0),
                                          alignment: Alignment.centerLeft,
                                          child: Row(
                                            children: [
                                              for (var i = 0; i < 5; i++)
                                                Icon(
                                                  i < StarIcons ? Icons.star : Icons.star_border,
                                                  color: i < StarIcons
                                                      ? Color(0xFFF26F20)
                                                      : Color(0xFFF26F20),
                                                  size: 15,
                                                ),
                                            ],
                                          ),
                                        ),

                                      ] ,
                                    )


                                ),
                                Container(
                                    margin: EdgeInsets.only(top: 15,left: 10),
                                    width: 230,
                                    height:240,
                                    child:Column(
                                      children:[
                                        Container(

                                          child: Image.asset('assets/images/StarHealth.jpg'),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 20),
                                          child: Text('Star Health Insurance',style: TextStyle(fontSize:17,fontWeight: FontWeight.bold),),
                                          alignment: Alignment.centerLeft,

                                        ),
                                        Container(
                                          margin:EdgeInsets.only(top: 10),
                                          child: Text('Base Plan'),
                                          alignment: Alignment.centerLeft,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 10.0),
                                          alignment: Alignment.centerLeft,
                                          child: Row(
                                            children: [
                                              for (var i = 0; i < 5; i++)
                                                Icon(
                                                  i < StarIcons ? Icons.star : Icons.star_border,
                                                  color: i < StarIcons
                                                      ? Color(0xFFF26F20)
                                                      : Color(0xFFF26F20),
                                                  size: 15,
                                                ),
                                            ],
                                          ),
                                        ),

                                      ] ,
                                    )


                                ),
                                Container(
                                    margin: EdgeInsets.only(top: 15,left: 10),
                                    width: 230,
                                    height:240,
                                    child:Column(
                                      children:[
                                        Container(

                                          child: Image.asset('assets/images/StarHealth.jpg'),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 20),
                                          child: Text('Star Health Insurance',style: TextStyle(fontSize:17,fontWeight: FontWeight.bold),),
                                          alignment: Alignment.centerLeft,

                                        ),
                                        Container(
                                          margin:EdgeInsets.only(top: 10),
                                          child: Text('Base Plan'),
                                          alignment: Alignment.centerLeft,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 10.0),
                                          alignment: Alignment.centerLeft,
                                          child: Row(
                                            children: [
                                              for (var i = 0; i < 5; i++)
                                                Icon(
                                                  i < StarIcons ? Icons.star : Icons.star_border,
                                                  color: i < StarIcons
                                                      ? Color(0xFFF26F20)
                                                      : Color(0xFFF26F20),
                                                  size: 15,
                                                ),
                                            ],
                                          ),
                                        ),

                                      ] ,
                                    )


                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
              ),
                  ),
          ),
        ],
      ),
      bottomNavigationBar:Stack(
        children: [
          Container(
            height: 64,
            width: double.infinity,
            color: Color(0xFF07539D),
          ),
          Row(
            children: [
              Stack(
                children: [
                  Container(
                    width: 59,
                    height: 49,
                    margin: EdgeInsets.only(top:10,left: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 17,top: 3),
                    child: IconButton(
                      icon: Icon(Icons.home_outlined,size:50,color: Color(0xFF07539D),),
                      onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context)=>  Register())
                        );
                      },
                    ),
                  ),
                ],
              ),
              Container(
                width: 59,
                height: 49,
                margin: EdgeInsets.only(left: 90),
                child: IconButton(
                  icon: Icon(Icons.table_chart_outlined,size:50,color: Colors.white,),
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context)=>  Customers())
                    );

                  },
                ),
              ),
              Container(
                width: 59,
                height: 49,
                margin: EdgeInsets.only(left: 90),
                child: IconButton(
                  icon: Icon(Icons.account_circle_outlined,size:50,color: Colors.white,),
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context)=>  Register())
                    );
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
