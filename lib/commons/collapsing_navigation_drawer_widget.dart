import '../custom_navigation_drawer.dart';
import 'package:flutter/material.dart';

class CollapsingNavigationDrawer extends StatefulWidget {
  @override
  CollapsingNavigationDrawerState createState() {
    return CollapsingNavigationDrawerState();
  }
}

class CollapsingNavigationDrawerState extends State<CollapsingNavigationDrawer>
    with SingleTickerProviderStateMixin {

  List widgets = [const DashboardPage(), const ErorrsPage(), const SearchPage(), const NotificationsPage(), const SettingsPage()];

  

  double maxWidth = 210;
  double minWidth = 70;
  bool isCollapsed = false;
  late AnimationController _animationController;
  late Animation<double> widthAnimation;
  int currentSelectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    widthAnimation = Tween<double>(begin: maxWidth, end: minWidth)
        .animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, widget) => getWidget(context, widget),
    );
  }

  Widget getWidget(context, widget) {
    return Material(
      elevation: 80.0,
      child: Row(
        children: [
          Container(
            width: widthAnimation.value,
            color: drawerBackgroundColor,
            child: Column(
              children: <Widget>[
                CollapsingListTile(
                  title: 'Techie',
                  icon: Icons.person,
                  animationController: _animationController,
                  onTap: () {},
                ),
                const Divider(
                  color: Colors.grey,
                  height: 40.0,
                ),
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, counter) {
                      return const Divider(height: 12.0);
                    },
                    itemBuilder: (context, counter) {
                      return CollapsingListTile(
                        onTap: () {
                          setState(() {
                            currentSelectedIndex = counter;
                            
                          });
                        },
                        isSelected: currentSelectedIndex == counter,
                        title: navigationItems[counter].title,
                        icon: navigationItems[counter].icon,
                        animationController: _animationController,
                      );
                    },
                    itemCount: navigationItems.length,
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      isCollapsed = !isCollapsed;
                      isCollapsed
                          ? _animationController.forward()
                          : _animationController.reverse();
                    });
                  },
                  child: AnimatedIcon(
                    icon: AnimatedIcons.close_menu,
                    progress: _animationController,
                    color: selectedColor,
                    size: 50.0,
                  ),
                ),
                const SizedBox(
                  height: 50.0,
                ),
              ],
            ),
          ),
          
          widgets[currentSelectedIndex],
          
        ],
      ),
    );
  }
}


class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Dashboard"),);
  }
}

class ErorrsPage extends StatelessWidget {
  const ErorrsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Erorrs"),);
  }
}

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Search"),);
  }
}

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Notifications"),);
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Settings"),);
  }
}