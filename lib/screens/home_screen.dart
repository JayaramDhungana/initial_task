import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:initial_task/provider/change_index_provider.dart';
import 'package:initial_task/screens/hotels_screen.dart';
import 'package:initial_task/screens/over_view_screen.dart';
import 'package:initial_task/screens/restaurant_screens.dart';
import 'package:initial_task/screens/things_to_do_screens.dart';
import 'package:initial_task/widgets/tab_bar_options_widgets.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 4, vsync: this);

    _tabController.addListener(() {});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final indexFromProvider = ref.watch(changeIndexProvider).index;
    final selectedIndex = indexFromProvider;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        leading: Icon(Icons.arrow_back_ios, color: Colors.white),
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          "Pokhara",
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        actionsPadding: EdgeInsets.symmetric(horizontal: 15),
        actions: [
          Icon(Icons.share, color: Colors.white),
          SizedBox(width: 10),
          Icon(Icons.favorite, color: Colors.red),
        ],
        bottom: TabBar(
          onTap: (value) {
            ref.read(changeIndexProvider).changeIndex(value);
          },
          controller: _tabController,
          dividerColor: Colors.transparent,

          indicator: BoxDecoration(),
          indicatorColor: Colors.transparent,
          isScrollable: true,

          labelColor: Colors.black,
          unselectedLabelColor: Colors.white,

          tabs: [
            Tab(
              child: tabBarOptionsWidgets(
                color: Colors.green,
                icon: Icon(Icons.folder),
                text: "OverView",
                isSelected: selectedIndex == 0,
              ),
            ),
            Tab(
              child: tabBarOptionsWidgets(
                color: Colors.green,
                icon: Icon(Icons.hotel),
                text: "Hotels",
                isSelected: selectedIndex == 1,
              ),
            ),
            Tab(
              child: tabBarOptionsWidgets(
                color: Colors.green,
                icon: Icon(Icons.restaurant),
                text: "Restaurants",
                isSelected: selectedIndex == 2,
              ),
            ),
            Tab(
              child: tabBarOptionsWidgets(
                color: Colors.green,
                icon: Icon(Icons.workspace_premium),
                text: "Things To DO",
                isSelected: selectedIndex == 3,
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          OverViewScreen(),
          HotelsScreen(),
          RestaurantScreens(),
          ThingsToDoScreens(),
        ],
      ),
    );
  }
}
