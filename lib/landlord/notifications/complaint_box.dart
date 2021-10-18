import 'package:flutter/material.dart';
import 'package:home_explorer/models/apartment.dart';
import 'package:home_explorer/models/complaint_model.dart';

class ComplaintBox extends StatelessWidget {
  const ComplaintBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 26),
      itemCount: complaints.length,
      itemBuilder: (BuildContext context, int index) {
        Complaint complaint = complaints[index];
        return Container(
          decoration:
              BoxDecoration(border: Border.all(color: Colors.black, width: 1)),
          margin: EdgeInsets.symmetric(vertical: 8),
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
             Text('اسم المستخدم : ${complaint.user}'),
              SizedBox(height: 8),
              Text('رقم الشقة : ${complaint.apartment.name ?? 'unknown'}'),
              SizedBox(height: 8),
              Text('الشكوى : ${complaint.text}')
            ],
          ),
        );
      },
    );
  }
}

List<Complaint> complaints = [
  Complaint(user: 'ahmad', apartment: apartments[0], text: 'bad ac'),
  Complaint(user: 'khalid', apartment: apartments[1], text: 'bad area'),
  Complaint(user: 'yousef', apartment: apartments[2], text: 'not working'),
  Complaint(user: 'yaza', apartment: apartments[3], text: 'no wi-fi')
];
