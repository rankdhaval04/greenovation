import 'package:flutter/material.dart';
import 'package:greenovation/pages/loginPage.dart';

class signUp extends StatefulWidget {
  @override
  _signUpState createState() => _signUpState();
}

class _signUpState extends State<signUp> {

  final _formKey = GlobalKey<FormState>();
  final nameController = new TextEditingController();
  final phoneController = new TextEditingController();
  final emailController = new TextEditingController();
  final passwordController = new TextEditingController();
  final dobController = new TextEditingController();
  final cityController = new TextEditingController();
  final stateController = new TextEditingController();
  final pincodeController = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    final name = TextFormField(
      controller: nameController,
      validator: (String value) {
        if (value.length == 0)
          return 'Enter name';
        else
          return null;
      },
      style: Theme
          .of(context)
          .textTheme
          .body1,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Name",
          border:
          OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.0))),
    );

    final phone = TextFormField(
      controller: phoneController,
      keyboardType: TextInputType.number,
      validator: (String value) {
        if (value.length < 10 || value.length > 10)
          return 'Enter mobile no';
        else
          return null;
      },
      style: Theme
          .of(context)
          .textTheme
          .body1,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Mobile no",
          border:
          OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.0))),
    );

    final email = TextFormField(
      obscureText: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (String value) {
        Pattern pattern =
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
        RegExp regex = new RegExp(pattern);
        if (!regex.hasMatch(value))
          return 'Enter Valid Email';
        else
          return null;
      },
      style: Theme
          .of(context)
          .textTheme
          .body1,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border:
          OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.0))),
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

    final dob = TextFormField(
      controller: dobController,
      keyboardType: TextInputType.datetime,
      validator: (String value) {
        if (value.length < 5)
          return 'Enter dob ';
        else
          return null;
      },
      style: Theme
          .of(context)
          .textTheme
          .body1,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Date of Birth",
          border:
          OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.0))),
    );

    final city = TextFormField(
      controller: cityController,
      validator: (String value) {
        if (value.length < 3)
          return 'Enter valid city';
        else
          return null;
      },
      style: Theme
          .of(context)
          .textTheme
          .body1,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "City",
          border:
          OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.0))),
    );

    final pincode = TextFormField(
    controller: pincodeController,
    keyboardType: TextInputType.number,
    validator: (String value) {
    if (value.length < 6)
    return 'Enter valid pincode';
    else
    return null;
    },
    style: Theme
        .of(context)
        .textTheme
        .body1,
    decoration: InputDecoration(
    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
    hintText: "pincode",
    border:
    OutlineInputBorder(
    borderRadius: BorderRadius.circular(32.0))),
    );

    final state = TextFormField(
    controller: stateController,
    validator: (String value) {
    if (value.length < 3)
    return 'Enter valid state';
    else
    return null;
    },
    style: Theme
        .of(context)
        .textTheme
        .body1,
    decoration: InputDecoration(
    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
    hintText: "State",
    border:
    OutlineInputBorder(
    borderRadius: BorderRadius.circular(32.0))),
    );

    final button = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.teal,
      child: MaterialButton(
        minWidth: MediaQuery
            .of(context)
            .size
            .width / 1.1,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () async {
          if (_formKey.currentState.validate()) {

            _formKey.currentState.save();

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => loginPage()),
            );
          }
        },
        child: Text("Register",
            textAlign: TextAlign.center,
            style: Theme
                .of(context)
                .textTheme
                .title
                .copyWith(color: Colors.white)
        ),
      ),
    );

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              SizedBox(height: 20.0,),
              Align(
                  alignment: Alignment.center,
                  child: Text('Register',style: Theme.of(context).textTheme.headline.copyWith(color: Colors.teal),)),
              SizedBox(height: 10.0,),
              name,
              SizedBox(height: 10.0,),
              email,
              SizedBox(height: 10.0,),
              phone,
              SizedBox(height: 10.0,),
              passsword,
              SizedBox(height: 10.0,),
              dob,
              SizedBox(height: 10.0,),
              city,
              SizedBox(height: 10.0,),
              state,
              SizedBox(height: 10.0,),
              pincode,
              SizedBox(height: 10.0,),
              button,
              SizedBox(height: 10.0,),
            ],
          ),
        ),
      ),
    );
  }
}
