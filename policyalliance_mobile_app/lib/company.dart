import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:policyalliance_mobile_app/OrderSummary.dart';
import 'api/company-api.dart';
import 'main.dart';
import 'modal/companies-modal.dart';




class companies extends StatefulWidget {
  final String username;
  final int mobileNumber;
  const companies({Key? key,required this.username,required this.mobileNumber}):super(key:key);
  @override
  State<companies> createState() => _companiesState(username , mobileNumber);
}

class _companiesState extends State<companies> {

  final String username;
  final int mobileNumber;
  TextEditingController passwordController = TextEditingController();

  _companiesState(this.username, this.mobileNumber);


  final companyDetails = Allcompanies();
  List<Company> companyList = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    Empty1 empty = await companyDetails.getCompany();
    setState(() {
      companyList = empty.company;
    });
  }
  num get StarIcons => 2;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:PreferredSize(
        preferredSize: Size.fromHeight(110.0),
        child: AppBar(
            leading: Container(
              child: Icon(Icons.arrow_back,color: Color(0xFF707070),),
            ),
            toolbarHeight: 100,
            backgroundColor: Color(0xFFF4F9FF),
            title:Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 11),
                  child: Text('All Company',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Color(0xFF07539D)),),
                ),Container(
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
                        hintText: 'Search your company',
                        icon: Icon(Icons.search)
                    ),
                  ),
                )
              ],
            )


        ),
      ),
      body: Column(
        children: [
          Expanded(child: SingleChildScrollView(
            child: Container(
              color: Color(0xFFF4F9FF),
              child: Column(
                children: [Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 230,
                        child: Container(
                          margin: EdgeInsets.only(top: 20),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount:
                            companyList.length < 2 ? companyList.length : 2,
                            itemBuilder: (BuildContext context, int index) {
                              return Row(
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left:20),
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),
                                        width: 160,
                                        height: 225,
                                        child: Container(
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width: 189,
                                                height: 117,
                                                decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.all(
                                                    Radius.circular(0),
                                                  ),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color:Colors.grey,
                                                      blurRadius: 6.0,
                                                      spreadRadius: 2.0,
                                                      offset: Offset(0.0, 0.0),
                                                    )
                                                  ],
                                                ),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    showModalBottomSheet<void>(
                                                      context: context,
                                                      builder: (BuildContext context) {
                                                        return Container(
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10),
                                                            topRight: Radius.circular(10)),
                                                            color: Colors.white,
                                                          ),
                                                          padding: EdgeInsets.symmetric(horizontal: 10),
                                                          height: 432,

                                                          child: Center(
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: <Widget>[
                                                                Container(
                                                                  decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10),
                                                                        topRight: Radius.circular(10)),
                                                                  ),
                                                                  height:242,
                                                                  width: 388,
                                                                  margin: EdgeInsets.only(top: 30),
                                                                  child:ClipRRect(
                                                                    borderRadius:
                                                                    BorderRadius.circular(10),
                                                                    child: Image.network(
                                                                      companyList[index].companyImage,
                                                                      fit: BoxFit.fill,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  margin:EdgeInsets.only(top:13,left: 5),
                                                                  child: Text(
                                                                    companyList[index].companyName,
                                                                    style: TextStyle(
                                                                      fontSize: 16.0,
                                                                      fontWeight:
                                                                      FontWeight.bold,
                                                                      color: Color(0xFF07539D),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Container(
                                                                      margin:EdgeInsets.only(top:11,left: 5),
                                                                      child: Text(
                                                                        companyList[index].plan,
                                                                        style: TextStyle(
                                                                          fontSize: 16.0,
                                                                          fontWeight:
                                                                          FontWeight.normal,
                                                                          color: Color(0xFF292929),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      margin: EdgeInsets.only(left:221),
                                                                      child: Text(companyList[index]
                                                                          .premiumAmount, style: TextStyle(color: Color(0xFF07539D), fontSize: 16)),
                                                                    )
                                                                  ],
                                                                ),
                                                                Container(
                                                                  margin:EdgeInsets.only(left:5,top:7,bottom: 13),
                                                                  child: Row(
                                                                    crossAxisAlignment:
                                                                    CrossAxisAlignment.start,
                                                                    children: [
                                                                      for (var i = 0; i < 5; i++)
                                                                        Icon(
                                                                          i <
                                                                              (
                                                                                  companyList[index]
                                                                                      .starRating)
                                                                              ? Icons.star
                                                                              : Icons.star_border,
                                                                          color: i <
                                                                              (
                                                                                  companyList[index]
                                                                                      .starRating)
                                                                              ? Color(0xFFF26F20)
                                                                              : Color(0xFFF26F20),
                                                                          size: 20,
                                                                        ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width:double.infinity,
                                                                  height:48,
                                                                  child: ElevatedButton(
                                                                    child: Text('Buy'),
                                                                    onPressed: () {
                                                                      String image = companyList[index].companyImage;
                                                                      String companyname=companyList[index].companyName;
                                                                      String plan=companyList[index].plan;
                                                                      String amount=companyList[index].premiumAmount;
                                                                      Navigator.push(
                                                                        context,
                                                                        MaterialPageRoute(builder: (context) => OrderSummary(username: username,companyName:companyname,Plan:plan,image:image, mobileNumber: mobileNumber,PremiumAmount:amount)),
                                                                      );
                                                                    },
                                                                    style: ElevatedButton.styleFrom(
                                                                        backgroundColor: Color(0xFF07539D),
                                                                        shape: RoundedRectangleBorder(
                                                                          borderRadius: BorderRadius.circular(10),
                                                                        )
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                  child: ClipRRect(
                                                    borderRadius:
                                                    BorderRadius.circular(10),
                                                    child: Image.network(
                                                      companyList[index].companyImage,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 148,
                                                child: Row(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Container(
                                                      margin:EdgeInsets.only(top:13,left: 5),
                                                      child: Text(
                                                        companyList[index].companyName,
                                                        style: TextStyle(
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                          FontWeight.bold,
                                                          color: Color(0xFF292929),
                                                        ),
                                                      ),
                                                    ),

                                                  ],
                                                ),
                                              ),
                                              Container(
                                                margin:EdgeInsets.only(top:11,left: 5),
                                                child: Text(
                                                  companyList[index].plan,
                                                  style: TextStyle(
                                                    fontSize: 15.0,
                                                    fontWeight:
                                                    FontWeight.normal,
                                                    color: Color(0xFF292929),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin:EdgeInsets.only(left:5,top:7,bottom: 13),
                                                child: Row(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    for (var i = 0; i < 5; i++)
                                                      Icon(
                                                        i <
                                                            (
                                                                companyList[index]
                                                                    .starRating)
                                                            ? Icons.star
                                                            : Icons.star_border,
                                                        color: i <
                                                            (
                                                                companyList[index]
                                                                    .starRating)
                                                            ? Color(0xFFF26F20)
                                                            : Color(0xFFF26F20),
                                                        size: 15,
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 230,
                        child: Container(
                          margin: EdgeInsets.only(top: 20),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount:
                            companyList.length < 2 ? companyList.length : 2,
                            itemBuilder: (BuildContext context, int index) {
                              return Row(
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left:20),
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),

                                        width: 160,
                                        height: 225,
                                        child: Container(
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width: 189,
                                                height: 117,
                                                decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.all(
                                                    Radius.circular(10),
                                                  ),

                                                ),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    showModalBottomSheet<void>(
                                                      context: context,
                                                      builder: (BuildContext context) {
                                                        return Container(
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10),
                                                                topRight: Radius.circular(10)),
                                                            color: Colors.white,
                                                          ),
                                                          padding: EdgeInsets.symmetric(horizontal: 10),
                                                          height: 432,

                                                          child: Center(
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: <Widget>[
                                                                Container(
                                                                  decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10),
                                                                        topRight: Radius.circular(10)),
                                                                  ),
                                                                  height:242,
                                                                  width: 388,
                                                                  margin: EdgeInsets.only(top: 30),
                                                                  child: Image.network(
                                                                    companyList[index+2].companyImage,
                                                                    fit: BoxFit.fill,
                                                                  ),
                                                                ),
                                                                Container(
                                                                  margin:EdgeInsets.only(top:13,left: 5),
                                                                  child: Text(
                                                                    companyList[index+2].companyName,
                                                                    style: TextStyle(
                                                                      fontSize: 16.0,
                                                                      fontWeight:
                                                                      FontWeight.bold,
                                                                      color: Color(0xFF07539D),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Container(
                                                                      margin:EdgeInsets.only(top:11,left: 5),
                                                                      child: Text(
                                                                        companyList[index+2].plan,
                                                                        style: TextStyle(
                                                                          fontSize: 16.0,
                                                                          fontWeight:
                                                                          FontWeight.normal,
                                                                          color: Color(0xFF292929),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      margin: EdgeInsets.only(left:221),
                                                                      child: Text(companyList[index+2]
                                                                          .premiumAmount, style: TextStyle(color: Color(0xFF07539D), fontSize: 16)),
                                                                    )
                                                                  ],
                                                                ),
                                                                Container(
                                                                  margin:EdgeInsets.only(left:5,top:7,bottom: 13),
                                                                  child: Row(
                                                                    crossAxisAlignment:
                                                                    CrossAxisAlignment.start,
                                                                    children: [
                                                                      for (var i = 0; i < 5; i++)
                                                                        Icon(
                                                                          i <
                                                                              (
                                                                                  companyList[index+2]
                                                                                      .starRating)
                                                                              ? Icons.star
                                                                              : Icons.star_border,
                                                                          color: i <
                                                                              (
                                                                                  companyList[index+2]
                                                                                      .starRating)
                                                                              ? Color(0xFFF26F20)
                                                                              : Color(0xFFF26F20),
                                                                          size: 20,
                                                                        ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width:double.infinity,
                                                                  height:48,
                                                                  child: ElevatedButton(
                                                                    child: Text('Buy'),
                                                                    onPressed: () {
                                                                      String image = companyList[index+2].companyImage;
                                                                      String companyname=companyList[index+2].companyName;
                                                                      String plan=companyList[index+2].plan;
                                                                      String amount=companyList[index+2].premiumAmount;
                                                                      Navigator.push(
                                                                        context,
                                                                        MaterialPageRoute(builder: (context) => OrderSummary(username: username,companyName:companyname,Plan:plan,image:image, mobileNumber: mobileNumber,PremiumAmount:amount)),
                                                                      );
                                                                    },
                                                                    style: ElevatedButton.styleFrom(
                                                                        backgroundColor: Color(0xFF07539D),
                                                                        shape: RoundedRectangleBorder(
                                                                          borderRadius: BorderRadius.circular(10),
                                                                        )
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                  child: ClipRRect(
                                                    borderRadius:
                                                    BorderRadius.circular(10),
                                                    child: Image.network(
                                                      companyList[index+2].companyImage,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 148.0,
                                                child: Row(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Container(
                                                      margin:EdgeInsets.only(top:13,left: 5),
                                                      child: Text(
                                                        companyList[index+2].companyName,
                                                        style: TextStyle(
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                          FontWeight.bold,
                                                          color: Color(0xFF292929),
                                                        ),
                                                      ),
                                                    ),

                                                  ],
                                                ),
                                              ),
                                              Container(
                                                margin:EdgeInsets.only(top:11,left: 5),
                                                child: Text(
                                                  companyList[index+2].plan,
                                                  style: TextStyle(
                                                    fontSize: 15.0,
                                                    fontWeight:
                                                    FontWeight.normal,
                                                    color: Color(0xFF0F1924),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin:EdgeInsets.only(left:5,top:7,bottom: 13),
                                                child: Row(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    for (var i = 0; i < 5; i++)
                                                      Icon(
                                                        i <
                                                            (
                                                                companyList[index+2]
                                                                    .starRating)
                                                            ? Icons.star
                                                            : Icons.star_border,
                                                        color: i <
                                                            (
                                                                companyList[index+2]
                                                                    .starRating)
                                                            ? Color(0xFFF26F20)
                                                            : Color(0xFFF26F20),
                                                        size: 15,
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 230,
                        child: Container(
                          margin: EdgeInsets.only(top: 20),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount:
                            companyList.length < 2 ? companyList.length : 2,
                            itemBuilder: (BuildContext context, int index) {
                              return Row(
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left:20),
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),

                                        width: 160,
                                        height: 225,
                                        child: Container(
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width: 189,
                                                height: 117,
                                                decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.all(
                                                    Radius.circular(10),
                                                  ),

                                                ),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    showModalBottomSheet<void>(
                                                      context: context,
                                                      builder: (BuildContext context) {
                                                        return Container(
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10),
                                                                topRight: Radius.circular(10)),
                                                            color: Colors.white,
                                                          ),
                                                          padding: EdgeInsets.symmetric(horizontal: 10),
                                                          height: 432,

                                                          child: Center(
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: <Widget>[
                                                                Container(
                                                                  decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10),
                                                                        topRight: Radius.circular(10)),
                                                                  ),
                                                                  height:242,
                                                                  width: 388,
                                                                  margin: EdgeInsets.only(top: 30),
                                                                  child: Image.network(
                                                                    companyList[index+4].companyImage,
                                                                    fit: BoxFit.fill,
                                                                  ),
                                                                ),
                                                                Container(
                                                                  margin:EdgeInsets.only(top:13,left: 5),
                                                                  child: Text(
                                                                    companyList[index+4].companyName,
                                                                    style: TextStyle(
                                                                      fontSize: 16.0,
                                                                      fontWeight:
                                                                      FontWeight.bold,
                                                                      color: Color(0xFF07539D),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Container(
                                                                      margin:EdgeInsets.only(top:11,left: 5),
                                                                      child: Text(
                                                                        companyList[index+4].plan,
                                                                        style: TextStyle(
                                                                          fontSize: 16.0,
                                                                          fontWeight:
                                                                          FontWeight.normal,
                                                                          color: Color(0xFF292929),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      margin: EdgeInsets.only(left:221),
                                                                      child: Text(companyList[index+4]
                                                                          .premiumAmount, style: TextStyle(color: Color(0xFF07539D), fontSize: 16)),
                                                                    )
                                                                  ],
                                                                ),
                                                                Container(
                                                                  margin:EdgeInsets.only(left:5,top:7,bottom: 13),
                                                                  child: Row(
                                                                    crossAxisAlignment:
                                                                    CrossAxisAlignment.start,
                                                                    children: [
                                                                      for (var i = 0; i < 5; i++)
                                                                        Icon(
                                                                          i <
                                                                              (
                                                                                  companyList[index+4]
                                                                                      .starRating)
                                                                              ? Icons.star
                                                                              : Icons.star_border,
                                                                          color: i <
                                                                              (
                                                                                  companyList[index+4]
                                                                                      .starRating)
                                                                              ? Color(0xFFF26F20)
                                                                              : Color(0xFFF26F20),
                                                                          size: 20,
                                                                        ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width:double.infinity,
                                                                  height:48,
                                                                  child: ElevatedButton(
                                                                    child: Text('Buy'),
                                                                    onPressed: () {
                                                                      String image = companyList[index+4].companyImage;
                                                                      String companyname=companyList[index+4].companyName;
                                                                      String plan=companyList[index+4].plan;
                                                                      String amount=companyList[index+4].premiumAmount;
                                                                      Navigator.push(
                                                                        context,
                                                                        MaterialPageRoute(builder: (context) => OrderSummary(username: username,companyName:companyname,Plan:plan,image:image, mobileNumber: mobileNumber,PremiumAmount:amount)),
                                                                      );
                                                                    },
                                                                    style: ElevatedButton.styleFrom(
                                                                        backgroundColor: Color(0xFF07539D),
                                                                        shape: RoundedRectangleBorder(
                                                                          borderRadius: BorderRadius.circular(10),
                                                                        )
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                  child: ClipRRect(
                                                    borderRadius:
                                                    BorderRadius.circular(10),
                                                    child: Image.network(
                                                      companyList[index+4].companyImage,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 148.0,
                                                child: Row(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Container(
                                                      margin:EdgeInsets.only(top:13,left: 5),
                                                      child: Text(
                                                        companyList[index+4].companyName,
                                                        style: TextStyle(
                                                          fontSize: 13.0,
                                                          fontWeight:
                                                          FontWeight.bold,
                                                          color: Color(0xFF292929),
                                                        ),
                                                      ),
                                                    ),

                                                  ],
                                                ),
                                              ),
                                              Container(
                                                margin:EdgeInsets.only(top:11,left: 5),
                                                child: Text(
                                                  companyList[index+4].plan,
                                                  style: TextStyle(
                                                    fontSize: 15.0,
                                                    fontWeight:
                                                    FontWeight.normal,
                                                    color: Color(0xFF0F1924),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin:EdgeInsets.only(left:5,top:7,bottom: 13),
                                                child: Row(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    for (var i = 0; i < 5; i++)
                                                      Icon(
                                                        i <
                                                            (
                                                                companyList[index+4]
                                                                    .starRating)
                                                            ? Icons.star
                                                            : Icons.star_border,
                                                        color: i <
                                                            (
                                                                companyList[index+4]
                                                                    .starRating)
                                                            ? Color(0xFFF26F20)
                                                            : Color(0xFFF26F20),
                                                        size: 15,
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 230,
                        child: Container(
                          margin: EdgeInsets.only(top: 20),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount:
                            companyList.length < 2 ? companyList.length : 2,
                            itemBuilder: (BuildContext context, int index) {
                              return Row(
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left:20),
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),

                                        width: 160,
                                        height: 225,
                                        child: Container(
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width: 189,
                                                height: 117,
                                                decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.all(
                                                    Radius.circular(10),
                                                  ),

                                                ),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    showModalBottomSheet<void>(
                                                      context: context,
                                                      builder: (BuildContext context) {
                                                        return Container(
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10),
                                                                topRight: Radius.circular(10)),
                                                            color: Colors.white,
                                                          ),
                                                          padding: EdgeInsets.symmetric(horizontal: 10),
                                                          height: 432,

                                                          child: Center(
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: <Widget>[
                                                                Container(
                                                                  decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10),
                                                                        topRight: Radius.circular(10)),
                                                                  ),
                                                                  height:242,
                                                                  width: 388,
                                                                  margin: EdgeInsets.only(top: 30),
                                                                  child: Image.network(
                                                                    companyList[index+6].companyImage,
                                                                    fit: BoxFit.fill,
                                                                  ),
                                                                ),
                                                                Container(
                                                                  margin:EdgeInsets.only(top:13,left: 5),
                                                                  child: Text(
                                                                    companyList[index+6].companyName,
                                                                    style: TextStyle(
                                                                      fontSize: 16.0,
                                                                      fontWeight:
                                                                      FontWeight.bold,
                                                                      color: Color(0xFF07539D),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Container(
                                                                      margin:EdgeInsets.only(top:11,left: 5),
                                                                      child: Text(
                                                                        companyList[index+6].plan,
                                                                        style: TextStyle(
                                                                          fontSize: 16.0,
                                                                          fontWeight:
                                                                          FontWeight.normal,
                                                                          color: Color(0xFF292929),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      margin: EdgeInsets.only(left:221),
                                                                      child: Text(companyList[index+6]
                                                                          .premiumAmount, style: TextStyle(color: Color(0xFF07539D), fontSize: 16)),
                                                                    )
                                                                  ],
                                                                ),
                                                                Container(
                                                                  margin:EdgeInsets.only(left:5,top:7,bottom: 13),
                                                                  child: Row(
                                                                    crossAxisAlignment:
                                                                    CrossAxisAlignment.start,
                                                                    children: [
                                                                      for (var i = 0; i < 5; i++)
                                                                        Icon(
                                                                          i <
                                                                              (
                                                                                  companyList[index+6]
                                                                                      .starRating)
                                                                              ? Icons.star
                                                                              : Icons.star_border,
                                                                          color: i <
                                                                              (
                                                                                  companyList[index+6]
                                                                                      .starRating)
                                                                              ? Color(0xFFF26F20)
                                                                              : Color(0xFFF26F20),
                                                                          size: 20,
                                                                        ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width:double.infinity,
                                                                  height:48,
                                                                    child: ElevatedButton(
                                                                      child: Text('Buy'),
                                                                      onPressed: () {
                                                                        String image = companyList[index+6].companyImage;
                                                                        String companyname=companyList[index+6].companyName;
                                                                        String plan=companyList[index+6].plan;
                                                                        String amount=companyList[index+6].premiumAmount;
                                                                        Navigator.push(
                                                                          context,
                                                                          MaterialPageRoute(builder: (context) => OrderSummary(username: username,companyName:companyname,Plan:plan,image:image, mobileNumber: mobileNumber,PremiumAmount:amount)),
                                                                        );
                                                                      },
                                                                      style: ElevatedButton.styleFrom(
                                                                          backgroundColor: Color(0xFF07539D),
                                                                          shape: RoundedRectangleBorder(
                                                                            borderRadius: BorderRadius.circular(10),
                                                                          )
                                                                      ),
                                                                    ),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                  child: ClipRRect(
                                                    borderRadius:
                                                    BorderRadius.circular(10),
                                                    child: Image.network(
                                                      companyList[index+6].companyImage,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 148.0,
                                                child: Row(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Container(
                                                      margin:EdgeInsets.only(top:13,left: 5),
                                                      child: Text(
                                                        companyList[index+6].companyName,
                                                        style: TextStyle(
                                                          fontSize: 13.0,
                                                          fontWeight:
                                                          FontWeight.bold,
                                                          color: Color(0xFF292929),
                                                        ),
                                                      ),
                                                    ),

                                                  ],
                                                ),
                                              ),
                                              Container(
                                                margin:EdgeInsets.only(top:11,left: 5),
                                                child: Text(
                                                  companyList[index+6].plan,
                                                  style: TextStyle(
                                                    fontSize: 15.0,
                                                    fontWeight:
                                                    FontWeight.normal,
                                                    color: Color(0xFF0F1924),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin:EdgeInsets.only(left:5,top:7,bottom: 13),
                                                child: Row(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    for (var i = 0; i < 5; i++)
                                                      Icon(
                                                        i <
                                                            (
                                                                companyList[index+6]
                                                                    .starRating)
                                                            ? Icons.star
                                                            : Icons.star_border,
                                                        color: i <
                                                            (
                                                                companyList[index+6]
                                                                    .starRating)
                                                            ? Color(0xFFF26F20)
                                                            : Color(0xFFF26F20),
                                                        size: 15,
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 230,
                        child: Container(
                          margin: EdgeInsets.only(top: 20),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount:
                            companyList.length < 2 ? companyList.length : 2,
                            itemBuilder: (BuildContext context, int index) {
                              return Row(
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left:20),
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),

                                        width: 160,
                                        height: 225,
                                        child: Container(
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width: 189,
                                                height: 117,
                                                decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.all(
                                                    Radius.circular(10),
                                                  ),

                                                ),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    showModalBottomSheet<void>(
                                                      context: context,
                                                      builder: (BuildContext context) {
                                                        return Container(
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10),
                                                                topRight: Radius.circular(10)),
                                                            color: Colors.white,
                                                          ),
                                                          padding: EdgeInsets.symmetric(horizontal: 10),
                                                          height: 432,

                                                          child: Center(
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: <Widget>[
                                                                Container(
                                                                  decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10),
                                                                        topRight: Radius.circular(10)),
                                                                  ),
                                                                  height:242,
                                                                  width: 388,
                                                                  margin: EdgeInsets.only(top: 30),
                                                                  child: Image.network(
                                                                    companyList[index+8].companyImage,
                                                                    fit: BoxFit.fill,
                                                                  ),
                                                                ),
                                                                Container(
                                                                  margin:EdgeInsets.only(top:13,left: 5),
                                                                  child: Text(
                                                                    companyList[index+8].companyName,
                                                                    style: TextStyle(
                                                                      fontSize: 16.0,
                                                                      fontWeight:
                                                                      FontWeight.bold,
                                                                      color: Color(0xFF07539D),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Container(
                                                                      margin:EdgeInsets.only(top:11,left: 5),
                                                                      child: Text(
                                                                        companyList[index+8].plan,
                                                                        style: TextStyle(
                                                                          fontSize: 16.0,
                                                                          fontWeight:
                                                                          FontWeight.normal,
                                                                          color: Color(0xFF292929),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      margin: EdgeInsets.only(left:221),
                                                                      child: Text(companyList[index+8]
                                                                          .premiumAmount, style: TextStyle(color: Color(0xFF07539D), fontSize: 16)),
                                                                    )
                                                                  ],
                                                                ),
                                                                Container(
                                                                  margin:EdgeInsets.only(left:5,top:7,bottom: 13),
                                                                  child: Row(
                                                                    crossAxisAlignment:
                                                                    CrossAxisAlignment.start,
                                                                    children: [
                                                                      for (var i = 0; i < 5; i++)
                                                                        Icon(
                                                                          i <
                                                                              (
                                                                                  companyList[index+8]
                                                                                      .starRating)
                                                                              ? Icons.star
                                                                              : Icons.star_border,
                                                                          color: i <
                                                                              (
                                                                                  companyList[index+8]
                                                                                      .starRating)
                                                                              ? Color(0xFFF26F20)
                                                                              : Color(0xFFF26F20),
                                                                          size: 20,
                                                                        ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width:double.infinity,
                                                                  height:48,
                                                                  child: ElevatedButton(
                                                                    child: Text('Buy'),
                                                                    onPressed: () {
                                                                      String image = companyList[index+8].companyImage;
                                                                      String companyname=companyList[index+8].companyName;
                                                                      String plan=companyList[index+8].plan;
                                                                      String amount=companyList[index+8].premiumAmount;
                                                                      Navigator.push(
                                                                        context,
                                                                        MaterialPageRoute(builder: (context) => OrderSummary(username: username,companyName:companyname,Plan:plan,image:image, mobileNumber: mobileNumber,PremiumAmount:amount)),
                                                                      );
                                                                    },
                                                                    style: ElevatedButton.styleFrom(
                                                                        backgroundColor: Color(0xFF07539D),
                                                                        shape: RoundedRectangleBorder(
                                                                          borderRadius: BorderRadius.circular(10),
                                                                        )
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                  child: ClipRRect(
                                                    borderRadius:
                                                    BorderRadius.circular(10),
                                                    child: Image.network(
                                                      companyList[index+8].companyImage,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 148.0,
                                                child: Row(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Container(
                                                      margin:EdgeInsets.only(top:13,left: 5),
                                                      child: Text(
                                                        companyList[index+8].companyName,
                                                        style: TextStyle(
                                                          fontSize: 13.0,
                                                          fontWeight:
                                                          FontWeight.bold,
                                                          color: Color(0xFF292929),
                                                        ),
                                                      ),
                                                    ),

                                                  ],
                                                ),
                                              ),
                                              Container(
                                                margin:EdgeInsets.only(top:11,left: 5),
                                                child: Text(
                                                  companyList[index+8].plan,
                                                  style: TextStyle(
                                                    fontSize: 15.0,
                                                    fontWeight:
                                                    FontWeight.normal,
                                                    color: Color(0xFF0F1924),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin:EdgeInsets.only(left:5,top:7,bottom: 13),
                                                child: Row(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    for (var i = 0; i < 5; i++)
                                                      Icon(
                                                        i <
                                                            (
                                                                companyList[index+8]
                                                                    .starRating)
                                                            ? Icons.star
                                                            : Icons.star_border,
                                                        color: i <
                                                            (
                                                                companyList[index+8]
                                                                    .starRating)
                                                            ? Color(0xFFF26F20)
                                                            : Color(0xFFF26F20),
                                                        size: 15,
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),],
              ),
            ),
          ),
          )

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
                  onPressed: (){},
                ),
              ),
              Container(
                width: 59,
                height: 49,
                margin: EdgeInsets.only(left: 90),
                child: IconButton(
                  icon: Icon(Icons.account_circle_outlined,size:50,color: Colors.white,),
                  onPressed: (){

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
