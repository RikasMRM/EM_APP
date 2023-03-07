import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:em_app/response.dart';

import 'hotelDetails.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future getHotelData() async {
    Uri getHotelURL = Uri.https(
        'dl.dropboxusercontent.com', '/s/6nt7fkdt7ck0lue/hotels.json');
    try {
      http.Response response = await http.get(getHotelURL);
      Object decoded = HotelResponse.fromJson(jsonDecode(response.body));
      print(decoded);
      return decoded;
    } catch (e) {
      print(e);
      throw (e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text(
            snapshot.error.toString(),
          );
        } else if (snapshot.hasData) {
          return handleSnapShot(snapshot.data);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
      stream: getHotelData().asStream(),
    );
  }

  Widget handleSnapShot(Object? data) {
    var resData = data as HotelResponse;
    var hotelData = resData.data;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "List View",
        ),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height - 150,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: hotelData?.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HotelDetails(
                                      hotelData: hotelData![index])));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 30,
                                height: 30,
                                // child: FittedBox(
                                //   fit: BoxFit.contain,
                                //   child: Image.network(
                                //     hotelData![index].image?.medium as String,
                                //   ),
                                // ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      hotelData![index].title as String,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      hotelData![index].address as String,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
