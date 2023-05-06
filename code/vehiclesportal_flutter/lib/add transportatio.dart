import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:vehicleportaladmin/utils/file_upload.dart';

import 'add rental.dart';
import 'con.dart';
import 'main menu-user.dart';
import 'main menu.dart';

class Addtrans extends StatefulWidget {
  const Addtrans({Key? key}) : super(key: key);

  @override
  State<Addtrans> createState() => _AddtransState();
}

class _AddtransState extends State<Addtrans> {



  var vehicle = TextEditingController();
  var location = TextEditingController();
  var seat =TextEditingController();
  var price = TextEditingController();
  var RC = TextEditingController();
  var insurance = TextEditingController();
  var driving_licence = TextEditingController();
  var upload_photo = TextEditingController();

  Future<void> getData() async {
    var data = {
      "vehicle": vehicle.text,
      "number_of_seats":seat.text,
      "location": location.text,
      "RC": RC.text,
      "price": price.text,
      "insurance": insurance.text,
      "dl": driving_licence.text,
      "upload_photo": upload_photo.text,

    };
    print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>$data');
    // var response = await post(Uri.parse('${Con.url}add_transportation.php'), body: data);
    // print(response.body);
    // if (response.statusCode == 200) {
    //   var res = jsonDecode(response.body)["message"];
    //   if (res == 'added') {
    //     const snackBar = SnackBar(content: Text("successfully"),
    //     );
    //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
    //     // Fluttertoast.showToast(msg: 'Successfully added...');
    //     Navigator.push(context, MaterialPageRoute(builder: (context) {
    //       return Mainmenu1();
    //     }
    //     ));
    //   }
    //   else {
    //     Fluttertoast.showToast(msg: 'Invalid ');
    //   }
    // }
    // addTranspotation(imageFile, rc, insurance, driving, photo, url, params)
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Transportation Vehicles"),
        centerTitle: true,

      ),
      body: Center(
        child:ListView(

          children:[

            Padding(padding: EdgeInsets.all(10),
              child:Card(
                child: TextField(
                  controller: vehicle,
                  decoration: InputDecoration(
                      border:OutlineInputBorder(),
                      labelText: "Type of vehicle",hintText: "enter your vehicle type"
                  ),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(10),
              child:Card(
                child: TextField(
                  controller: seat,
                  decoration: InputDecoration(
                      border:OutlineInputBorder(),
                      labelText: "seat",hintText: "enter number of seats"
                  ),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(10),
              child:Card(
                child: TextField(
                  controller: price,
                  decoration: InputDecoration(
                      border:OutlineInputBorder(),
                      labelText: "price",hintText: "price"
                  ),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(10),
              child:Card(
                child: TextField(
                  controller: location,
                  decoration: InputDecoration(
                      border:OutlineInputBorder(),
                      labelText: "Location",hintText: "enter your Location"
                  ),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(10),
              child:Card(
                child: TextField(
                  controller: RC,
                  decoration: InputDecoration(
                      border:OutlineInputBorder(),
                      labelText: "RC",hintText: "upload RC :"
                  ),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(10),
              child:Card(
                child: TextField(
                  controller: insurance,
                  decoration: InputDecoration(
                      border:OutlineInputBorder(),
                      labelText: "Insurance",hintText: "Upload Insurance :"
                  ),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(10),
              child:Card(
                child: TextField(
                  controller:driving_licence ,
                  decoration: InputDecoration(
                      border:OutlineInputBorder(),
                      labelText: "driving licencd",hintText: "upload driving licence :"
                  ),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(10),
              child:Card(
                child: TextField(
                  controller: upload_photo,
                  decoration: InputDecoration(
                      border:OutlineInputBorder(),
                      labelText: "Upload photo",hintText: "Upload photo :"
                  ),
                ),
              ),
            ),
            ElevatedButton(onPressed: (){
              getData();
            }, child: Text("ADD"))

          ],
        ),
      ),

    );
  }
}
