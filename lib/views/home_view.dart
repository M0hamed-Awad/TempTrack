import 'package:flutter/material.dart';
import 'package:temp_track_app/constants.dart';
import 'package:temp_track_app/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
          ),
          backgroundColor: Theme.of(context).primaryColor,
          centerTitle: true,
          title: Image.asset(
            kLogo,
            width: 180,
          ),
          toolbarHeight: 70,
          elevation: 5,
        ),
        body: HomeViewBody(),
      ),
    );
  }
}
