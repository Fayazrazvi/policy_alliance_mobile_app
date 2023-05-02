import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'PurchasedSuccess.dart';
import 'main.dart';
import 'modal/companies-modal.dart';


class OrderSummary extends StatefulWidget {
  final String username;
  final String companyName;
  final String Plan;
  final int mobileNumber;
  final String image;
  final String PremiumAmount;

  const OrderSummary(
      {Key? key, required this.username, required this.mobileNumber, required this.image, required this.companyName, required this.Plan, required this.PremiumAmount})
      : super(key: key);

  @override
  State<OrderSummary> createState() =>
      _OrderSummaryState(
          username, mobileNumber, image, companyName, Plan, PremiumAmount);
}

class _OrderSummaryState extends State<OrderSummary> {
  TextEditingController passwordController = TextEditingController();
  final String username;
  final String companyName;
  final String Plan;
  final int mobileNumber;
  final String image;
  final String PremiumAmount;
  String? valueChoose;
  List listItem = ["Gpay", "phonepe", "paytm"];
  String upiId = "";

  _OrderSummaryState(this.username, this.mobileNumber, this.image,
      this.companyName, this.Plan, this.PremiumAmount);

  bool isDropDownEnable= false;

  List<Company> companyList = [];

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
                  child: Text('Order Summary', style: TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold, color: Color(
                      0xFF07539D)),),
                ),
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
      body: Stack(
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
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 35),
                margin: EdgeInsets.only(top:130),
                height:650,
                width: 430,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 25.0),
                      child: Text(
                        'Order Summary',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: Color(0xFF07539D),
                        ),
                      ),
                    ),
                    Container(
                      width: 450,
                      margin: EdgeInsets.only(top: 17.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment:MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Text('Company Name',style: TextStyle(fontSize: 14),),
                              ),
                              Container(

                                child: Text(widget.companyName,style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment:MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 20),
                                child: Text('Plan',style: TextStyle(fontSize: 14),),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 20),
                                child: Text(widget.Plan,style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment:MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 20),
                                child: Text('Plan Amount',style: TextStyle(fontSize: 14),),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 20),
                                child: Text(widget.PremiumAmount,style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment:MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 20),
                                child: Text('GST',style: TextStyle(fontSize: 14),),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 20),
                                child: Text('0.00',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment:MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 20),
                                child: Text('Total Amount',style: TextStyle(fontSize: 14),),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 20),
                                child: Text(widget.PremiumAmount,style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                              )
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(top:10),
                            child: Divider(
                              color: Colors.black12,
                              height: 25,
                              thickness: 2,
                              indent: 4,
                              endIndent: 4,
                            ),
                          ),
                          Container(
                            child: Text('Select Payment Method',style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                              color: Color(0xFF07539D),
                            ),),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: DropdownButtonFormField(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder( //<-- SEE HERE
                                    borderSide: BorderSide(color: Colors.black, width: .5),
                                    borderRadius: BorderRadius.zero
                                ),
                                focusedBorder: OutlineInputBorder( //<-- SEE HERE
                                    borderSide: BorderSide(color: Colors.black, width: .5),
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                filled: true,
                                fillColor: Color(0xFFD3E9FF),
                              ),
                              hint: Text('UPI Apps'),
                              value: valueChoose,
                              onChanged: (newValue){
                                setState(() {
                                  valueChoose= newValue.toString();
                                  isDropDownEnable= true;
                                });
                              },
                              items: listItem.map((valueItem) {
                                return DropdownMenuItem(
                                  value: valueItem,
                                  child: Text(valueItem),
                                );
                              }).toList(),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top:10),
                            child: Text('UPI ID'),
                          ),
                          Container(
                            margin: EdgeInsets.only(top:10),
                            child: TextField(
                              controller: passwordController,
                              decoration: InputDecoration(
                                  hintText: 'Enter UPI ID',
                                  filled: true,
                                  fillColor: Color(0xFFD3E9FF),
                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 1,color: Colors.black,style: BorderStyle.solid)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 0,
                                        color: Colors.transparent,

                                      ),
                                      borderRadius: BorderRadius.circular(10)
                                  )
                              ),
                              enabled: isDropDownEnable,
                              onChanged: (value) {
                                setState(() {
                                  upiId = value;
                                });
                              },
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 22),
                                width: 100,
                                height: 40,
                                child: OutlinedButton(
                                  child: Text('Cancel',style: TextStyle(color: Color(0xFF07539D)),),
                                  onPressed: (){
                                    Navigator.pop(context);
                                  },
                                  style: OutlinedButton.styleFrom( //<-- SEE HERE
                                      side: BorderSide(width:0.5,color: Color(0xFF07539D)),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10)
                                      )
                                  ),
                                ),
                              ),
                              Container(
                                width: 100,
                                height: 40,
                                margin: EdgeInsets.only(top: 20,left: 117),
                                child: ElevatedButton(
                                  child: Text('Confirm'),
                                  onPressed: upiId.trim().isEmpty ? null :()async {
                                    DateTime now = DateTime.now();
                                    String formattedDate = DateFormat('M/d/yyyy').format(now);
                                    DateTime oneYearFromNow = now.add(Duration(days: 365));
                                    String formattedOneYearFromNow = DateFormat('M/d/yyyy').format(oneYearFromNow);
                                    Map<String, dynamic> requestBody = {
                                      'userName':username,
                                      'userMobileNumber': mobileNumber.toString(),
                                      'PaymentVia': valueChoose,
                                      'PolicyStartdate': formattedDate,
                                      'PolicyEndDate': formattedOneYearFromNow,
                                      'Amount': widget.PremiumAmount,
                                      'CompanyName':widget.companyName,
                                      'Plan': widget.Plan,

                                    };

                                    String requestBodyJson = json.encode(requestBody);
                                    print(requestBodyJson);

                                    final response = await http.post(
                                      Uri.parse('http://10.0.2.2:8080/home/company2'),
                                      headers: {
                                        'Content-Type': 'application/json',
                                      },
                                      body: requestBodyJson,
                                    );
                                    Map<String, dynamic> responseBody =
                                    json.decode(response.body);
                                    var status = responseBody['status'];
                                    print('Status: $status');

                                    if (status == '200') {
                                      String image = widget.image;
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>PurchasedSuccess(image:image),
                                        ),
                                      );
                                    }else {

                                    }
                                  },
                                  style: ElevatedButton.styleFrom( //<-- SEE HERE
                                      side: BorderSide(width:0.5,color: Color(0xFF07539D)),
                                      backgroundColor: Color(0xFF07539D),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10)
                                      )
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),



                  ],
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
