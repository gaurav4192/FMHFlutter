import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttersocket/features.auth/contacts/presentation/bloc/contact_bloc.dart';
import 'package:fluttersocket/features.auth/contacts/presentation/bloc/contact_event.dart';
import 'package:fluttersocket/features.auth/contacts/presentation/bloc/contact_state.dart';

class ContactPages extends StatefulWidget{

  const ContactPages({super.key});

  @override
  State<ContactPages> createState() => _ContactPagesState();
}

class _ContactPagesState extends State<ContactPages> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<ContactBloc>(context).add(FetchContacts());
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),

      body: BlocBuilder<ContactBloc,ContactState>(
          builder: (context,state){
        if(state is ContactsLoading)
          {
            return Center(child: CircularProgressIndicator());

          }

        else if(state is ContactLoaded)
          {

            return ListView.builder(
                itemCount: state.contactlistResponseModel.data?.length,
                itemBuilder: (context,index){
                  return ListTile(
                    title: Text(state.contactlistResponseModel.data?[index].username??''),
                    subtitle: Text(state.contactlistResponseModel.data?[index].email??''),
                    onTap: (){
                      Navigator.pop(context,state.contactlistResponseModel.data?[index]??'');
                    },

                  );

                }
            );
          }

        else if(state  is ContactError)
          {

            return Center(child: Text(state.message),);
          }
        return Center(child: Text('No Contacts Found'),);

      }

      ),
      floatingActionButton: FloatingActionButton(
          onPressed: ()=>_showAddContactDialog(context),
          child:Icon(Icons.add)
      ),

    );
  }

  void _showAddContactDialog(BuildContext context)
  {
    final emailController=TextEditingController();

    showDialog(context: context,
        builder: (context)=>
    AlertDialog(title: Text('Add Contact',
      style: Theme.of(context).textTheme.bodyMedium,),
    content: TextField(
      controller: emailController,
      decoration: InputDecoration(hintText: 'Enter Contact Email'),
    ),
    actions: [
      TextButton(onPressed: (){
        Navigator.pop(context);

      }, child: Text('Cancel')),
      ElevatedButton(onPressed: (){
        final email=emailController.text.trim().toString();
        if(email.isNotEmpty){
          BlocProvider.of<ContactBloc>(context).add(AddContacts(email));
          Navigator.pop(context);
        }
      },

          child: Text('Add',
            style: Theme.of(context).textTheme.bodyMedium,))

    ],

    )
    );
  }
}