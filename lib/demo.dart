import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'easy_sidemenu Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController page = PageController();

  List priority = ["Dashboard", "Users", "Files", "Downloads", "Settings"];
  String appbarTitle = "Dashboard";

  bool isOpen = false;

  void _isOpen() {
    setState(() {
      if (isOpen == false) {
        isOpen = true;
      } else {
        isOpen = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appbarTitle.toString()),
        centerTitle: true,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SideMenu(
            controller: page,
            style: SideMenuStyle(
              showTooltip: false,

              openSideMenuWidth: 250,

              // showTooltip: false,
              displayMode:
                  isOpen ? SideMenuDisplayMode.open : SideMenuDisplayMode.auto,
              hoverColor: Colors.blue[100],
              selectedColor: Colors.lightBlue,
              selectedTitleTextStyle: const TextStyle(color: Colors.white),
              selectedIconColor: Colors.white,
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.all(Radius.circular(10)),
              // ),
              // backgroundColor: Colors.blueGrey[700]
            ),
            title: Column(
              children: const [
                Divider(
                  indent: 8.0,
                  endIndent: 8.0,
                ),
              ],
            ),
            // footer: const Padding(
            //   padding: EdgeInsets.all(8.0),
            //   child: Text(
            //     'mohada',
            //     style: TextStyle(fontSize: 15),
            //   ),
            // ),
            items: [
              SideMenuItem(
                priority: 0,
                title: priority[0],
                onTap: () {
                  SideMenuDisplayMode.open;
                  page.jumpToPage(0);
                  setState(() {
                    appbarTitle = priority[0];
                  });
                },
                icon: const Icon(Icons.home),
                badgeContent: const Text(
                  '3',
                  style: TextStyle(color: Colors.white),
                ),
                tooltipContent: "This is a tooltip for Dashboard item",
              ),
              SideMenuItem(
                priority: 1,
                title: priority[1],
                onTap: () {
                  page.jumpToPage(1);
                  setState(() {
                    appbarTitle = priority[1];
                  });
                },
                icon: const Icon(Icons.supervisor_account),
              ),
              SideMenuItem(
                priority: 2,
                title: priority[2],
                onTap: () {
                  page.jumpToPage(2);
                  setState(() {
                    appbarTitle = priority[2];
                  });
                },
                icon: const Icon(Icons.file_copy_rounded),
                trailing: Container(
                    decoration: const BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.all(Radius.circular(6))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6.0, vertical: 3),
                      child: Text(
                        'New',
                        style: TextStyle(fontSize: 11, color: Colors.grey[800]),
                      ),
                    )),
              ),
              SideMenuItem(
                priority: 3,
                title: priority[3],
                onTap: () {
                  page.jumpToPage(3);
                  setState(() {
                    appbarTitle = priority[3];
                  });
                },
                icon: const Icon(Icons.download),
              ),
              SideMenuItem(
                priority: 4,
                title: priority[4],
                onTap: () {
                  page.jumpToPage(4);
                  setState(() {
                    appbarTitle = priority[4];
                  });
                },
                icon: const Icon(Icons.settings),
              ),
              // SideMenuItem(
              //   priority: 5,
              //   onTap: () {
              //     page.jumpToPage(5);
              //   },
              //   icon: const Icon(Icons.image_rounded),
              // ),
              // SideMenuItem(
              //   priority: 6,
              //   title: 'Only Title',
              //   onTap: () {
              //     page.jumpToPage(6);
              //   },
              // ),
              SideMenuItem(
                onTap: () {
                  _isOpen();
                },
                priority: 7,
                title: 'Exit',
                icon: Icon(Icons.exit_to_app),
              ),
            ],
          ),

          //pages
          Expanded(
            child: PageView(
              controller: page,
              children: [
                Container(
                  color: Colors.white,
                  child: const Center(
                    child: Text(
                      'Dashboard',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: const Center(
                    child: Text(
                      'Users',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: const Center(
                    child: Text(
                      'Files',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: const Center(
                    child: Text(
                      'Download',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: const Center(
                    child: Text(
                      'Settings',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: const Center(
                    child: Text(
                      'Only Title',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: const Center(
                    child: Text(
                      'Only Icon',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
