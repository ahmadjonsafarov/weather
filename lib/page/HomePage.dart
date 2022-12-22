import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart' as url_louncher;
import 'package:url_launcher/url_launcher_string.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}
dynamic data;
bool isLoading=true;
class _HomePageState extends State<HomePage> {
  Future<void> getInformation() async {
    isLoading=true;
    setState(() {});
    final url=Uri.parse('http://universities.hipolabs.com/search?country=Canada');
    final res=await http.get(url);
    data=jsonDecode(res.body);
    isLoading=false;
    setState(() {});
  }
  @override
  void initState() {
    getInformation();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Uzbekistan University"),
      ),
      body: isLoading?Center(child: CircularProgressIndicator()):ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 24),
        itemCount: 18,
          itemBuilder: (context,index){
          return Container(
            margin: EdgeInsets.only(top: 16),
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blue
            ),
            child: Column(
              children:[
                Text(
                data[index]['name'],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
                SizedBox(height: 3,),
                TextButton(onPressed: () async {
                  final launcher=Uri.parse(data[index]['web_pages']?[0]?? "");
                  await url_louncher.launchUrl(launcher,mode: LaunchMode.externalNonBrowserApplication);
                }, child: Text(data[index]["web_pages"]?[0] ?? '',style: const TextStyle(color: Colors.white),)),
                SizedBox(height: 3,),
                TextButton(onPressed: () async {
                  final launcher=Uri(scheme: 'tel',path: '+99899999999999');
                  await url_louncher.launchUrl(launcher);
                }, child: const Text("Tel",style: TextStyle(color: Colors.white),)),
                SizedBox(height: 3,),
                TextButton(onPressed: () async {
                  final launcher=Uri(scheme: 'tel',path: '+99899999999999');
                  await url_louncher.launchUrl(launcher);
                }, child: const Text("sms",style: TextStyle(color: Colors.white),)),
              ]
            ),
          );
      }),
    );
  }
}

