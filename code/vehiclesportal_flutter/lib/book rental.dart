import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Bokrent extends StatefulWidget {
  const Bokrent({Key? key}) : super(key: key);

  @override
  State<Bokrent> createState() => _BokrentState();
}

class _BokrentState extends State<Bokrent> {
  final List=[
    'Aadhar','Voter ID','Driving licence','Passport'];
  final List1=[
    'Car','Bike',];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BOOKING RENTAL DETAILS"),
        centerTitle: true,
      ),
      body:Center(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
              child: Container(
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    labelText: " Name",
                    hintText: " Name",
                  ),
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Name is required';
                    }
                    return null;
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
              child: Container(
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    labelText: "Phone number",
                    hintText: "Phone number",
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Phone number is required";
                    }
                    if (value.length != 10) {
                      return "Please enter a valid 10-digit phone number";
                    }
                    return null;
                  },
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
              child: Container(
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    labelText: "Address",
                    hintText: "Address",
                  ),
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Address is required';
                    }
                    return null;
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),              child: Container(
                width: 100,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    labelText: "Starts Date",
                    hintText: "Starts date",
                  ),
                  keyboardType: TextInputType.datetime,
                  onTap: () async {
                    DateTime? datepick = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2025),
                    );
                    if (datepick != null) {
                      print('Date starts: ${datepick.year}-${datepick.month}-${datepick.day}');
                    }
                  },
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),              child: Container(
                width: 100,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    labelText: "End Date",
                    hintText: "End Date",
                  ),
                  keyboardType: TextInputType.datetime,
                  onTap: () async {
                    DateTime? datepick = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2025),
                    );
                    if (datepick != null) {
                      print('End date: ${datepick.year}-${datepick.month}-${datepick.day}');
                    }
                  },
                ),
              ),
            ),


            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),              child:DropdownButtonFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    )
                ),


                hint: Text('Select Vehicle'),
                items:List1.map((e) {
                  return DropdownMenuItem(
                      value: e,
                      child:Text(e));
                }).toList(), onChanged: (value){}),


            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),              child:DropdownButtonFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      )
                  ),


                  hint: Text('Select Proof'),
                  items:List.map((e) {
                    return DropdownMenuItem(
                        value: e,
                        child:Text(e));
                  }).toList(), onChanged: (value){}),


            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),              child: Container(
                width: 100,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    labelText:"Upload file",hintText: "Upload file",
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(onPressed: (){

              }, child: Text("Submit"))
              ),
          ],
        ),
      ),
    );
  }
}