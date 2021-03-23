import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter',
    home: SecondScreen(),
  ));
}

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() {
    return _SecondScreenState();
  }
}

class _SecondScreenState extends State<SecondScreen> {
  // this allows us to access the TextField text
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();
  final ItemPositionsListener itemListner =
  ItemPositionsListener.create();
int updatedVal;
@override



  var index_value;
  var value;
  @override
  Widget build(BuildContext context) {
    var fer;
    return Scaffold(
      appBar: AppBar(
          title: Container(
            color: Colors.pink,
            height: 50,
            child: Text("Scroll_to_index"),
          )),
      body: Column(
        children: [
          Expanded(
            child: ScrollablePositionedList.builder(itemCount: 45,
                itemPositionsListener: itemPositionsListener,
                itemScrollController: itemScrollController,
                itemBuilder: (context,index){
                  updatedVal = positons_finding(itemPositionsListener.itemPositions);
                  print(updatedVal);
               return Column(
                  children: [
                     Container(
                       height:1080,
                       width:455,
                       child: Card(
                         color:Colors.green,
                         child: Center(child: Text("Harish" +index.toString(),textAlign: TextAlign.center,)),
                       ),
                     )
                  ],
               );
            }),
          )

        ],
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          _scrollToIndex();
        },
      ),

      );
  }

  positons_finding(ValueListenable<Iterable<ItemPosition>> itemPositions) {
    int first_item = 0;
    var positions = itemPositions.value;
    if (positions.isNotEmpty) {
      first_item = positions
          .where((ItemPosition position) => position.itemTrailingEdge > 0)
          .reduce((ItemPosition min, ItemPosition position) =>
              position.itemTrailingEdge < min.itemTrailingEdge ? position : min)
          .index;
      print(first_item);
    }
    return first_item;
  }

     Future _scrollToIndex() async {
       await itemScrollController.jumpTo(index: 10);

   }
}
