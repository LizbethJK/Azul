import 'package:flutter/material.dart';
import 'package:frame_conf/Cuestionario.dart';
import 'package:frame_conf/clases/clasehobbies.dart';
import 'package:frame_conf/src/pages/tabs_page.dart';
import 'package:provider/single_child_widget.dart';

class Hobbies extends StatefulWidget {
  @override
  _HobbiesState createState() => _HobbiesState();
}

class _HobbiesState extends State<Hobbies> {
  @override
  bool selectAll = false;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 137, 166, 245),
                    Color.fromARGB(255, 137, 139, 245),
                  ],
                ),
                image: DecorationImage(
                  image: AssetImage("assets/images/fondo.png"),
                  fit: BoxFit.cover,
                )),
          ),
          title: Text(
            "Selecciona tus hobbies",
            style: TextStyle(
                fontFamily: 'Spicy Pumpkin',
                fontSize: 45,
                fontWeight: FontWeight.w600,
                color: Colors.black),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GridView.builder(
              shrinkWrap: true,
              itemBuilder: (ctx, index) {
                return prepareList(index);
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 0.1,
                childAspectRatio: 0.90,
              ),
              itemCount: Menu.length,
            ),
            RaisedButton(
              color: Color.fromARGB(255, 137, 166, 245),
              child: Text(
                'Continuar',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TabsPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget prepareList(int k) {
    return Card(
      child: Hero(
        tag: "text$k",
        child: Material(
          child: InkWell(
            onTap: () {},
            child: Container(
              color: Color.fromARGB(255, 137, 166, 245),
              height: 100,
              child: Column(
                children: [
                  Text(
                    Menu[k].nombre,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Center(
                      child: Image.asset(
                    'assets/images/' + Menu[k].imagen,
                    width: 53,
                  )),
                  Positioned(
                      child: Checkbox(
                    value: Menu[k].selected,
                    onChanged: (bool? value) {
                      setState(() {
                        if (!value!) selectAll = false;
                        Menu[k].selected = value;
                      });
                    },
                  )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
