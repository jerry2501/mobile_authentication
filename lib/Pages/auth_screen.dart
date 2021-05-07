import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:number_login/Pages/otp_screen.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  String number;
  bool _hasBeenPressed = false;
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: height * 0.04,
              child: IconButton(
                color: Colors.transparent,
                icon: Icon(
                  Icons.close,
                  color: Colors.black,
                ),
                onPressed: () {
                },
              )),
          Container(
            height: height,
            width: width,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.08),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Please enter your mobile number',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                        fontSize: 22),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'You\'ll receive a 4 digit code',
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    'to verify text.',
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(height: 30),
                  Form(
                    key: _formkey,
                    child: IntlPhoneField(
                      initialCountryCode: 'IN',
                      decoration: InputDecoration(
                        labelText: 'Mobile Number',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                      ),
                      onChanged: (phone) {
                        print(phone.completeNumber);
                        setState(() {
                          number = phone.completeNumber;
                        });
                      },
                      validator: (val) {
                        if (val.length < 10) {
                          return 'Please enter valid number';
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 25),
                  Container(
                    width: width,
                    child: RaisedButton(
                      child: Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: Text(
                          'CONTINUE',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 23,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      color: Theme.of(context).primaryColor,
                      onPressed: () {
                        if (_formkey.currentState.validate()) {
                          _formkey.currentState.save();
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => OtpScreen(number)));
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
