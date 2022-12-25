import 'package:flutter/material.dart';

class StepsImage extends StatefulWidget {
  const StepsImage({
    Key? key,
  }) : super(key: key);

  @override
  State<StepsImage> createState() => _StepsImageState();
}

class _StepsImageState extends State<StepsImage> with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    
    tabController = TabController(length: 5, vsync: this); //length is hardcode **should change
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Align(alignment: Alignment.centerLeft, child: Padding(padding: EdgeInsets.only(left: 20), child: Text("Steps to wash", style: Theme.of(context).textTheme.headline3,))),
        SizedBox(
          height: 320,
          
          width: double.infinity,
          child: TabBarView(
            controller: tabController,
            children: [
              Image.asset("assets/w1.png"),
              Image.asset("assets/w2.png"),
              Image.asset("assets/w3.png"),
              Image.asset("assets/w4.png"),
              Image.asset("assets/w5.png"),
            ],
          )
          
        ),
        TabPageSelector(
                  controller: tabController,
                  color: Colors.grey[300],
                  selectedColor: Colors.grey[800],
                  borderStyle: BorderStyle.none,
                  indicatorSize: 10,
        ),
        const SizedBox(height: 40,)

      ],
    );
  }
}