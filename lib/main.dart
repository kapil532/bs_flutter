import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

void main()
{

  runApp(myApp());
}

class myApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
       title: 'login ui',
      theme: ThemeData(

        primaryColor: Colors.brown
      ),

       home: MyLoginPage(),

    );


  }

}

class MyLoginPage extends StatefulWidget
{
  @override
  _MyLoginPage  createState() => _MyLoginPage();


}

final TextEditingController emailController = new TextEditingController();
final TextEditingController passwordController = new TextEditingController();

class _MyLoginPage extends State<MyLoginPage>
{
  @override
  Widget build(BuildContext context)

  {

    return Scaffold
      (


     body: Stack(
       fit: StackFit.expand,
        children: <Widget>
        [
          Image.asset('assets/bg_in.png',fit: BoxFit.cover),

          Column
            (





              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
              Image.asset("assets/logo.png",
              height: 90.0,
              width: 90.0,),
              
              Padding

                (
                  padding: EdgeInsets.only(top: 18.0),
                child: Stack
                  (

                  children: <Widget>
                  [
                    SingleChildScrollView(
                      child:  Container
                        (

                        height: 180.0,
                        width: 350.0,

                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0,
                            vertical: 10.0
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(4.0),

                        ),
                        child: Column(

                          children: <Widget>
                          [


                            TextField(
                              controller: emailController,
                              autocorrect: false,
                              autofocus: false,
                              style: TextStyle
                                (
                                  fontSize: 16.0
                              ),
                              decoration: InputDecoration(
                                  hintText: "Email Address",
                                  border: InputBorder.none
                              ),
                            ),

                            Divider(
                              color: Colors.black,
                            ),
                            TextField
                              (
                              controller: passwordController,
                              autocorrect: false,
                              autofocus: false,
                              obscureText: true,
                              style: TextStyle
                                (
                                  fontSize: 16.0
                              ),
                              decoration: InputDecoration(
                                  hintText: "Password ",
                                  border: InputBorder.none
                              ),
                            ),

                            MaterialButton(
                              onPressed:(){
                                signIn(emailController.text, passwordController.text);
                              },
                              minWidth: 350.0,
                              color: Colors.red,
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.0
                              ),
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.white
                                ),
                              ),
                            )




                          ],


                        ),
                      )
                      ,
                    )
                  ],

                )
                ,



              ),


                Padding

                  (




                  padding: EdgeInsets.only(top: 15.0),
                  child: Column
                    (
                    children: <Widget>[
                      Text(
                          "Forgot Password",
                          textAlign: TextAlign.center,
                        textScaleFactor: 1.4,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11.0,
                          fontWeight: FontWeight.w300,
                        )
                      ),

                     Padding(padding: EdgeInsets.only(top: 25.0),
                    child:  Text(
                          "Don't have an account yet?",
                          textAlign: TextAlign.center,
                          textScaleFactor: 1.3,
                          style: TextStyle(
                            fontSize: 11.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                          )
                      ),
                     ),

                  Padding(padding: EdgeInsets.only(top: 10.0),
                     child: Text(
                          "Sign Up Now!",
                          textAlign: TextAlign.center,
                          textScaleFactor: 1.3,
                          style: TextStyle(
                            fontSize: 11.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                          )
                      )
                  )

                    ],




                  ),




                ),

            ],







          ),








        ],
     ),

      bottomNavigationBar: BottomAppBar(


        child:Container
          (

          height: 35.0,
          alignment: Alignment.center,


       child: new GestureDetector(

        onTap: ()
         {

           Navigator.pushNamed(context, "myRoute");
         },

       child: Text(
          "Terms and Conditions",
          textAlign: TextAlign.center,

            style: TextStyle(
              fontSize: 14.0,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            )
        ),

       )



      ),
      )
    );


  }




















  signIn(String email, pass) async
  {

    print("inside");
   // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {
      'email': email,
      'password': pass,
      'country':'India'
    };
    print("asdas"+data.toString());

    String url = 'http://dev.blueshak.com/api';
    Map<String, String> headers = {"Content-type": "application/json"};
    String json = '{"email": "kapi.pccs@gmail.com", "password": "qwerty", "country": "in"}';
    // make POST request
    http.Response response = await http.post(url, headers: headers, body: json);
    // check the status code for the result
    int statusCode = response.statusCode;
    String body = response.body;
   print(body);
   // var response = await http.post(Uri"http://dev.blueshak.com/api", body: data);
   /* var jsonResponse = null;
    var response = await http.post(Uri"http://dev.blueshak.com/api", body: data);
    if(response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      if(jsonResponse != null) {
        setState(() {
        });
        sharedPreferences.setString("token", jsonResponse['token']);
       // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => MainPage()), (Route<dynamic> route) => false);
      }
    }
    else {
      setState(() {
      });
      print(response.body);
    }*/
  }
}