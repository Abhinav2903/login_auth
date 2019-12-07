import 'package:flutter/material.dart';
import 'auth.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  String text1;
  
  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
          obscureText: false,
          style: style,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "Email",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
        );
        final passwordField = TextFormField(
          obscureText: true,
          style: style,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "Password",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
        );
        final loginButon =RaisedButton(
      onPressed: () => authService.googleSignIn().then((credentials) {
        setState(() {
        text1 = credentials.displayName;  
        });
        
      }),
     textColor: Colors.white,
     padding: const EdgeInsets.all(0.0),
     shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
     child: Container(
       decoration: const BoxDecoration(
         gradient: LinearGradient(
           colors: <Color>[
             Colors.indigoAccent,
             Colors.lightBlueAccent,
             //Colors.lightGreenAccent,
           ],
         ),
         borderRadius: BorderRadius.all(Radius.circular(80.0))
       ),
       padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
       child: const Text(
           'Google Login',
           style: TextStyle(fontSize: 20)
       ),
     ),
   );
    
    final Signout =RaisedButton(
      onPressed: () => authService.signOut().then((status) {
        setState(() {
          text1 = status;
        });
      }),
     textColor: Colors.white,
     padding: const EdgeInsets.all(0.0),
     shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
     child: Container(
       decoration: const BoxDecoration(
         gradient: LinearGradient(
           colors: <Color>[
             Colors.redAccent,
             Colors.orangeAccent,
             //Colors.lightGreenAccent,
           ],
         ),
         borderRadius: BorderRadius.all(Radius.circular(80.0))
       ),
       padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
       child: const Text(
           'Signout',
           style: TextStyle(fontSize: 20)
       ),
     ),
   );
    
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        color: Theme.of(context).canvasColor,
        child: Column(
          children: <Widget>[
             SizedBox(height: MediaQuery.of(context).size.height*0.2),
                    emailField,
                    SizedBox(height: 50.0),
                    passwordField,
                    SizedBox(
                      height: 50.0,
                    ),
                    loginButon,
                    SizedBox(
                      height: 15.0,
                    ),
                    Signout,
                    SizedBox(
                      height: 25.0,
                    ),
                    Container(
                      child: Text(text1 == null ? 'nothing' : text1,style: TextStyle(fontSize: 25),),)
          ],
        ),
      ),
    );
  }
}


