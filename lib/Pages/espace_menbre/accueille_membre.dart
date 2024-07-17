import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';


class H extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Accueil'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Accueil'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profil'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Paramètres'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Option_select(Text('data')),
                    Option_select(Text('data')),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blueGrey
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  child: indiv(child: Text(''),),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }



  Option_select(Widget child){

    return Container(
      height: 130,
      width: 130,
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: child,
    );
  }

}









class indiv extends StatefulWidget {
  final Widget child ;
  const indiv({super.key, required this.child});

  @override
  State<indiv> createState() => _indivState();
}

class _indivState extends State<indiv> {
  bool view = false  ;
  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [FadeEffect(), ScaleEffect()],
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.folder_zip), onPressed: () {
            setState(() {
              view =! view ;
            }); },),
          Expanded(
            child: AnimatedContainer(
              margin: EdgeInsets.symmetric(vertical: 5),
              duration: Duration(milliseconds: 500),
              decoration: BoxDecoration(
                  color:view ? Colors.purple.shade100 : Colors.blue
                  ,borderRadius: BorderRadius.circular(20)),

              height: view ?  200 : 50,
              child: widget.child,

            ),
          ),
        ],
      ),
    ).flip(duration: Duration(seconds: 1)) ;
  }
}

