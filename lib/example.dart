import 'package:flutter/material.dart';

class Example3 extends StatefulWidget {
  const Example3({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _Example3State createState() => _Example3State();
}

class _Example3State extends State<Example3> {
  void _showOverlay(BuildContext context) async {

    // Declaring and Initializing OverlayState and
    // OverlayEntry objects
    OverlayState overlayState = Overlay.of(context);
    OverlayEntry overlayEntry1;
    OverlayEntry overlayEntry2;
    OverlayEntry overlayEntry3;
    overlayEntry1 = OverlayEntry(builder: (context) {

      // You can return any widget you like here
      // to be displayed on the Overlay
      return Positioned(
        left: MediaQuery.of(context).size.width * 0.1,
        top: MediaQuery.of(context).size.height * 0.3,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.1,
            color: Colors.pink.withOpacity(0.3),
            child: Material(
              color: Colors.transparent,
              child: Text('I will disappear in 3 seconds',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.03,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ),
          ),
        ),
      );
    });
    overlayEntry2 = OverlayEntry(builder: (context) {

      // You can return any widget you like here
      // to be displayed on the Overlay
      return Positioned(
        left: MediaQuery.of(context).size.width * 0.1,
        top: MediaQuery.of(context).size.height * 0.5,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.1,
            color: Colors.blue.withOpacity(0.3),
            child: Material(
              color: Colors.transparent,
              child: Text('I will disappear in 5 seconds',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.03,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ),
          ),
        ),
      );
    });
    overlayEntry3 = OverlayEntry(builder: (context) {

      // You can return any widget you like
      // here to be displayed on the Overlay
      return Positioned(
        left: MediaQuery.of(context).size.width * 0.1,
        top: MediaQuery.of(context).size.height * 0.7,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.1,
            color: Colors.green.withOpacity(0.3),
            child: Material(
              color: Colors.transparent,
              child: Text('I will disappear in 7 seconds',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.03,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ),
          ),
        ),
      );
    });

    // Inserting the OverlayEntry into the Overlay
    overlayState.insertAll([overlayEntry1, overlayEntry2, overlayEntry3]);

    // Awaiting for 3 seconds
    await Future.delayed(const Duration(seconds: 3));

    // Removing the first OverlayEntry from the Overlay
    overlayEntry1.remove();

    // Awaiting for 2 seconds more
    await Future.delayed(const Duration(seconds: 2));

    // Removing the second OverlayEntry from the Overlay
    overlayEntry2.remove();

    // Awaiting for 2 seconds more
    await Future.delayed(const Duration(seconds: 2));

    // Removing the third OverlayEntry from the Overlay
    overlayEntry3.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'GeeksForGeeks Example 3',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
          child: Center(
              child: MaterialButton(
                color: Colors.green,
                minWidth: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.06,
                child: const Text(
                  'show Overlay',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {

                  //calling the _showOverlay method
                  // when Button is pressed
                  _showOverlay(context);
                },
              ))),
    );
  }
}
