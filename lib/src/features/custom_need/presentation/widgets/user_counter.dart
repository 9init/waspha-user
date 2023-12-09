import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:waspha/src/features/custom_need/data/item_data.dart';

class ItemQuantityCounter extends HookWidget {
  const ItemQuantityCounter({Key? key, required this.item}) : super(key: key);
  final Item item;

  @override
  Widget build(BuildContext context) {
    final counter = useState(1);

    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        children: [
          IconButton(onPressed: () {}, icon: Icon(Icons.open_in_full)),
          SizedBox(
            width: 95,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.white,
                  child: IconButton(
                    alignment: Alignment.center,
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      if (item.quantity > 1) {
                        counter.value = item.quantity - 1;
                       item.quantity = counter.value;
                      }
                    },
                    icon: Icon(
                      Icons.remove,
                      size: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Text("${item.quantity}"),
              SizedBox(
                width: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.white,
                  child: Center(
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        counter.value =item.quantity + 1;
                   item.quantity = counter.value;
                      },
                      icon: Center(
                        child: Icon(
                          Icons.add,
                          size: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
