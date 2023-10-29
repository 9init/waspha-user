import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ProductDetails extends HookWidget {
  final id;
  const ProductDetails({super.key, required this.id});

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
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Shampoo",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 20,
                    ),
                    Text("""Serving Size 12 fl oz (355 mL). Servings
          Per Container 1. Amount Per Serving. 
          Calories 0. % Daily Value *. Total Fat 
          0g, 0%. Sodium 35mg, 1% ..."""),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Special Interactions",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    TextField(
                      minLines: 1,
                      maxLines: 6,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Add a note',
                      ),
                    ),
                    SizedBox(
                      height: 80,
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
                      height: 40,
                    ),
                    Center(
                      child: Container(
                        width: 350,
                        height: 70,
                        decoration: BoxDecoration(
                          color: Color(0xff663399),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text("Add ${counter.value} to my request",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BackButton(),
                IconButton(onPressed: () {}, icon: Icon(Icons.report))
              ],
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
              child: Center(child: Text("4.6 (90 ratings)")),
            ),
          ),
              ],
            ),
        ));
  }
}
