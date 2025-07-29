import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttersocket/chatfirst/chat_page.dart';
import 'package:fluttersocket/features.auth/contacts/presentation/pages/contacts_page.dart';
import 'package:fluttersocket/features.auth/conversation/presentation/bloc/conversation_bloc.dart';
import 'package:fluttersocket/features.auth/conversation/presentation/bloc/conversation_state.dart';
import 'package:fluttersocket/features.auth/conversation/presentation/bloc/conversations_event.dart';

class ConversationsPage extends StatefulWidget{

  const ConversationsPage({Key? key}) : super(key: key);

  @override
  State<ConversationsPage> createState() => _ConversationsPageState();
}

class _ConversationsPageState extends State<ConversationsPage> {


@override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<ConversationsBloc>(context).add(FetchConversations());
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Mesaage",
        style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: false,
        backgroundColor: Colors.yellow,
        elevation: 0,
        toolbarHeight: 70,
        actions: [
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.search))
        ],
      ),

    body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(

          padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 10.0),
          child: Text('Recent',
            style: Theme.of(context).textTheme.bodySmall,

          ),
        ),
        Container(
          height: 100,
          padding: EdgeInsets.all(5),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildRecentContact('Gaurav',context),
              _buildRecentContact('Akash',context),
              _buildRecentContact('Meraj',context),
              _buildRecentContact('Shubham',context),
            ],
          ),
        ),
        SizedBox(height: 10,),
        Expanded(child: Container(
          decoration: BoxDecoration(
              color: Colors.yellow,
            borderRadius: BorderRadius.only(
              topLeft:  Radius.circular(50),
              topRight: Radius.circular(50)
            )

            ),
          child: BlocBuilder<ConversationsBloc,ConversationsState>(
            builder: (context,state){
              if(state is ConversationLoading)
                {
                  Center(child: CircularProgressIndicator());
                }
              else if(state is ConversationLoaded)
                {
                  return ListView.builder(
                      itemCount: state.conversationResponseModel.data?.length,
                      itemBuilder: (context,index){

                        final conversations=state.conversationResponseModel?.data?[index];
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>
                            ChatPage(conversationId: conversations?.conversationId.toString()??'', mate: conversations?.participantName??'')
                            ));
                          },
                          child: _buildMessageTile(
                              conversations?.participantName??'',
                              conversations?.lastMessage??'',
                              conversations?.lastMessageTime.toString()??''
                          ),
                        );
                      }
                  );
                }
              
              else if(state is ConversationError)
                {
                 return Center(child: Text(state.message),);
                }

              return Center(child: Text('No Conversation Found'),);

              },




          ),
        ))
      ],
    ),
      floatingActionButton: FloatingActionButton(
          onPressed:(){
            Navigator.push(context,
                MaterialPageRoute(builder: (context)=>ContactPages()));
          },
          backgroundColor:Colors.white,
          child: Icon(Icons.contacts),
      ),


    );

  }

  ///Message Item

  Widget _buildMessageTile(String name,String message,String time){
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      leading: CircleAvatar(
        radius: 20,
        backgroundImage: NetworkImage('https://picsum.photos/id/237/200/300'),

      ),

      title: Text(name,
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold

      ),),

      subtitle: Text(message,
      style: TextStyle(
        color: Colors.grey

      ),
      ),

      trailing: Text(time,
      style: TextStyle(
        color: Colors.grey

      ),
      ),


    );
  }

  ///Recent

  Widget _buildRecentContact(String name,BuildContext context){
    return Padding(padding:const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage('https://picsum.photos/id/237/200/300'),
          ),
          SizedBox(height: 5,),
          Text(name,
          style: Theme.of(context).textTheme.bodyMedium,)
        ],
      ),
    );
  }
}
