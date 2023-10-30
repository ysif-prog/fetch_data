import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'dart:convert'as convert;


class HttpPost extends StatefulWidget {
  HttpPost({Key? key}) : super(key: key);

  @override
  State<HttpPost> createState() => _HttpPostState();
}

class _HttpPostState extends State<HttpPost> {
  Future addPost(String name,String username,String email)async{
    var url =("https://jsonplaceholder.typicode.com/users");
    var res =await http.post(url as Uri,body:{
      "name":'',
      "username":'',
      "email":'',
    });
    var resBody=convert.jsonDecode(res.body);
    return resBody;
  }

  // Future getPost()async{
  TextEditingController nameController=TextEditingController();

  TextEditingController usernameController=TextEditingController();

  TextEditingController emailController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Screen'),
        centerTitle: true,
      ),
      body:Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter name",
              ),
              controller: usernameController,
            ),
            SizedBox(height: 10,),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter username",
              ),
              controller: nameController,
            ),
            SizedBox(height: 10,),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter email",
              ),
              controller: emailController,
            ),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: ()async{
            setState(() {
              String name=nameController.text;
              String username=usernameController.text;
              String email=emailController.text;
              addPost(name, username, email);
              });
            }, child: Text("Submit")),
            SizedBox(height: 30,),
            // FutureBuilder(
            //   future: getPost(),
            //   builder: (BuildContext context, AsyncSnapshot snapshot) {
            //     if(snapshot.hasData){
            //       return ListView.separated(
            //         itemBuilder:(context,i){
            //           return Column(
            //             children:[
            //               Text(snapshot.data[i]['name'],style: TextStyle(color: Colors.red,fontSize: 30.0),),
            //               Divider(color: Colors.grey,),
            //               Text(snapshot.data[i]['username'],style: TextStyle(color: Colors.blue,fontSize: 30.0)),
            //               Divider(color: Colors.grey,),
            //               Text(snapshot.data[i]['email'],style: TextStyle(color: Colors.grey,fontSize: 30.0)),
            //               Divider(color: Colors.grey,),
            //               // Text(snapshot.data[i]['address']),
            //               // Divider(color: Colors.grey,),
            //               // Text(snapshot.data[i]["geo"]),
            //               //Image.network(snapshot.data[i]['url'])
            //             ],
            //           );
            //         } ,
            //         separatorBuilder:(context,i){
            //           return Divider(color: Colors.black,height: 30.0,endIndent: 30,indent: 30, thickness: 2,);
            //         },
            //         itemCount: snapshot.data.length,
            //       );
            //     }
            //     return Center(child: CircularProgressIndicator());
            //   },
            // ),

          ],
        ),
      ),
    );
  }
}
