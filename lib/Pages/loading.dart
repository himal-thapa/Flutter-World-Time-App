import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  void setUpWorldTime() async{
    WorldTime instance = WorldTime(location: 'Kathmandu', flag: 'nepal.png', url: 'Asia/Kathmandu');
    await instance.getTime();
//    print(instance.time);
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'isDaytime': instance.isDaytime,
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setUpWorldTime();

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body:
      Center(
        child: SpinKitRotatingCircle(
        color: Colors.white,
        size: 50.0,
      ),

      ),
    );
  }
}
