import 'package:beyondwallet/utils/colors.dart';
import 'package:flutter/material.dart';


class SuccessBooking extends StatefulWidget {
  @override
  _SuccessBookingState createState() => _SuccessBookingState();
}

class _SuccessBookingState extends State<SuccessBooking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 50,),
            anim(),
            pad(),
            successText(),
            pad(),
            profile(),
            pad(),
            dateTime(),
            pad(),
            homeButton()
          ],
        ),
      ),
    );
  }

  Widget anim() {
    return Container(
      alignment: Alignment.center,
      child: Image(image: AssetImage("assets/check-circle.gif"), height: 60,color: kPrimaryColor,),
    );
  }

  Widget successText() {
    return Container(
      width: 250,
      child: Column(
        children: <Widget>[
          Text("Success!", style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
          Text(
            "Thank you for choosing our service and trust our host to handle your workplace need",
            style:TextStyle(
                fontSize: 20,
                color: Colors.grey
            ),)

        ],
      ),
    );
  }
  Widget pad() {
    return SizedBox(
      height: 20,
    );
  }
  Widget profile() {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: GestureDetector(
              child: CircleAvatar(
                // photo de profile
                backgroundImage: AssetImage("assets/person.png"),
                minRadius: 30,
                maxRadius: 60,
              ),
            ),
          ),
          Container(
            child: Text("Apurv Jha",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),),
          ),
          Container(
            child: Text("FundaSapces Hsr Layout",style: TextStyle(fontSize: 15,color: Colors.grey),),
          )
        ],
      ),
    );
  }
  Widget dateTime() {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            "Date & Time",
            style: TextStyle(fontSize: 15, color: Colors.grey),
          ),
          Text(
            "Monday, October 24",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "10:00 AM - 11:00 AM",
            style: TextStyle(fontSize: 15,),
          )
        ],
      ),
    );
  }
  Widget homeButton() {
    return Container(
      child: FlatButton(
        onPressed: () {
//          Navigator.push(context,
//            MaterialPageRoute(builder: (context) =>HomePage()));
            },
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),color: Color(0xffd81b60),),
          child: Container(
            constraints: BoxConstraints(minHeight: 50.0),
            alignment: Alignment.center,
            child: Text(
              "Go To Home",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}