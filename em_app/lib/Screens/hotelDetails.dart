import 'package:flutter/material.dart';
import 'mapView.dart';

class HotelDetails extends StatefulWidget {
  var hotelData;

  HotelDetails({Key? key, required this.hotelData}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HotelDetailsState();
}

class _HotelDetailsState extends State<HotelDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MapViewScreen(
                              latitude: widget.hotelData?.latitude,
                              longitude: widget.hotelData?.longitude,
                            )));
              },
              icon: Icon(Icons.pin_drop))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              width: 200,
              // child: Image.network(
              //   widget.hotelData.image?.large as String,
              //   width: 50,
              //   height: 50,
              // ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(
                    widget.hotelData.title,
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.hotelData.description,
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
