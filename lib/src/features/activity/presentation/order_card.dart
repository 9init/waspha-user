import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:waspha/src/features/activity/model/order/order_model.dart';
import 'package:waspha/src/utils/date_helper.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    super.key,
    required this.order,
  });

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 160,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: CachedNetworkImageProvider(
                      order.isPickup
                          ? 'https://images.unsplash.com/photo-1596887772390-2648c0155278?q=80&w=1587&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
                          : 'https://cdn.shopify.com/s/files/1/0584/4425/1314/products/IMG_8760_800x.jpg',
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    order.type,
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Order #${order.proposal_id}",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              Text(order.payment_method?.replaceAll("_", " ") ?? ""),
              Text(
                order.status,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(formatDate(order.order_date)),
                      Text(formatTime(order.order_date)),
                    ],
                  ),
                  Stack(
                    children: [
                      CircleAvatar(
                        backgroundImage: CachedNetworkImageProvider(
                          order.store_image ?? "",
                        ),
                      )
                    ],
                  ),
                ],
              ),
              // Visibility(
              //   visible: true,
              //   child: Padding(
              //     padding: const EdgeInsets.only(left: 5),
              //     child: ListTile(
              //       leading: Icon(Icons.schedule, size: 17),
              //       contentPadding: EdgeInsets.all(1),
              //       title: Text(
              //         "56h:08m:23s",
              //         style: TextStyle(fontSize: 13),
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 10,
              ),
              // Text(
              //   "56h:08m:23s",
              //   style: TextStyle(fontSize: 15),
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Icon(
                    Icons.arrow_forward,
                    size: 17,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
