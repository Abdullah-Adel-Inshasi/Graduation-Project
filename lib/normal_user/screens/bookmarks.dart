import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Bookmarks extends StatelessWidget {
  const Bookmarks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      body: CustomScrollView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        slivers: [
          SliverAppBar(
            backgroundColor: Color(0xFF14688C),
            pinned: true,
            title: Text(
              'الحجوزات',
              style: GoogleFonts.tajawal(color: Colors.white, fontSize: 22),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200.0,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 1),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return BookmarkedRealEstate(
                    imgUrl:
                        'https://www.mymove.com/wp-content/uploads/2020/11/GettyImages-532882090-scaled.jpg',
                  );
                },
                childCount: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BookmarkedRealEstate extends StatelessWidget {
  const BookmarkedRealEstate({Key? key, required this.imgUrl})
      : super(key: key);

  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
              ),
              color: Colors.white
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
              child: Image.asset(
                'assets/images/vic.jpg',
                height: 120,
                width: 200,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('غزة - شارع النصر '),
                    Text('140 متر'),
                  ],
                ),
                Container(
                  width: 10,
                  height: 10,
                  decoration:
                      BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
