import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../custom_need/data/item_data.dart';
import '../../../custom_need/presentation/custom_need.dart';

class ProductDetails extends StatefulHookWidget {
  final data;
  const ProductDetails({super.key, required this.data});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final TextEditingController _noteController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final counter = useState(1);
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(widget.data["image"]),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.data["title"],
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 20,
                    ),
                    Text(widget.data["description"]),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Special Interactions",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    TextField(
                      minLines: 1,
                      maxLines: 6,
                      controller: _noteController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Add a note',
                      ),
                    ),
                    SizedBox(
                      height: 160,
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
                                if (counter.value > 1) {
                                  print("PRODUCT ID :" +
                                      widget.data["id"].toString());
                                  counter.value--;
                                }
                              },
                              icon: Icon(
                                Icons.minimize,
                                size: 20,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text("${counter.value}"),
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
                                onPressed: () => counter.value++,
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
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Consumer(builder: (context, ref, child) {
                        final items = ref.watch(itemsProvider);

                        return GestureDetector(
                          onTap: () {
                            // check if item already exists
                            for (var item in items) {
                              if (item.product_id == widget.data["id"]) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            'Item already added to request')));
                                return;
                              }
                            }

                            items.insert(
                                0,
                                Item(
                                    deleteCallback: (item) {
                                      items.remove(item);
                                    },
                                    name: widget.data["title"],
                                    image: widget.data["image"],
                                    quantity: counter.value,
                                    additional_notes: _noteController.text,
                                    product_id: widget.data["id"]));
                            ref.refresh(itemsProvider);

                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Item added')));
                          },
                          child: Center(
                            child: Container(
                              width: 350,
                              height: 70,
                              decoration: BoxDecoration(
                                color: Color(0xff663399),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Text(
                                    "Add ${counter.value} to my request",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      height: 40,
                      width: 40,
                      child: CustomBackButton(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                      )),
                  IconButton(onPressed: () {}, icon: Icon(Icons.report))
                ],
              ),
            ),
          ),
          Positioned(
            top: 257,
            left: 0,
            child: Container(
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 3.0),
                child: Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star, color: Colors.orange, size: 20),
                    Text("4.6 (90 ratings)"),
                  ],
                )),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
