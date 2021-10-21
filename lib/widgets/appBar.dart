import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar2 extends StatelessWidget {
  final String label;
  final VoidCallback labelOnTap;
  final IconData iconData;
  final VoidCallback iconOnTap;

  const CustomAppBar2(
      {Key? key,
      required this.label,
      required this.labelOnTap,
      required this.iconData,
      required this.iconOnTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: CustomAppBar(label, labelOnTap, iconData, iconOnTap),
      floating: true,
      pinned: true,
    );
  }
}

class CustomAppBar extends SliverPersistentHeaderDelegate {
  final String _label;
  final VoidCallback _labelOnTap;
  final IconData _iconData;
  final VoidCallback _iconOnTap;

  CustomAppBar(
    this._label,
    this._labelOnTap,
    this._iconData,
    this._iconOnTap,
  );

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      children: [
        Image.asset('assets/images/path.png',color: Colors.black,),
        Container(
          height: 120,
          color: Colors.blue,
          padding: EdgeInsets.fromLTRB(16, 22, 16, 0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: _labelOnTap,
                child: Text(
                  '$_label',
                  style: GoogleFonts.tajawal(color: Colors.white, fontSize: 22),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  width: 220,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              IconButton(
                  onPressed: _iconOnTap,
                  icon: Icon(
                    _iconData,
                    color: Colors.white,
                    size: 30,
                  ))
            ],
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 120;

  @override
  // TODO: implement minExtent
  double get minExtent => 100;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
