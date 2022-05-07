import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web_app/sections/about/about_section.dart';
import 'package:web_app/sections/contact/contact_section.dart';
import 'package:web_app/sections/feedback/feedback_section.dart';
import 'package:web_app/sections/recent_work/recent_work_section.dart';
import 'package:web_app/sections/service/service_section.dart';
import 'package:web_app/sections/topSection/top_section.dart';
import '../../../constants.dart';


class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int selectedIndex = 0;
  int hoverIndex = 0;
  List<String> menuItems = [
    "Home",
    "About",
    "Services",
    "Portfolio",
    "Feedback",
    "Contact"
  ];
  ScrollController _scrollController = new ScrollController();
  var aboutKey = GlobalKey();
  var serviceKey = GlobalKey();
  var recentKey = GlobalKey();
  var feedKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    double wid=MediaQuery.of(context).size.width;
    double high=MediaQuery.of(context).size.height;
    if( wid < 350 && high < 300 || wid < 330 ){
      return Container(
        alignment: Alignment.center,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/images/Storage Not Enough.png"),
          ),
        ),
      );
    } else if( high <= 85 ){
      return Text("Height is not enough to display App");
    } else{
      return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              myAppBar(context),
              Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    children: [
                      TopSection(),
                      AboutSection(
                        key: aboutKey,
                      ),
                      ServiceSection(
                        key: serviceKey,
                      ),
                      RecentWorkSection(
                        key: recentKey,
                      ),
                      FeedbackSection(
                        key: feedKey,
                      ),
                      ContactSection(),
                    ]
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
  Widget myAppBar(BuildContext context) =>  SizedBox(
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.5),
      constraints: BoxConstraints(
        maxHeight: 85,
        maxWidth: MediaQuery.of(context).size.width,
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width*0.1,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        boxShadow: [kDefaultShadow],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          menuItems.length,
              (index) => buildMenuItem(index),
        ),
      ),
    ),
  );

  Widget buildMenuItem(int index) => InkWell(
        onTap: () => insertItem(index),
        onHover: (value) {
          setState(() {
            value ? hoverIndex = index : hoverIndex = selectedIndex;
          });
        },
        child: Container(
          constraints: BoxConstraints(minWidth: MediaQuery.of(context).size.width*0.09),
          height: 100,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Text(
                menuItems[index],
                style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.02,
                    color: kTextColor),
              ),
              // Hover
              AnimatedPositioned(
                duration: Duration(milliseconds: 200),
                left: 0,
                right: 0,
                bottom:
                    selectedIndex != index && hoverIndex == index ? -20 : -32,
                child: Image.asset("assets/images/Hover.png"),
              ),
              // Select
              AnimatedPositioned(
                duration: Duration(milliseconds: 200),
                left: 0,
                right: 0,
                bottom: selectedIndex == index ? -2 : -32,
                child: Image.asset("assets/images/Hover.png"),
              ),
            ],
          ),
        ),
      );

  void insertItem(int index) {
    setState(() {
      selectedIndex = index;
          if (index == 0) {
            _scrollController.animateTo(
              0.0,
              curve: Curves.easeOut,
              duration: const Duration(milliseconds: 300),
            );
          }  else if (index == 1) {
            _scrollController.animateTo(
              500,
              curve: Curves.easeOut,
              duration: const Duration(milliseconds: 300),
            );
          } else if(index == 2) {
            _scrollController.animateTo(
              500 + aboutKey.currentContext.size.height,
              curve: Curves.easeOut,
              duration: const Duration(milliseconds: 300),
            );
          } else if(index == 3) {
            _scrollController.animateTo(
              500 + aboutKey.currentContext.size.height
                  + serviceKey.currentContext.size.height,
              curve: Curves.easeOut,
              duration: const Duration(milliseconds: 300),
            );
          } else if(index == 4) {
            _scrollController.animateTo(
              500 + aboutKey.currentContext.size.height
                  + serviceKey.currentContext.size.height
                  + recentKey.currentContext.size.height,
              curve: Curves.easeOut,
              duration: const Duration(milliseconds: 300),
            );
          } else {
            _scrollController.animateTo(
              500 + aboutKey.currentContext.size.height
                  + serviceKey.currentContext.size.height
                  + recentKey.currentContext.size.height
                  + feedKey.currentContext.size.height,
              curve: Curves.easeOut,
              duration: const Duration(milliseconds: 300),
            );
          }
        });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        double set=_scrollController.offset;
        if ( set < 300) {
          selectedIndex = 0 ;
          hoverIndex = 0;
        } else if ( set >= 300 && set < 300 + aboutKey.currentContext.size.height) {
          selectedIndex = 1 ;
          hoverIndex = 1;
        } else if ( set >= 300 + aboutKey.currentContext.size.height
            && set < 300 + aboutKey.currentContext.size.height
                + serviceKey.currentContext.size.height) {
          selectedIndex = 2 ;
          hoverIndex = 2;
        } else if ( set >= 300 + aboutKey.currentContext.size.height
            + serviceKey.currentContext.size.height
            && set < 300 + aboutKey.currentContext.size.height
                + serviceKey.currentContext.size.height
                + recentKey.currentContext.size.height) {
          selectedIndex = 3 ;
          hoverIndex = 3;
        } else if ( set >= 300 + aboutKey.currentContext.size.height
            + serviceKey.currentContext.size.height
            + recentKey.currentContext.size.height
            && set < 300 + aboutKey.currentContext.size.height
                + serviceKey.currentContext.size.height
                + recentKey.currentContext.size.height
                + feedKey.currentContext.size.height) {
          selectedIndex = 4 ;
          hoverIndex = 4;
        } else {
          selectedIndex = 5 ;
          hoverIndex = 5;
        }
      });
    });
  }
}