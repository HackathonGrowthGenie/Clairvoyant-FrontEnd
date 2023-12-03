import 'package:clairvoyant/screens/onboarding/bloc/loginBloc/login_bloc.dart';
import 'package:clairvoyant/screens/onboarding/bloc/loginBloc/login_state.dart';
import 'package:clairvoyant/screens/onboarding/client_selection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'bloc/loginBloc/loign_event.dart';

class Login extends StatefulWidget {

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final userController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Text("CLAIRVOYANT HACKATHOON",
          textAlign: TextAlign.center,
          style: GoogleFonts.quattrocentoSans(
              color: Colors.red,
              letterSpacing: 20,
              fontSize: 16,
            fontWeight: FontWeight.w900
          )
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 200,),
                  const Center(child: Text("LOGIN",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)),
                  const SizedBox(height: 20,),
                  Container(
                    width: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                              onChanged: (val){
                                BlocProvider.of<LoginBloc>(context).add(
                                    LoginUserChangedEvent(userController.text)
                                );
                                if(userController.text.length>7){
                                  BlocProvider.of<LoginBloc>(context)
                                      .add(LoginPassChangedEvent(passwordController.text));
                                }

                              },
                              controller: userController,
                              cursorColor: Colors.lightGreen,
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
                                labelText: 'Username',
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.bold
                                ),
                                hintText: 'Enter Username',
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.lightGreen
                                    )
                                ),
                              )
                          ),
                          BlocBuilder<LoginBloc, LoginState>(
                            builder: (context, state) {
                              if(state is LoginUserErrorState){
                                return Text(state.errorMessage, style: const TextStyle(fontSize: 14, color: Colors.red),);
                              }else{
                                return Container();
                              }
                            },
                          ),
                          const SizedBox(height: 20,),
                          //const Text("Password",style:TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                          TextFormField(
                              onChanged: (val){
                                BlocProvider.of<LoginBloc>(context).add(
                                    LoginPassChangedEvent(passwordController.text)
                                );
                                if(passwordController.text.length>5){
                                  BlocProvider.of<LoginBloc>(context)
                                      .add(LoginUserChangedEvent(userController.text));
                                }
                              },
                              controller: passwordController,
                              cursorColor: Colors.lightGreen,
                              keyboardType: TextInputType.text,
                              obscureText: true,
                              decoration: const InputDecoration(
                                labelText: 'Password',
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.bold
                                ),
                                hintText: 'Enter Password',
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.lightGreen
                                    )
                                ),
                              )
                          ),
                          BlocBuilder<LoginBloc, LoginState>(
                            builder: (context, state) {
                              if(state is LoginPasswordErrorState){
                                return Text(state.errorMessage, style: const TextStyle(fontSize: 14, color: Colors.red),);
                              }else{
                                return Container();
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 40,),
                  Center(
                    child: BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      return InkWell(
                      onTap: (){
                        if(state is LoginValidState){
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => ClientSelection(),
                            ),
                          );
                        }
                      },
                      child: BlocBuilder<LoginBloc, LoginState>(
                      builder: (context, state) {
                        return Container(
                        decoration: BoxDecoration(
                            color: (state is LoginValidState)?Colors.deepPurple:Colors.grey,
                            borderRadius: BorderRadius.circular(20)),
                        height: 50,
                          width: 400,
                          child: Center(child: Text("SUBMIT", style: TextStyle(fontSize: 20),)));
                      },
                    ),
                      );
                      },
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}