import 'package:flutter/material.dart';
import 'package:policyalliance_mobile_app/main.dart';

import 'Registration.dart';
import 'api/customer-api.dart';
import 'modal/customer-modal.dart';

class Customers extends StatefulWidget {
  const Customers({Key? key}) : super(key: key);

  @override
  State<Customers> createState() => _CustomersState();

}

class _CustomersState extends State<Customers> {
  final customerDetails = Allcustomers();
  List<Customer> customerList = [];
  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    Empty2 empty = await customerDetails.getCustomer();
    setState(() {
      customerList = empty.customer;
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Color(0xFFF4F9FF),
          child: Column(
            children: [
              Expanded(child: SingleChildScrollView(
                child:
                Column(
                  children: [
                    Container(
                        child: Container(
                          color: Color(0xFFF4F9FF),
                          width: double.infinity,
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                width: 350,
                                height: 40,
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
                                    icon: Icon(Icons.search),
                                    hintText: 'Search your company',
                                  ),
                                ),
                              ),
                              Icon(Icons.filter_alt_outlined,
                                size: 30,
                                color: Color(0xff6B6B6B),)
                            ],
                          ),
                        ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFFF4F9FF),
                        boxShadow: [
                          BoxShadow(
                            color:Colors.grey,
                            blurRadius: 3.0,
                            offset: Offset(0.0, 0.0),
                          )
                        ],
                      ),
                      margin: EdgeInsets.only(top: 10),
                      child: SizedBox(
                          height: 78 * customerList.length.toDouble() ,
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: customerList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                height: 92,

                                child: Column(
                                  children: [
                                    Container(
                                      height:25,
                                      color: Color(0xFFD3E9FF),
                                      margin: EdgeInsets.only(top: 10),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(left: 7,top: 5),
                                            height: 78,
                                            child: Text('ID: '+customerList[index].paymentId.toString(),style: TextStyle(fontSize: 14,color: Color(0xFF07539D)),),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(right: 9,top: 5),
                                            child: Text('StartDate: '+customerList[index].policyStartDate,style: TextStyle(fontSize: 14,color: Color(0xFF07539D))),
                                          ),

                                        ],
                                      ),
                                    ),
                                    Container(
                                      color:Colors.white,
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(top: 7,left: 7),
                                             child: Text(customerList[index].name,style: TextStyle(color: Colors.black),),
                                         ),
                                      Container(
                                        margin: EdgeInsets.only(top: 7,right: 9),
                                        child: Text(customerList[index].companyName,style: TextStyle(color: Colors.black)),
                                      )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      color:Colors.white,
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(top: 11,left: 7,bottom: 7),
                                            child: Text('EndDate: '+customerList[index].policyEndDate),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(top: 11,right: 9,bottom: 7),
                                            child: Text(customerList[index].premiumAmount,style: TextStyle(color: Colors.black)),
                                          )
                                        ],
                                      ),
                                    )

                                  ],
                                ),
                              );
                            },
                          )

                      ),
                    )

                  ],
                ),
              ),
              )

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
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 17,top: 3),
                    child: IconButton(
                      icon: Icon(Icons.home_outlined,size:50,color: Colors.white,),
                      onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context)=>  PolicyAlliance())
                        );
                      },
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  Container(
                    width: 59,
                    height: 49,
                    margin: EdgeInsets.only(top:10,left: 95),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                  Container(
                    width: 59,
                    height: 49,
                    margin: EdgeInsets.only(left: 90),
                    child: IconButton(
                      icon: Icon(Icons.table_chart_outlined,size:50,color: Color(0xFF07539D),),
                      onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context)=>  Customers())
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
