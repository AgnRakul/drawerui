// ignore_for_file: prefer_const_constructors

import 'package:drawerui/privacy_policy.dart';
import 'package:drawerui/send_feedback.dart';
import 'package:drawerui/settings.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'contacts.dart';
import 'dashboard.dart';
import 'events.dart';
import 'notes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentPage = DrawerSections.dashboard;

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_typing_uninitialized_variables
    var container;
    if (currentPage == DrawerSections.dashboard) {
      container = DashboardPage();
    } else if (currentPage == DrawerSections.finance) {
      container = ContactsPage();
    } else if (currentPage == DrawerSections.people) {
      container = EventsPage();
    } else if (currentPage == DrawerSections.satistics) {
      container = NotesPage();
    } else if (currentPage == DrawerSections.document) {
      container = SettingsPage();
    } else if (currentPage == DrawerSections.chat) {
      container = PrivacyPolicyPage();
    } else if (currentPage == DrawerSections.support) {
      container = SendFeedbackPage();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: const Text("HBoard"),
      ),
      body: container,
      drawer: Drawer(
        backgroundColor: const Color(0xFF1F1F1F),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 14.0),
                  child: Text(
                    "HBoard",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontFamily: "Gilroy-ExtraBold"),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Text(
                    "Tools",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontFamily: "Gilroy-ExtraBold",
                    ),
                  ),
                ),
                myDrawerList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget myDrawerList() {
    return Container(
      padding: const EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          menuItem(1, "Dashboard", const FaIcon(Icons.dashboard_outlined),
              currentPage == DrawerSections.dashboard ? true : false),
          menuItem(2, "Finance", const FaIcon(Icons.money),
              currentPage == DrawerSections.finance ? true : false),
          menuItem(3, "People", const FaIcon(Icons.people),
              currentPage == DrawerSections.people ? true : false),
          menuItem(4, "Satistics", const FaIcon(Icons.star_rate),
              currentPage == DrawerSections.satistics ? true : false),
          menuItem(5, "Document", const FaIcon(Icons.do_disturb),
              currentPage == DrawerSections.document ? true : false),
          const Padding(
            padding: EdgeInsets.all(24.0),
            child: Text(
              "Other",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontFamily: "Gilroy-ExtraBold"),
            ),
          ),
          menuItem(6, "Chat", const FaIcon(Icons.chat),
              currentPage == DrawerSections.chat ? true : false),
          menuItem(7, "Support", const FaIcon(Icons.support),
              currentPage == DrawerSections.support ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(
    int id,
    String title,
    FaIcon i,
    bool selected,
  ) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: selected
              ? BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  gradient: LinearGradient(
                    colors: const [
                      Color(0xFFB987F3),
                      Color(0xFF5BD4EC),
                    ],
                  ),
                )
              : null,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
              setState(() {
                if (id == 1) {
                  currentPage = DrawerSections.dashboard;
                } else if (id == 2) {
                  currentPage = DrawerSections.finance;
                } else if (id == 3) {
                  currentPage = DrawerSections.people;
                } else if (id == 4) {
                  currentPage = DrawerSections.satistics;
                } else if (id == 5) {
                  currentPage = DrawerSections.document;
                } else if (id == 6) {
                  currentPage = DrawerSections.chat;
                } else if (id == 7) {
                  currentPage = DrawerSections.support;
                }
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Expanded(
                    child: FaIcon(
                      i.icon,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Gilroy-ExtraBold"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  dashboard,
  finance,
  people,
  satistics,
  document,
  notifications,
  chat,
  support,
}
