import 'package:flutter/material.dart';
import 'package:weather/page/HomePage.dart';

class Add_Country extends StatefulWidget {

  const Add_Country({Key? key}) : super(key: key);

  @override
  State<Add_Country> createState() => _Add_CountryState();
}

class _Add_CountryState extends State<Add_Country> {
  TextEditingController textEditingController=TextEditingController();
  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Country"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: TextFormField(
            controller: textEditingController,
            decoration: InputDecoration(
              labelText: "Country",

            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){
        return HomePage(country: textEditingController.text,

        );
      }), (route) => false);
          child:Icon(Icons.done,color: Colors.white,);
          },

      ),
    );
  }
}

