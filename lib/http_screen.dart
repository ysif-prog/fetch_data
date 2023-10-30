import 'dart:convert'as convert;
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class HttpScreen extends StatefulWidget {
  @override
  State<HttpScreen> createState() => _HttpScreenState();
}

class _HttpScreenState extends State<HttpScreen> {
  Future getPost()async{
    final url =("https://jsonplaceholder.typicode.com/users");
    final res =await http.get(Uri.parse(url));
    final resBody=convert.jsonDecode(res.body);
    return resBody;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('http.dart Users'),
        leading: Icon(Icons.person),
        backgroundColor: Colors.white10,
      ),
      body: FutureBuilder(
         future: getPost(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
        if(snapshot.hasData){
          return ListView.separated(
              itemBuilder:(context,i){
               return Column(
                 children:[
                   Text(snapshot.data[i]['name'],style: TextStyle(color: Colors.red,fontSize: 30.0),),
                   Divider(color: Colors.grey,),
                   Text(snapshot.data[i]['username'],style: TextStyle(color: Colors.blue,fontSize: 30.0)),
                   Divider(color: Colors.grey,),
                   Text(snapshot.data[i]['email'],style: TextStyle(color: Colors.grey,fontSize: 30.0)),
                   Divider(color: Colors.grey,),
                   // Text(snapshot.data[i]['address']),
                   // Divider(color: Colors.grey,),
                   // Text(snapshot.data[i]["geo"]),
                  //Image.network(snapshot.data[i]['url'])
                 ],
               );
              } ,
              separatorBuilder:(context,i){
             return Divider(color: Colors.black,height: 30.0,endIndent: 30,indent: 30, thickness: 2,);
                },
              itemCount: snapshot.data.length,
          );
        }
        return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
  // buildCard(Pho){
  //
  // }
}
//     .builder(itemCount:19,itemBuilder: (context,i){
// return Container(child: Text(snapshot.data[i]['title']),);
// })