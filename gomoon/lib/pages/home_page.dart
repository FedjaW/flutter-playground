import 'package:flutter/material.dart';
import 'package:gomoon/widgets/custom_dropdown_button.dart';

class HomePage extends StatelessWidget {
  late double _deviceHeight, _deviceWidth;

  /*  const HomePage()
  Creates a compile-time constant.
  Only works if the constructor is marked const and all fields are immutable.
  Can be canonicalized (reused in memory if identical).
  */
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Container(
          height: _deviceHeight,
          width: _deviceWidth,
          padding: EdgeInsets.symmetric(horizontal: _deviceWidth * 0.05),
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [_pageTitle(), _bookRideWidget()],
              ),
              Align(
                alignment: Alignment.centerRight,
                child: _backgroundImageWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _pageTitle() {
    return const Text(
      "#GoMoon",
      style: TextStyle(
        color: Colors.white,
        fontSize: 50,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _bookRideWidget() {
    return Container(
      height: _deviceHeight * 0.25,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _destinationDropDownWidget(),
          _travelersInformationWidget(),
          _rideButton(),
        ],
      ),
    );
  }

  Widget _backgroundImageWidget() {
    return Container(
      height: _deviceHeight * 0.3,
      width: _deviceWidth * 0.6,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fitHeight,
          image: AssetImage("./assets/images/appicon.jpg"),
        ),
      ),
    );
  }

  Widget _destinationDropDownWidget() {
    return CustomDropdownButtonClass(
      values: const ['James Webb Station', 'Preneure Station'],
      width: _deviceWidth,
    );
  }

  Widget _travelersInformationWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomDropdownButtonClass(
          values: const ['1', '2', '3'],
          width: _deviceWidth * 0.45,
        ),
        CustomDropdownButtonClass(
          values: const ['Economy', 'Business', 'First'],
          width: _deviceWidth * 0.40,
        ),
      ],
    );
  }

  Widget _rideButton() {
    return Container(
      margin: EdgeInsets.only(bottom: _deviceHeight * 0.01),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      width: _deviceWidth,
      child: MaterialButton(
        onPressed: () {},
        child: const Text("Book Ride!", style: TextStyle(color: Colors.black)),
      ),
    );
  }
}
