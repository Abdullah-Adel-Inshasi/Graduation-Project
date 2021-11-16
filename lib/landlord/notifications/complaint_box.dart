import 'package:flutter/material.dart';
import 'package:home_explorer/models/apartment.dart';
import 'package:home_explorer/models/complaint_model.dart';

class ComplaintBox extends StatelessWidget {
  const ComplaintBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9FAFF),
      body: ListView.builder(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        itemCount: complaints.length,
        itemBuilder: (BuildContext context, int index) {
          Complaint complaint = complaints[index];
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 6.0,
                    spreadRadius: 3)
              ],
            ),
            margin: EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 8,
            ),
            child: Row(
              children: [
                ClipRRect(
                  child: Image.asset(
                    home[0].coverImg,
                    width: 140,
                    height: 140,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('اسم الشخص : ${complaint.user}'),
                    SizedBox(height: 8),
                    Text(
                        'اسم الشقة : ${complaint.apartment.name ?? 'unknown'}'),
                    SizedBox(height: 8),
                    Text('الشكوى : ${complaint.text}')
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

List<Complaint> complaints = [
  Complaint(user: 'ahmad', apartment: apartments[0], text: 'bad ac'),
  Complaint(user: 'khalid', apartment: apartments[1], text: 'bad area'),
  Complaint(user: 'yousef', apartment: apartments[2], text: 'not working'),
  Complaint(user: 'yaza', apartment: apartments[3], text: 'no wi-fi')
];
