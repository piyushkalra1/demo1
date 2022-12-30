

import 'dart:convert';
import 'dart:async';

import 'package:demo1/model/DataModel.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:http/http.dart';
import 'package:material_segmented_control/material_segmented_control.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'model/CategoryList.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}




class _HomeState extends State<Home> {
  String title= '';
  void login ( String user_id) async{
    try{
      Response response =await http.post(Uri.parse('https://alpha.mighzalalarab.com/woocommerce-api/Api/getCartListItem'),
      body:{
       
        'user_id':user_id,
      } );
      if(response.statusCode==200){
        var data = jsonDecode(response.body.toString());
            setState(() {
              title=  data['status'].toString();
            });
        print(data['category_id'].toString());
        print(data);
        print('account created');
      }else
        {
          print("dalid");
        }
    }catch(e){
      print(e.toString());
    }
  }

  int _currentSelection = 0;
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<int> _counter;

  Future<void> _incrementCounter() async {
    final SharedPreferences prefs = await _prefs;
    final int counter = (prefs.getInt('counter') ?? 0) + 1;

    setState(() {
      _counter = prefs.setInt('counter', counter).then((bool success) {
        return counter;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _counter = _prefs.then((SharedPreferences prefs) {
      return prefs.getInt('counter') ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'cart',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.man),
            label: 'profile',
            backgroundColor: Colors.purple,
          ),

        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),

      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(

                children: const [
                 
                  Text("Cart",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 30),),
                ],
              ),
              Row(
                children:  [
                  Text(title),
                  Text("Have Coupon? Click here",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.brown,fontSize: 17),),
                ],
              ),
              Card(
                child: Container(
                    height: MediaQuery.of(context).size.height/4,
                    width:MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height/3,
                          width:MediaQuery.of(context).size.width/4,
                          child: const Image(
                            image: AssetImage('images/1.jpg'),
                          ),
                        ),

                        Column(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:  [
                            SizedBox(height: 60,),

                            Text('Color : Silver',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300),),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: _incrementCounter,
                                  tooltip: 'Increment',
                                  icon:  Icon(Icons.add),
                                ),
                              ],
                            ),
                            FutureBuilder<int>(
                                future: _counter,
                                builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                                  switch (snapshot.connectionState) {
                                    case ConnectionState.waiting:
                                      return const CircularProgressIndicator();
                                    default:
                                      if (snapshot.hasError) {
                                        return Text('Error: ${snapshot.error}',style: TextStyle(color: Colors.red),);
                                      } else {
                                        return Column(
                                          children: [
                                            Text(
                                              '${snapshot.data} time${snapshot.data == 1 ? '' : 's'}.'
                                                  ,style: TextStyle(color: Colors.black),
                                            ),
                                            Text(
                                              '16*(${snapshot.data}${snapshot.data == 1? '' : 's'})'
                                              ,style: TextStyle(color: Colors.red),
                                            ),



                                          ],
                                        );
                                      }
                                  }
                                }),

                          ],
                        ),

                      ],
                    )
                ),
              ),


              const Spacer(),
              // Text(jsonDecode(CategoryList())),


              Container(
                width: MediaQuery.of(context).size.width,
                height: 2,
                color:Colors.black ,
              ),
              MaterialSegmentedControl(
                children: _children,
                selectionIndex: _currentSelection,
                borderColor: Colors.grey,
                selectedColor: Colors.redAccent,
                unselectedColor: Colors.white,
                borderRadius: 6.0,
                disabledChildren: _disabledIndices,
                verticalOffset: 8.0,
                onSegmentChosen: (index) {
                  setState(() {
                    _currentSelection = index;
                  });
                },
              ),
              const SizedBox(
                height: 18,
              ),
              TextButton(onPressed: (){
               login("9d81595a31b09604");

               // print(http.Response.body.toString());
              }, child: Text("hi")),

            ],
          ),
        ),
      ),
    );

  }
}

Map<int, Widget> _children = {
  0: const Text('Checkout '),
  1: const Text('Total'),
  2: const Text('18 kwd'),
};

List<int> _disabledIndices = [];


