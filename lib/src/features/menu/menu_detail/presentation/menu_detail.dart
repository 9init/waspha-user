import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final storeIDProvider = StateProvider<int>((ref) => 0);

class MenuDetailScreen extends StatelessWidget {
  final id;
  const MenuDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    print("BEE $id");
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.red,
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(
                        'https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8fA%3D%3D&w=1000&q=80'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
              ),
              SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.favorite,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 150),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.red,
                    backgroundImage: CachedNetworkImageProvider(
                        'https://seeklogo.com/images/N/noon-com-logo-3D35F15324-seeklogo.com.png'),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'noon express down \n town Alexandria',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                  onPressed: () {
                    showAdaptiveDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: Text('Report'),
                              content: Text(
                                  'Are you sure you want to report this store?'),
                              actions: [
                                TextButton(
                                    onPressed: () {}, child: Text('Yes')),
                                TextButton(onPressed: () {}, child: Text('No')),
                              ],
                            ));
                  },
                  icon: Icon(Icons.report))
            ],
          ),
          SizedBox(height: 20),
          ListTile(
            title: Text(
                'Grocery - Vegetables - Cosmetics - Butcher -Electrics - Sandwi  …. '),
            trailing: Icon(Icons.add),
          ),
          SizedBox(height: 15),
          ListTile(
            leading: Icon(Icons.star),
            title: Text('4.6 (90 ratings)'),
            trailing: Icon(Icons.arrow_forward),
          ),
          SizedBox(height: 15),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text('51 Smoha Midan ama nwellsquear alexndria egypt'),
            trailing: Icon(Icons.arrow_forward),
          ),
          SizedBox(height: 15),
          ListTile(
            leading: Icon(Icons.lock_clock),
            title: Text('Open until 11:56 PM'),
            trailing: Icon(Icons.minimize),
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DetailsCard(
                widget: Image.asset(
                  'assets/images/nearby/custom_need.png',
                  width: 50,
                ),
                text: "Custom Need",
                onPressed: () => context.push(
                  '/custom_need_screen',
                  extra: true,
                ),
              ),
              SizedBox(width: 20),
              DetailsCard(
                widget: Icon(Icons.rotate_90_degrees_ccw),
                text: "Re request",
              ),
              SizedBox(width: 20),
              Consumer(
                builder: (context, ref, child) => DetailsCard(
                  onPressed: () {
                    print("BEFORE ID: $id");
                    context.push('/menu-offer', extra: id);
                  },
                  widget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text("Menu"), Icon(Icons.arrow_forward)],
                  ),
                  text: "",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DetailsCard extends StatelessWidget {
  const DetailsCard({
    super.key,
    required this.widget,
    required this.text,
    this.onPressed,
  });
  final Widget widget;
  final String text;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 2,
                  spreadRadius: 1,
                  offset: Offset(0, 3),
                ),
              ]),
          child: CircleAvatar(
            radius: 40,
            backgroundColor: Colors.white,
            child: IconButton(
              icon: widget,
              onPressed: onPressed,
            ),
          ),
        ),
        SizedBox(height: 5),
        Text(text)
      ],
    );
  }
}
