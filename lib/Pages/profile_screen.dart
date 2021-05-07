import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Profile { Shipper, Transporter }

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Profile _profile = Profile.Shipper;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Please select your profile',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              SizedBox(height: 25),
              _buildRadioListTile(
                  width, context, Profile.Shipper, FontAwesomeIcons.ship),
              SizedBox(height: 15),
              _buildRadioListTile(width, context, Profile.Transporter,
                  FontAwesomeIcons.truck),
              SizedBox(height: 25),
              Container(
                width: width,
                child: FlatButton(
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
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildRadioListTile(
      double width, BuildContext context, Profile profile, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
        child: RadioListTile(
            autofocus: (profile == Profile.Shipper) ?? true,
            title: Row(
              children: [
                FaIcon(
                  icon,
                  color: Theme.of(context).primaryColor,
                  size: 50,
                ),
                SizedBox(width: width * 0.03),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text((profile == Profile.Shipper) ? 'Shipper' : 'Transporter',
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).primaryColor,
                      )),
                  SizedBox(height: 5),
                  Container(
                    width: width * 0.45,
                    child: Text(
                      'Lorem Ipsum is a paragraph used to put a duplicate data in place of Paragraph',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ]),
              ],
            ),
            value: profile,
            groupValue: _profile,
            onChanged: (val) {
              setState(() {
                _profile = val;
              });
            }),
      ),
    );
  }
}
