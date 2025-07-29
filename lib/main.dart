import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttersocket/Dashboard.dart';
import 'package:fluttersocket/features.auth/chat/data/datasources/message_remote_data_source.dart';
import 'package:fluttersocket/features.auth/chat/data/repositories/message_repository_impl.dart';
import 'package:fluttersocket/features.auth/chat/domain/repositories/message_repository.dart';
import 'package:fluttersocket/features.auth/chat/domain/usecase/fetch_message_use_case.dart';
import 'package:fluttersocket/features.auth/chat/presentation/bloc/chat_bloc.dart';
import 'package:fluttersocket/features.auth/contacts/data/datasources/contact_remotedatasource.dart';
import 'package:fluttersocket/features.auth/contacts/data/repositories/contacts_repositories_imp.dart';
import 'package:fluttersocket/features.auth/contacts/presentation/bloc/contact_bloc.dart';
import 'package:fluttersocket/features.auth/contacts/presentation/pages/contacts_page.dart';
import 'package:fluttersocket/features.auth/contacts/repositories/contact_repositories.dart';
import 'package:fluttersocket/features.auth/contacts/usecases/add_contact_usecase.dart';
import 'package:fluttersocket/features.auth/contacts/usecases/fetch_contacts_usecase.dart';
import 'package:fluttersocket/features.auth/conversation/data/datasources/conversations_remote_data_source.dart';
import 'package:fluttersocket/features.auth/conversation/data/repositories/conversation_repositories_impl.dart';
import 'package:fluttersocket/features.auth/conversation/domain/repositories/converations_repository.dart';
import 'package:fluttersocket/features.auth/conversation/domain/usecase/fetch_conversations_use_case.dart';
import 'package:fluttersocket/features.auth/conversation/presentation/bloc/conversation_bloc.dart';
import 'package:fluttersocket/features.auth/conversation/presentation/pages/conversations_page.dart';
import 'package:fluttersocket/chatlist.dart';
import 'package:fluttersocket/features.auth/data/datasource/authRemoteSource.dart';
import 'package:fluttersocket/features.auth/presentation/bloc/auth_bloc.dart';
import 'package:fluttersocket/features.auth/repositiories/auth_repository_impl.dart';
import 'package:fluttersocket/features.auth/usecase/login_use_case.dart';
import 'package:fluttersocket/login/login_page.dart';
import 'package:fluttersocket/resources/socket_service.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import 'chatfirst/chat_page.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  final socketService =SocketService();
  await socketService.initSocket();
  final authRepo=AuthRepositoryImp(authRemoteSource: AuthRemoteSource());
  final contactRepo=ContactRepostoriesImpl(remoteDataSource: ContactRemoteDataSource());
  final conversationsRepository=ConversationRepositoryImpl(conversationsRemoteDataSource: ConversationsRemoteDataSource());
  final messageRepository=MessageRepositoryImpl(messageRemoteDataSource: MessageRemoteDataSource());
  runApp(MyApp(authRepositoryImp: authRepo,conversationsRepository: conversationsRepository,messageRepository: messageRepository,contactRepository: contactRepo,));
}

class MyApp extends StatelessWidget {
  final AuthRepositoryImp authRepositoryImp;

  final ConversationsRepository conversationsRepository;

  final MessageRepository messageRepository;

  final ContactRepository contactRepository;
  const MyApp({super.key,required this.authRepositoryImp,required this.conversationsRepository,required this.messageRepository,required this.contactRepository});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create:(_)=>AuthBloc(
                loginUseCase: LoginUseCase(authRepository: authRepositoryImp)
            )
        ),
        BlocProvider(
            create:(_)=>ConversationsBloc(
                fetchConversations:FetchConversationsUseCase(conversationsRepository)
            )
        ),

        BlocProvider(
            create:(_)=>ChatBloc(
                fetchMessageUseCase: FetchMessageUseCase(messageRepository: messageRepository))
        ),
        BlocProvider(
            create:(_)=>ContactBloc(
                fetchContactUseCase: FetchContactUseCase(contactRepository: contactRepository), addContactUseCase: AddContactUseCase(contactRepository: contactRepository))
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,


        home: LoginPage(),
        routes: {
          '/login':(_)=>LoginPage(),
          '/dashboard':(_)=>Dashboard(),
          '/conversationsPage':(_)=>ConversationsPage(),
          '/contactPage':(_)=>ContactPages()
        },
      ),
    );
  }
}

