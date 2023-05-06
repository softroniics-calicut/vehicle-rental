import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vehicleportaladmin/services.dart';
import 'con.dart';
import 'main menu.dart';

class Addrental extends StatefulWidget {
  const Addrental({Key? key}) : super(key: key);

  @override
  State<Addrental> createState() => _AddrentalState();
}

class _AddrentalState extends State<Addrental> {

  XFile? image;
  File? pickedImage;
  final ImagePicker picker = ImagePicker();

  var name = TextEditingController();
  var price = TextEditingController();
  var vehicle = TextEditingController();
  var gear = TextEditingController();
  var color = TextEditingController();
  var seat = TextEditingController();
  var fuel = TextEditingController();
  var location = TextEditingController();
  var RC = TextEditingController();
  var insurance = TextEditingController();
  var driving_licence = TextEditingController();
  var upload_photo = TextEditingController();

  addphoto(BuildContext context) async{
    SharedPreferences spref=await SharedPreferences.getInstance();
    var sp=spref.getString('regi_id');
    print(sp);
    if (pickedImage != null) {
      final data = await Services.postWithIamge(
          endPoint: 'add_rental.php.php',
          params: {
            "id":sp,
            "name": name.text,
            "price": price.text,
            "vehicle_type": vehicle.text,
            "type_of_gear": gear.text,
            "color_of_vehicle": color.text,
            "seats_of_vehicle": seat.text,
            "fuel_of_vehicle": fuel.text,
            "location": location.text,
            "RC": RC.text,
            "insurance": insurance.text,
            "driving_licence": driving_licence.text,
            "upload_photo": upload_photo.text,
          },
          image: pickedImage!,
          imageParameter: 'photo');

      if ((data as Map)['message'] == 'added') {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => Mainmenu1(),
          ),
        );
      } else {
        Fluttertoast.showToast(msg:' added');
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return Mainmenu1();
          },
        ));
      }
    } else {
      Fluttertoast.showToast(msg: 'Pick image ');
    }
  }


  // Future<void> getData() async {
  // var data = {
  //   "name": name.text,
  //   "price": price.text,
  // "vehicle_type": vehicle.text,
  //   "type_of_gear": gear.text,
  //   "color_of_vehicle": color.text,
  //   "seats_of_vehicle": seat.text,
  //   "fuel_of_vehicle": fuel.text,
  // "location": location.text,
  // "RC": RC.text,
  // "insurance": insurance.text,
  // "driving_licence": driving_licence.text,
  // "upload_photo": upload_photo.text,
  //
  // };
  // print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>$data');
  // var response = await post(Uri.parse('${Con.url}add rental.php'), body: data);
  // print(response.body);
  // if (response.statusCode == 200) {
  // var res = jsonDecode(response.body)["message"];
  // if (res == 'successfully added') {
  //  const snackBar = SnackBar(content: Text("successfully added"),
  //  );
  //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
  //  // Fluttertoast.showToast(msg: 'Successfully added...');
  // Navigator.push(context, MaterialPageRoute(builder: (context) {
  // return Mainmenu1();
  // }
  // ));
  // }
  // else {
  //    Fluttertoast.showToast(msg: 'Invalid ');
  // }
  // }
  //
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Rental Vehicles"),
centerTitle: true,

        actions: [
        ],
      ),
      body: Center(
      child: ListView(
        children:[
          Padding(padding: EdgeInsets.all(10),
            child:Card(
              child: TextField(
                controller: name,
                decoration: InputDecoration(
                    border:OutlineInputBorder(),
                    labelText: "vehicle name",hintText: "enter your vehicle name"
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
                    labelText: "Price",hintText: "enter price"
                ),
              ),
            ),
          ),
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
          // Expanded(child: Text('ADD rental vehicles', style:  TextStyle(height: 3.0, fontSize: 15.2, fontWeight: FontWeight.bold,))),

          Padding(padding: EdgeInsets.all(10),
            child:Card(
              child: TextField(
                controller: gear,
                decoration: InputDecoration(
                    border:OutlineInputBorder(),
                    labelText: "gear",hintText: "enter type of gear"
                ),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.all(10),
            child:Card(
              child: TextField(
                controller: color,
                decoration: InputDecoration(
                    border:OutlineInputBorder(),
                    labelText: "color",hintText: "enter color of vehicle"
                ),
              ),
            ),
          ),Padding(padding: EdgeInsets.all(10),
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
                controller: fuel,
                decoration: InputDecoration(
                    border:OutlineInputBorder(),
                    labelText: "fuel",hintText: "enter fuel"
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
          Padding(
            padding: const EdgeInsets.all(22.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Upload RC',
                  style: TextStyle(fontSize: 15),
                ),
                FloatingActionButton(
                  onPressed: () async {
                    File? temp = await Services.pickImage(context);
                    setState(() {
                      pickedImage = temp;
                    });
                    print(pickedImage!.path);
                  },
                  child: Icon(Icons.camera_alt),
                ),
                // image == null ? Text('no image') : Image.file(image!),
              ],
            ),
          ),


          Padding(
            padding: const EdgeInsets.all(22.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Upload Insurance',
                  style: TextStyle(fontSize: 15),
                ),
                FloatingActionButton(
                  onPressed: () async {
                    File? temp = await Services.pickImage(context);
                    setState(() {
                      pickedImage = temp;
                    });
                    print(pickedImage!.path);
                  },
                  child: Icon(Icons.camera_alt),
                ),
                // image == null ? Text('no image') : Image.file(image!),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(22.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Upload driving licence',
                  style: TextStyle(fontSize: 15),
                ),
                FloatingActionButton(
                  onPressed: () async {
                    File? temp = await Services.pickImage(context);
                    setState(() {
                      pickedImage = temp;
                    });
                    print(pickedImage!.path);
                  },
                  child: Icon(Icons.camera_alt),
                ),
                // image == null ? Text('no image') : Image.file(image!),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(22.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Upload photo',
                  style: TextStyle(fontSize: 15),
                ),
                FloatingActionButton(
                  onPressed: () async {
                    File? temp = await Services.pickImage(context);
                    setState(() {
                      pickedImage = temp;
                    });
                    print(pickedImage!.path);
                  },
                  child: Icon(Icons.camera_alt),
                ),
                // image == null ? Text('no image') : Image.file(image!),
              ],
            ),
          ),
          ElevatedButton(onPressed: (){
            addphoto(context);
          }, child: Text("ADD"))
        ],
      ),
      ),

    );
  }
}
