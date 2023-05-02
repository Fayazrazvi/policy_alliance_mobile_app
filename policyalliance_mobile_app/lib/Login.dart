import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'Registration.dart';
import 'company.dart';
import 'main.dart';




class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isMobileNumberValid = false;
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
                    height: 386,
                    margin: EdgeInsets.only(top:270),
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
                      children: [
                        Container(
                            margin: EdgeInsets.only(top: 26),
                            child: Text('Login',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Color(0xFF07539D)),
                            )),
                        Container(

                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      margin: EdgeInsets.only(top: 20),
                                      child: Text('Mobile Number',style: TextStyle(fontSize: 14,color: Color(0xFF434343)),)),
                                  Container(
                                    margin: EdgeInsets.only(top: 5),
                                    height: 48,
                                    child: TextField(
                                      controller: mobileNumberController,
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
                                  Container(
                                      margin: EdgeInsets.only(top: 20),
                                      child: Text('Create Password',style: TextStyle(fontSize: 14,color: Color(0xFF434343)),)),
                                  Container(
                                    margin: EdgeInsets.only(top: 5),
                                    height: 48,
                                    child: TextField(
                                      controller: passwordController,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Color(0xFFD3E9FF),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 1,
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
                          margin: EdgeInsets.only(left: 230),
                          child: TextButton(
                            child: Text('Forget Password',style: TextStyle(fontWeight: FontWeight.normal,decoration: TextDecoration.underline),),
                            onPressed: (){

                            },
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              width: double.infinity,
                              height: 48,
                              child: ElevatedButton(
                                child: Text('Login'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF07539D),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                onPressed: ()async {
                                  String mobileNumber = mobileNumberController.text;
                                  String password = passwordController.text;
                                  Map<String, dynamic> requestBody = {
                                    'MobileNumber': mobileNumber,
                                    'Password': password,
                                  };
                                  String requestBodyJson = json.encode(requestBody);
                                  print(requestBodyJson);

                                  final response = await http.post(
                                    Uri.parse('http://10.0.2.2:8080/home/users'),
                                    headers: {
                                      'Content-Type': 'application/json',
                                    },

                                    body: requestBodyJson,

                                  );
                                  Map<String, dynamic> responseBody =
                                  json.decode(response.body);
                                  print(response.body);
                                  var name = responseBody['name'];
                                  var mobilenumber=responseBody['mobileNumber'];
                                  var status = responseBody['status'];
                                  print('Name: $name');
                                  print('MobileNumber: $mobilenumber');
                                  print('Status: $status');

                                  if (status == '200') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => companies(username:name,mobileNumber: mobilenumber,)),
                                    );
                                  }
                                  else {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) => AlertDialog(
                                        content:
                                        Text('Failed to login. Please try again.'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => Login()),
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
                                    child: Text("I don't have an account?"),
                                  ),
                                  Container(
                                    child: TextButton(
                                      child: Text('Register',style: TextStyle(fontWeight: FontWeight.normal,decoration: TextDecoration.underline),),
                                      onPressed: (){
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context)=>  Register())
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
