import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'switsh_screen.dart';
class Login_Screen extends StatelessWidget {
  //const Login_Screen({Key? key}) : super(key: key);

  TextEditingController usernameController=TextEditingController();
  TextEditingController PasswordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
         //begin: Alignment.topRight,
        //  end: Alignment.bottomLeft,
          colors: [
            Colors.blue,
            Colors.red,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body:_Page() ,
      ),
    );
  }
  Widget _Page(){
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _icon(),
              SizedBox(height: 50,),
              _inputFild("User Name",usernameController),
              SizedBox(height: 20,),
              _inputFild("Password",PasswordController),
              SizedBox(height: 50,),
              _Loginbtn(),
              SizedBox(height: 20,),
              _extraText()
            ],
          ),
        ),
      ),
    );
  }
  Widget _icon(){
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white,width: 2),
        shape: BoxShape.circle),
      child: Icon(Icons.person,color: Colors.white,size: 120,),
    );
  }
  Widget _inputFild(String hintText,TextEditingController controller,){
   var botder =OutlineInputBorder(
     borderRadius: BorderRadius.circular(18),
     borderSide: BorderSide(color: Colors.white),
   );

    return TextField(
      style: TextStyle(
        color: Colors.white,),
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.white,
        ),
        enabledBorder: botder,
        focusedBorder:botder,
      ),
    );
  }
  Widget _Loginbtn(){
    return ElevatedButton(onPressed: (){
      Get.off(Switsh_Screen());
    },
      child:SizedBox(width: double.infinity,
        child: Text("sign in",textAlign: TextAlign.center,
        style:TextStyle(
          fontSize: 20,
        ),
        )
      ),
      style: ElevatedButton.styleFrom(
        shape: StadiumBorder(),
        primary: Color.fromRGBO(255,228,226,226),
        onPrimary: Colors.blue,
        padding: EdgeInsets.symmetric(vertical: 16),
      ),
    );
  }
  Widget _extraText(){
    return Text('Can,t access to your account?',textAlign: TextAlign.center,style: TextStyle(
      fontSize: 16,
      color: Colors.white,

    ),);
  }
}
