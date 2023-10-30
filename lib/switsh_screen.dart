import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/http_screen.dart';
import 'package:untitled/post_screen.dart';
class Switsh_Screen extends StatelessWidget {
  const Switsh_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container (
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: (){
            Get.to(HttpPost());
          }, child: Text('go to post Screen')),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: (){Get.to(HttpScreen());}, child: Text('go to get Screen')),
        ],
      ),
    );
  }
}
