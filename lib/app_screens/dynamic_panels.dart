// ignore_for_file: no_logic_in_create_state, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';

class MyApp1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return (MyState());
  }
}

class Item {
  String item = "";
  String subitem = "";
  Item({required this.item, required this.subitem});
}

class MyState extends State<MyApp1> {
  List<bool> states = [false, false];

  ExpansionPanelList getPanelList() {
    List<ExpansionPanel> panels = [];
    List<Item> items = [
      Item(item: "Item3", subitem: "subItem3"),
      Item(item: "Item4", subitem: "subItem4"),
    ];

    for (int i = 0; i < items.length; i++) {
      panels.add(ExpansionPanel(
          isExpanded: states[i],
          headerBuilder: ((context, isExpanded) {
            return (ListTile(title: Text(items[i].item)));
          }),
          body: ListTile(
            title: Text(items[i].item),
            subtitle: Text(items[i].subitem),
          )));
    }
    return (ExpansionPanelList(
      children: panels,
      expansionCallback: (panelIndex, isExpanded) {
        setState(() {
          states[panelIndex] = !isExpanded;
        });
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [getPanelList()],
        ),
        appBar: AppBar(
          title: const Text("Dynamic Panels"),
        ),
      ),
    ));
  }
}
