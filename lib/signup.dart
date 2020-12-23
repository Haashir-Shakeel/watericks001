import 'package:flutter/material.dart';
import 'constants.dart';

class SignUp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('WATERICS',style: kTextStyle1,),),
          backgroundColor: kSecondaryColor,
        ),
        body: SignUpPage(),
      ),
    );
  }
}
class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String email, password, confirmpassword;

  Widget buildLogo(){
    return Image.asset('images/signup.png',color: Colors.white,width: MediaQuery.of(context).size.width*0.16,);
  }


  Widget buildRegisterButton(){
    return Positioned(
      bottom: MediaQuery.of(context).size.height*0.2,
      left: MediaQuery.of(context).size.width*0.38,
      child: FlatButton(
        color: kSecondaryColor,
        onPressed: (){},
        child: Text('REGISTER',style: TextStyle(color: Colors.white),),
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(30.0),
        ),
      ),
    );
  }

  Widget buildTurnOnLocation(){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.1, vertical: MediaQuery.of(context).size.width*0.05 ),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        onChanged: (value){
          setState(() {
            confirmpassword = value;
          });
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: kSecondaryColor,
          hintText: 'TURN ON LOCATION',
          hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
        ),

      ),
    );
  }

  Widget buildConfirmPassword(){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.1, vertical: MediaQuery.of(context).size.width*0.05 ),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        onChanged: (value){
          setState(() {
            confirmpassword = value;
          });
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: kSecondaryColor,
          hintText: 'CONFIRM PASSWORD',
          hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
        ),

      ),
    );

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

  Widget buildLoginNowButton(){
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
            'LOGIN NOW',
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

  Widget buildContainer(BuildContext context){

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(10),

          ),
          child: Container(

//            height: MediaQuery.of(context).size.height*0.4,
            width: MediaQuery.of(context).size.width*0.85,
            color: kColor,

            child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                buildEmailRow(),
                buildPasswordRow(),
                buildConfirmPassword(),
                buildTurnOnLocation(),

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
                    'ALREADY HAVE AN ACCOUNT? ',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400
                    )
                ),

                buildLoginNowButton(),
              ],
            ),
            buildRegisterButton(), //login button to stack on our container


          ],
        ),
      ),
    );
  }
}
