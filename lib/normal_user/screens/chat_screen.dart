import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart' as urlLauncher;


class Chat extends StatelessWidget {
  const Chat({Key? key, required this.imageUrl,required this.username}) : super(key: key);
  final String imageUrl;
  final String username;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        persistentFooterButtons: [
          Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: TextField(
              enabled: true,
            ),
          ),
        ],
        body: CustomScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          slivers: [
            SliverPersistentHeader(
              delegate: ChatAppBar(imageUrl: imageUrl,username: username),
            ),
            SliverToBoxAdapter(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Today',
                      style: TextStyle(color: Colors.black),
                    ),
                    Message(
                      isMe: true,
                      messageText: 'مرحبا',
                      otherImageUrl: imageUrl,
                    ),
                    Message(
                        isMe: false,
                        messageText: 'اهلا سامي ، كيف حالك؟ ',
                        otherImageUrl: imageUrl),
                    Message(
                        isMe: true,
                        messageText: 'لقد تلقيت الطلب الخاص بك',
                        otherImageUrl: imageUrl),
                    Message(
                        isMe: false,
                        messageText: 'نعم، أتمنى ان نتم المهمة',
                        otherImageUrl: imageUrl)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatAppBar extends SliverPersistentHeaderDelegate {
  final String imageUrl;
  final String username;

  ChatAppBar({required this.imageUrl,required this.username});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: 100,
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(16, 30, 0, 0),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          SizedBox(width: 0),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 70,
                width: 70,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.green),
              ),
              CircleAvatar(
                backgroundColor: Colors.red,
                backgroundImage: NetworkImage(imageUrl),
                radius: 30,
              ),
            ],
          ),
          SizedBox(width: 12),
          Text(
            username,
            textAlign: TextAlign.center,
            style: GoogleFonts.tajawal(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          Spacer(),
          IconButton(
            icon: Icon(Icons.phone),
            onPressed: () {
              urlLauncher.launch(('tel:0592089866}'));
            },
          )
        ],
      ),
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 100;

  @override
  // TODO: implement minExtent
  double get minExtent => 100;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class Message extends StatelessWidget {
  final bool isMe;
  final String otherImageUrl;

  final String messageText;

  const Message(
      {Key? key,
      required this.isMe,
      required this.messageText,
      required this.otherImageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        textDirection: isMe ? TextDirection.rtl : TextDirection.ltr,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(width: 23),
          CircleAvatar(
            backgroundImage: NetworkImage(isMe
                ? 'https://images.unsplash.com/photo-1529068755536-a5ade0dcb4e8?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=581&q=80'
                : otherImageUrl),
          ),
          SizedBox(width: 15),
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: isMe
                    ? Color(0xFF14688C).withOpacity(0.15)
                    : Color(0xFF8B8B8B).withOpacity(0.15),
                borderRadius: BorderRadius.circular(8)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '${messageText}',
                  softWrap: false,
                ),
                SizedBox(height: 15),
                Text('11:26am'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
