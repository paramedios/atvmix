import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;
import 'package:logger/logger.dart';
import 'package:fluttertoast/fluttertoast.dart';
class Vehicle{
  final String name;
  final String fuelType;
  final String vehicleModel;
  final String year;

  Vehicle({this.name, this.fuelType, this.vehicleModel, this.year});

  factory Vehicle.fromJson(Map<String, dynamic> json) {
    return Vehicle(
      name: json['title'],
      fuelType: json['author'],
      vehicleModel: json['author'],
      year: json['author'],
    );
  }
}

class VehicleListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Vehicle>>(
      future: _fetchVehicle(),
      
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Vehicle> data = snapshot.data;
             onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SecondRoute()));
          };
          return _vehiclesListView(data);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return CircularProgressIndicator();
      },
    );
  }

  Future<List<Vehicle>> _fetchVehicle() async {
    // your url with parameters
         var uri = new Uri.http("gist.githubusercontent.com", "JohannesMilke/d53fbbe9a1b7e7ca2645db13b995dc6f/raw/eace0e20f86cdde3352b2d92f699b6e9dedd8c70/books.json");

    ///// var uri = new Uri.http("your_url", "path", { "PhoneNo" : '123456778' });
    final response = await http.get(uri);



    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((car) => new Vehicle.fromJson(car)).toList();
    } else {
      throw Exception('Error');
    }
  }

  ListView _vehiclesListView(data) {

  final logger = new Logger();




    return ListView.builder(
        itemCount: data == null ? 0 : data.length,
        
        itemBuilder: (context, index) {
           
logger.w(data[index].name);


          return _tile(data[index].name, data[index].fuelType, Icons.directions_car);
        });
  }

  ListTile _tile(String title, String subtitle, IconData icon) => ListTile(
        title: Text(title ?? 'default value',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
            )), 
       onTap: () {
      Fluttertoast.showToast(
                msg: "This is toast",
              );
      
        //Go to the next screen with Navigator.push
      },
        subtitle: Text(subtitle ?? 'default value'),
        leading: Icon(
          icon,
          color: Colors.red,
        ),
      );
}
class SecondRoute extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}