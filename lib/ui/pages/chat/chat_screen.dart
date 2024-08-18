import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:school_managment/config/app_colors.dart';
import 'package:school_managment/ui/base_widgets/cards/user_image_card.dart';
import 'package:school_managment/ui/pages/chat/widgets/chat_user_widget.dart';

import '../../base_widgets/app_bar/app_bar.dart';
import '../../base_widgets/bottom_bar/bottom_bar.dart';
import '../home/widgets/drawer_widget.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(),
      drawer: AppDrawer(),
      bottomNavigationBar: AppBottomBar(currentIndex: 1,),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          children: [
            ChatUserItem(),
            ChatUserItem(),
            ChatUserItem(),
            ChatUserItem(),
            ChatUserItem(),
            ChatUserItem(),
            ChatUserItem(),
            ChatUserItem(),
            ChatUserItem(),
            ChatUserItem(),
            ChatUserItem(),
            ChatUserItem(),
            ChatUserItem(),
            ChatUserItem(),
            ChatUserItem(),
            ChatUserItem(),
            ChatUserItem(),
            ChatUserItem(),
            ChatUserItem(),
          ],
        ),
      ),
    );
  }
}
