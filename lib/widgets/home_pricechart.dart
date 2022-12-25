import 'package:flutter/material.dart';

class PriceChart extends StatefulWidget {
  const PriceChart({
    Key? key,
  }) : super(key: key);

  @override
  State<PriceChart> createState() => _PriceChartState();
}

class _PriceChartState extends State<PriceChart> with SingleTickerProviderStateMixin{
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 40, 20, 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          
          Align(alignment: Alignment.centerLeft ,child: Text("Price Chart", style: Theme.of(context).textTheme.headline3,)),
          const SizedBox(height: 10,),
          Container(
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Color(0xff212427)),
            child: TabBarView(
              controller: tabController, 
              children: <Widget>[
                 Center(child: Text("Data of prices should be added from service model", textAlign: TextAlign.center ,style: Theme.of(context).textTheme.labelMedium)),
                 Center(child: Text("Data should be added",style: Theme.of(context).textTheme.labelMedium)),
                 Center(child: Text("Dummy data", style: Theme.of(context).textTheme.labelMedium),),
              ]
             
            ),
            ),
            TabPageSelector(
                  controller: tabController,
                  color: Colors.grey[300],
                  selectedColor: Colors.grey,
                  borderStyle: BorderStyle.none,
                  indicatorSize: 10,
                )
        ]),
    );
  }
}