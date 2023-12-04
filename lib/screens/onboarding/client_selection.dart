import 'package:clairvoyant/screens/onboarding/bloc/clientBloc/clientSelection_bloc.dart';
import 'package:clairvoyant/screens/onboarding/bloc/clientBloc/clientSelection_event.dart';
import 'package:clairvoyant/screens/onboarding/bloc/clientBloc/clientSelection_state.dart';
import 'package:clairvoyant/screens/onboarding/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../dashboard/components/inner_grid.dart';
import '../dashboard/components/topInvestors_components/top_investors.dart';



class ClientSelection extends StatelessWidget {
  TextEditingController clientController = TextEditingController();
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
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 40,),
                Text('TOP LEGENDS WHO MADE MOST OUT OF THEIR INVESTMENTS',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.brown, fontSize: 20, fontWeight: FontWeight.w700),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TopInvestorsGrid(),
                ),
                SizedBox(height: 40,),
                Container(
                    height: 130,
                    width: 400,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.white)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            onChanged: (val){
                              BlocProvider.of<ClientSelectionBloc>(context).add(
                                ClientTextChangedEvent(val)
                              );
                            },
                              controller: clientController,
                              cursorColor: Colors.lightGreen,
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
                                labelText: 'Client ID',
                                labelStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold
                                ),
                                hintText: 'Enter Client ID',
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.lightGreen
                                    )
                                ),
                              )
                          ),
                          SizedBox(height: 5,),
                          BlocBuilder<ClientSelectionBloc, ClientSelectionState>(
                            builder: (context, state) {
                              if(state is ClientIdErrorState){
                                return Text(state.errorMessage,
                                  style: const TextStyle(
                                      fontSize: 14, color: Colors.red),);
                              }else{
                                return Container();
                              }
                            },
                          ),
                        ],
                      ),
                    )
                ),
                SizedBox(height: 20,),
                Center(
                  child: BlocBuilder<ClientSelectionBloc, ClientSelectionState>(
                    builder: (context, state) {
                      return InkWell(
                        onTap: () {
                          if(state is ClientIdValidState) {
                            BlocProvider.of<ClientSelectionBloc>(context).add(
                                ClientSubmittedEvent(clientController.text)
                            );
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => MainScreen(),
                              ),
                            );
                          }
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                color: (state is ClientIdValidState) ? Colors
                                    .deepPurple : Colors.grey,
                                borderRadius: BorderRadius.circular(20)),
                            height: 50,
                            width: 400,
                            child: Center(child: Text(
                              "SUBMIT", style: TextStyle(fontSize: 20),))),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
