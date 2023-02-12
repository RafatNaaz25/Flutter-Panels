// ignore_for_file: no_logic_in_create_state, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return (MyState());
  }
}

class MyState extends State<MyApp> {
  bool flag1 = false;
  bool flag2 = false;

  ExpansionPanelList getPanelList() {
    return (ExpansionPanelList(
      expansionCallback: (panelIndex, isExpanded) {
        setState(() {
          if (panelIndex == 0) {
            flag1 = !isExpanded;
          }
           if (panelIndex == 1) {
            flag2 = !isExpanded;
          }
        });
      },
      children: [
        ExpansionPanel(
            isExpanded: flag1,
            headerBuilder: ((context, isExpanded) {
              return (ListTile(
                title: Text("Item 1"),
              ));
            }),
            body: ListTile(
              title: Text("Ex Item1"),
              subtitle: Text("subTitle1"),
            )),
        ExpansionPanel(
            isExpanded: flag2,
            headerBuilder: ((context, isExpanded) {
              return (ListTile(
                title: Text("Item2"),
              ));
            }),
            body: ListTile(
              title: Text("Ex item2"),
              subtitle: Text("SubTitle2"),
            ))
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      home: Scaffold(
        body: Column(
          children: [getPanelList()],
        ),
        appBar: AppBar(
          title: const Text("Static Panels"),
        ),
      ),
    ));
  }
}
