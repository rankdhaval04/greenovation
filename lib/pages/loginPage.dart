import 'package:flutter/material.dart';
import 'package:greenovation/pages/homePage.dart';
import 'package:greenovation/pages/signup.dart';
import 'package:greenovation/pages/signupNgo.dart';

class loginPage extends StatefulWidget {
  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {

  final _formKey = GlobalKey<FormState>();
  final phonenoController = new TextEditingController();
  final passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    final phoneno = TextFormField(
      obscureText: false,
      controller: phonenoController,
      keyboardType: TextInputType.number,
      validator: (String value){
//        Pattern pattern =
//            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
//        RegExp regex = new RegExp(pattern);
        if (value.length != 10)
          return 'Enter Valid phone no';
        else
          return null;
      },
      style: Theme.of(context).textTheme.body1,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Phone no",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final passsword = TextFormField(
      obscureText: true,
      controller: passwordController,
      validator: (String value){
        if (value.length < 6)
          return 'password must be more then 6 digit';
        else
          return null;
      },
      style: Theme.of(context).textTheme.body1,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final forgotpassword = Text('Forgot password ?', style: Theme
        .of(context)
        .textTheme
        .subhead
        .copyWith(color: Colors.white),);

    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.green,
      child: MaterialButton(
        minWidth: MediaQuery
            .of(context)
            .size
            .width / 1.1 ,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: ()  {
          if(_formKey.currentState.validate()){
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => homePage()),
            );
          }
        },
        child: Text("Login",
            textAlign: TextAlign.center,
            style: Theme
                .of(context)
                .textTheme
                .title.copyWith(color: Colors.white)
        ),
      ),
    );

    final donthaveone = Text("Don't have one ?",
        textAlign: TextAlign.center,
        style: Theme
            .of(context)
            .textTheme
            .subtitle.copyWith(color: Colors.white)
    );

    final ngo = Text("You are NGO ?",
        textAlign: TextAlign.center,
        style: Theme
            .of(context)
            .textTheme
            .subtitle.copyWith(color: Colors.white)
    );

    final signup = Text("Sign Up",
        textAlign: TextAlign.center,
        style: Theme
            .of(context)
            .textTheme
            .subtitle.copyWith(color: Colors.white, fontWeight: FontWeight.bold)
    );

    final signupNGO = Text("Sign Up",
        textAlign: TextAlign.center,
        style: Theme
            .of(context)
            .textTheme
            .subtitle.copyWith(color: Colors.white, fontWeight: FontWeight.bold)
    );

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('https://images.unsplash.com/photo-1525124480298-565f20ea00ae?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80',),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: SingleChildScrollView(
            child: Card(
              elevation: 5.0,
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                          width: 100,
                          height: 100,
                          child: CircleAvatar(backgroundImage: NetworkImage("https://images.unsplash.com/photo-1472722266948-a898ab5ff257?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=891&q=80",))),
                      SizedBox(height: 10.0,),
                      phoneno,
                      SizedBox(height: 10.0,),
                      passsword,
                      SizedBox(height: 10.0,),
                      Container(
                        child: Align(
                            alignment: Alignment.topRight,
                            child: forgotpassword),
                      ),
                      SizedBox(height: 10.0,),
                    loginButon,
                      SizedBox(height: 10.0,),
                      Container(
                        child: Row(
                          children: <Widget>[
                            SizedBox(width: MediaQuery.of(context).size.width / 4,),
                            donthaveone,
                            SizedBox(width: 10.0,),
                            GestureDetector(
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => signUp()),
                                  );
                                },
                                child: signup)
                          ],
                        ),
                      ),
                      SizedBox(height: 10.0,),

                      Container(
                        child: Row(
                          children: <Widget>[
                            SizedBox(width: MediaQuery.of(context).size.width / 3.8,),
                            GestureDetector(
                                onTap: (){

                                },
                                child: ngo),
                            SizedBox(width: 10.0,),
                            GestureDetector(
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => signupNgo()),
                                  );
                                },
                                child: signupNGO)
                          ],
                        ),
                      ),
                      SizedBox(height: 10.0,)
                ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
