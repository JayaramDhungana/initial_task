import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:initial_task/bloc/hotels/hotels_bloc.dart';
import 'package:initial_task/bloc/hotels/hotels_state.dart';
import 'package:initial_task/bloc/tabbar/tabbar_bloc.dart';
import 'package:initial_task/bloc/tabbar/tabbar_event.dart';
import 'package:initial_task/provider/hotels_provider.dart';
import 'package:initial_task/screens/home_screen.dart';
import 'package:initial_task/widgets/screen_widgets.dart';

class HotelsScreen extends ConsumerStatefulWidget {
  const HotelsScreen({super.key});

  @override
  ConsumerState<HotelsScreen> createState() => _HotelsScreenState();
}

class _HotelsScreenState extends ConsumerState<HotelsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PopScope(
        onPopInvokedWithResult: (didPop, result) {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) {
          //       return HomeScreen(index: 0);
          //     },
          //   ),
          // );
          context.read<TabbarBloc>().add(ChangeTabIndex(index: 0));
        },
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<HotelsBloc, HotelsState>(
                builder: (context, state) {
                  if (state is HotelsInitialState) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return ListView.builder(
                      itemCount: state.hotelsDataList.length,
                      itemBuilder: (context, index) {
                        final hotelsDataToShow = state.hotelsDataList[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: screenWidget(
                            context: context,
                            imageUrl: hotelsDataToShow.imageUrl,
                            name: hotelsDataToShow.hotelName,
                            description: hotelsDataToShow.description,
                            ratings: hotelsDataToShow.ratings,
                            raters: hotelsDataToShow.raters,
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
