import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  OverlayEntry? _overlayEntry;
  final GlobalKey _widgetKey = GlobalKey();

  @override
  void initState() {
    //WidgetsBinding.instance.addPostFrameCallback(_getWidgetInfo);
    // TODO: implement initState
    super.initState();
  }

  OverlayEntry _createOverlay(BuildContext context) {
    final RenderBox renderBox =
        _widgetKey.currentContext?.findRenderObject() as RenderBox;
    var size = renderBox.size;
    final Offset offSet = renderBox.localToGlobal(Offset.zero);
    return OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        left: MediaQuery.of(context).size.width > offSet.dx + 2 * size.width
            ? offSet.dx + size.width
            : offSet.dx - size.width,
        top: MediaQuery.of(context).size.height > offSet.dy + 2 * size.height
            ? offSet.dy + size.height
            : offSet.dy - size.height,
        child: Material(
          elevation: 5.0,
          child: Container(
              padding: const EdgeInsets.all(8),
              color: Colors.green,
              child: const Text('here is the overlay')),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print('screen height: ${MediaQuery.of(context).size.height}');
    print('screen width: ${MediaQuery.of(context).size.width}');
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100, left: 60),
              child: GestureDetector(
                key: _widgetKey,
                onTap: () async {
                  if (_overlayEntry == null) {
                    _overlayEntry = _createOverlay(context);
                    Overlay.of(context).insert(_overlayEntry!);
                    await Future.delayed(const Duration(seconds: 3));
                    _overlayEntry!.remove();
                    _overlayEntry = null;
                  } else {
                    _overlayEntry!.remove();
                    _overlayEntry = null;
                  }
                },
                child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(8)),
                    child: const Text('Tap here')),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            FocusedMenuHolder(
              menuWidth: MediaQuery.of(context).size.width * 0.9,
              blurSize: 5.0,
              menuItemExtent: 45,
              menuBoxDecoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
              duration: const Duration(milliseconds: 100),
              animateMenuItems: true,
              blurBackgroundColor: Colors.black54,
              openWithTap:
                  true, // Open Focused-Menu on Tap rather than Long Press
              menuOffset:
                  10.0, // Offset value to show menuItem from the selected item
              bottomOffsetHeight:
                  80.0, // Offset height to consider, for showing the menu item ( for example bottom navigation bar), so that the popup menu will be shown on top of selected item.
              menuItems: <FocusedMenuItem>[
                // Add Each FocusedMenuItem  for Menu Options
                FocusedMenuItem(
                    title: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: TextFormField(
                        autofocus: true,
                        decoration: const InputDecoration(
                            hintText: 'text', border: InputBorder.none),
                      ),
                    ),
                    trailingIcon: const Icon(
                      Icons.send,
                      color: Colors.green,
                      size: 20,
                    ),
                    onPressed: () {}),
                // FocusedMenuItem(title: Text("Share"),trailingIcon: Icon(Icons.share) ,onPressed: (){}),
                // FocusedMenuItem(title: Text("Favorite"),trailingIcon: Icon(Icons.favorite_border) ,onPressed: (){}),
                // FocusedMenuItem(title: Text("Delete",style: TextStyle(color: Colors.redAccent),),trailingIcon: Icon(Icons.delete,color: Colors.redAccent,) ,onPressed: (){}),
              ],
              onPressed: () {},
              child: Container(
                width: 120,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8), color: Colors.grey),
                child: const Text(
                  'Hii friend',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                ),
              ),
            )
          ],
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
