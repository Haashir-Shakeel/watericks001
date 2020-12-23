
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:uidesigning001/constants.dart';
import 'package:uidesigning001/signup.dart';
import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Center(child: Text('WATERICS',style: kTextStyle1,),),
            backgroundColor: kSecondaryColor,
          ),
          body: LoginPage(),
        ),
      ),
    );
  }
}
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email, password;

  Widget buildRegisterNowButton(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FlatButton(
          onPressed: (){
           Navigator.push(
               context,
               MaterialPageRoute(builder: (context)=>SignUp()),
           );
          },
          child: Text(
            'REGISTER NOW',
            style: TextStyle(
              color: Colors.white,
              decoration: TextDecoration.underline,
              fontSize: MediaQuery.of(context).size.height/40,
              fontWeight: FontWeight.bold
            ),
          ),
        )


      ],
    );
  }

  Widget buildLoginButton(){
    return Positioned(
      bottom: MediaQuery.of(context).size.height*0.28,
      left: MediaQuery.of(context).size.width*0.38,
      child: FlatButton(
        color: kSecondaryColor,
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context)=>Home()),
          );
        },
        child: Text('LOGIN',style: TextStyle(color: Colors.white),),
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(30.0),
        ),
      ),
    );
  }

  Widget buildLogo(){
    return Image.asset('images/user.png',color: Colors.white,width: MediaQuery.of(context).size.width*0.2,);
  }

  Widget buildPasswordRow(){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.1, vertical: MediaQuery.of(context).size.width*0.05 ),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        onChanged: (value){
          setState(() {
            password = value;
          });
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: kSecondaryColor,
          hintText: 'PASSWORD',
          hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
        ),

      ),
    );
  }

  Widget buildEmailRow(){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.1, vertical: MediaQuery.of(context).size.width*0.05 ),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        onChanged: (value){
          setState(() {
            email = value;
          });
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: kSecondaryColor,
          hintText: 'EMAIL',
          hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
        ),

      ),
    );
  }

  Widget buildContainer(BuildContext context){

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(10),

          ),
          child: Container(

            height: MediaQuery.of(context).size.height*0.4,
            width: MediaQuery.of(context).size.width*0.85,
            color: kColor,

            child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                buildEmailRow(),
                buildPasswordRow(),
              ],
            ),

          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var queryData = MediaQuery.of(context);
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: kGradient,
        ),
        child: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    SizedBox(height: queryData.size.height*0.09,),
                    buildLogo(),
                    SizedBox(height: queryData.size.height*0.09,),
                    buildContainer(context),

                    SizedBox(height: queryData.size.height*0.05,),
                    Text(
                        'DONT HAVE AN ACCOUNT? ',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400
                        )
                    ),

                    buildRegisterNowButton(),
              ],
            ),
                buildLoginButton(), //login button to stack on our container


          ],
        ),
      ),
    );
  }

}

