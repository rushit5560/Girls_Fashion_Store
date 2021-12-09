import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:girls_fashion_store/common/app_color.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool _availability = false;
  bool _notification = false;
  bool _sendSMS = false;
  bool _nightMode = false;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Settings',
          style: TextStyle(color: Colors.black),
        ),
      ),

      body: Column(
        children: [
          spacer(10),
          availability(),
          spacer(10),
          notification(),
          spacer(10),
          sendSMS(),
          spacer(10),
          nightMode(),
          spacer(10),
        ],
      ),
    );
  }

  Widget spacer(double value) {
    return SizedBox(height: value);
  }

  Widget availability() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  'Availability',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
              Transform.scale(
                scale: 0.7,
                child: CupertinoSwitch(
                  activeColor: AppColor.kPinkColor,
                  trackColor: Colors.grey,
                  value: _availability,
                  onChanged: (value) {
                    setState(() {
                      _availability = value;
                      print('Availability : $_availability');
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget notification() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  'Notification',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
              Transform.scale(
                scale: 0.7,
                child: CupertinoSwitch(
                  activeColor: AppColor.kPinkColor,
                  trackColor: Colors.grey,
                  value: _notification,
                  onChanged: (value) {
                    setState(() {
                      _notification = value;
                      print('Notification : $_notification');
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget sendSMS() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  'Send SMS',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
              Transform.scale(
                scale: 0.7,
                child: CupertinoSwitch(
                  activeColor: AppColor.kPinkColor,
                  trackColor: Colors.grey,
                  value: _sendSMS,
                  onChanged: (value) {
                    setState(() {
                      _sendSMS = value;
                      print('Send SMS : $_sendSMS');
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget nightMode() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  'Night Mode',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
              Transform.scale(
                scale: 0.7,
                child: CupertinoSwitch(
                  activeColor: AppColor.kPinkColor,
                  trackColor: Colors.grey,
                  value: _nightMode,
                  onChanged: (value) {
                    setState(() {
                      _nightMode = value;
                      print('Night Mode : $_nightMode');
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
