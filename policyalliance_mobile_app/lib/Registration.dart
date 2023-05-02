import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Login.dart';
import 'main.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isMobileNumberValid = false;
  TextEditingController RegController = TextEditingController();
  TextEditingController RegController1 = TextEditingController();
  TextEditingController RegController2 = TextEditingController();
  TextEditingController RegController3 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          SingleChildScrollView(
            child:  SafeArea(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        child: Image.asset('assets/images/female doctor.jpg'),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        width: double.infinity,
                        height: 500,
                        margin: EdgeInsets.only(top:170),
                        decoration: BoxDecoration(
                          color:Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(28),
                            topLeft: Radius.circular(28),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color:Colors.grey,
                              blurRadius: 3.0,
                              offset: Offset(0.0, 0.0),
                            )
                          ],
                        ),

                        child:  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                                margin: EdgeInsets.only(top: 24),
                                child: Text('Register to Your Account',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Color(0xFF07539D)),
                                )),
                            Container(
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Name',style: TextStyle(fontSize: 14,color: Color(0xFF434343)),),
                                      Container(
                                        height: 48,
                                        child: TextField(
                                          controller: RegController,
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Color(0xFFD3E9FF),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 1,
                                                    color: Colors.black,
                                                    style: BorderStyle.solid)),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  width: 0,
                                                  color: Colors.transparent,
                                                ),
                                                borderRadius: BorderRadius.circular(10)),
                                          ),
                                        ),
                                      ),
                                    ])),
                            Container(

                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Mobile Number',style: TextStyle(fontSize: 14,color: Color(0xFF434343)),),
                                      Container(
                                        height: 48,
                                        child: TextField(
                                          controller: RegController1,
                                          keyboardType: TextInputType.number,
                                          onChanged: (value) {
                                            // Check if the mobile number has exactly 10 digits
                                            if (value.length == 10) {
                                              setState(() {
                                                isMobileNumberValid = true;
                                              });
                                            } else {
                                              setState(() {
                                                isMobileNumberValid = false;
                                              });
                                            }
                                          },
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Color(0xFFD3E9FF),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 1,
                                                    color: Colors.black,
                                                    style: BorderStyle.solid)),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  width: 0,
                                                  color: Colors.transparent,
                                                ),
                                                borderRadius: BorderRadius.circular(10)),
                                          ),
                                        ),
                                      ),
                                    ])),
                            Container(
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Create Password',style: TextStyle(fontSize: 14,color: Color(0xFF434343)),),
                                      Container(
                                        height: 48,
                                        child: TextField(
                                          controller: RegController2,
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Color(0xFFD3E9FF),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 1,
                                                    color: Colors.black,
                                                    style: BorderStyle.solid)),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  width: 0,
                                                  color: Colors.transparent,
                                                ),
                                                borderRadius: BorderRadius.circular(10)),
                                          ),
                                          keyboardType: TextInputType.visiblePassword,
                                        ),
                                      ),
                                    ])),
                            Container(
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Age',style: TextStyle(fontSize: 14,color: Color(0xFF434343)),),
                                      Container(
                                        height: 48,
                                        child: TextField(
                                          controller: RegController3,
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Color(0xFFD3E9FF),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 1,
                                                    color: Colors.black,
                                                    style: BorderStyle.solid)),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  width: 0,
                                                  color: Colors.transparent,
                                                ),
                                                borderRadius: BorderRadius.circular(10)),
                                          ),
                                        ),
                                      ),
                                    ])),
                            Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 48,
                                  child: ElevatedButton(
                                    child: Text('Register'),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xFF07539D),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    onPressed: () async {
                                      String name = RegController.text;
                                      String mobileNumber = RegController1.text;
                                      String password = RegController2.text;
                                      String age = RegController3.text;
                                      Map<String, dynamic> requestBody = {
                                        'Name': name,
                                        'MobileNumber': mobileNumber,
                                        'Age': age,
                                        'Password': password,
                                      };

                                      String requestBodyJson = json.encode(requestBody);
                                      print(requestBodyJson);

                                      final response = await http.post(
                                        Uri.parse('http://10.0.2.2:8080/home/register'),
                                        headers: {
                                          'Content-Type': 'application/json',
                                        },
                                        body: requestBodyJson,
                                      );
                                      Map<String, dynamic> responseBody =
                                      json.decode(response.body);
                                      var status = responseBody['status'];
                                      print('Status: $status');

                                      if (status == '201') {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) => AlertDialog(
                                            content: Text(
                                              'Your Already Register Please Login',
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Login()),
                                                  );
                                                },
                                                child: Text('OK'),
                                              ),
                                            ],
                                          ),
                                        );
                                      } else {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) => AlertDialog(
                                            content: Text(
                                              'Your Register Successfully Please Login',
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Login()),
                                                  );
                                                },
                                                child: Text('OK'),
                                              ),
                                            ],
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 50),
                                  child: Row(
                                    children: [
                                      Container(
                                        margin:EdgeInsets.only(left: 50),
                                        child: Text("I have an account?"),
                                      ),
                                      Container(
                                        child: TextButton(
                                          child: Text('Login',style: TextStyle(fontWeight: FontWeight.normal,decoration: TextDecoration.underline),),
                                          onPressed: (){
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context)=>  Login())
                                            );
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),

                          ],
                        ),
                      ),


                    ],
                  ),

                ],
              ),
            ),
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
              Container(
                width: 59,
                height: 49,
                margin: EdgeInsets.only(top: 6,left: 20),
                child: IconButton(
                  icon: Icon(Icons.home_outlined,size: 40,color: Colors.white,),
                  onPressed: (){},
                ),
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
              Stack(
                children: [
                  Container(
                    width: 59,
                    height: 49,
                    margin: EdgeInsets.only(top:10,left: 90),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                    Container(
                      margin: EdgeInsets.only(left: 88,top: 3),
                      child: IconButton(
                        icon: Icon(Icons.account_circle_outlined,size:50,color: Color(0xFF07539D),),
                        onPressed: (){

                        },
                      ),
                    ),
                ],
              ),

            ],
          )
        ],
      ),

    );
  }
}

