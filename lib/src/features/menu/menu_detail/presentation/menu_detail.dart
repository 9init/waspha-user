import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:waspha/src/features/custom_need/presentation/custom_need.dart';
import 'package:waspha/src/features/menu/menu_detail/domain/menu_detail.dart';
import 'package:flutter/services.dart';

import '../../../../widgets/nearby_store/domain/nearby_domain.dart';
import '../../../login/domain/login_domain.dart';

final storeIDProvider = StateProvider<int>((ref) => 0);

class MenuDetailScreen extends ConsumerWidget {
  final id;
  const MenuDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("BEE $id");
    return Scaffold(
      body: Consumer(builder: (context, ref, child) {
        final storeDetails = ref.watch(getStoresDetailsProvider(id: id));
        return storeDetails.when(
            data: (data) {
              return MenuDetailsBody(
                id: id,
                isFavorite: data["is_favorite"],
                imageURL: data["image"],
                address: data["more_information"]["address"],
                name: data["business_name"]["en"],
                timings: data["timings"],
                ratings: data["average_rating"].toDouble(),
                categories:
                    data["categories"].map((e) => e["name"]["en"]).join(" - "),
              );
            },
            error: (e, s) {
              return Center(child: Text("Error"));
            },
            loading: () => Center(child: CircularProgressIndicator()));
      }),
    );
  }
}

class MenuDetailsBody extends HookWidget {
  const MenuDetailsBody({
    super.key,
    required this.id,
    required this.imageURL,
    required this.address,
    required this.name,
    required this.ratings,
    required this.timings,
    required this.categories,
    required this.isFavorite,
  });

  final id;
  final bool isFavorite;
  final String imageURL, address, name;

  final double ratings;
  final timings, categories;
  String convertTimeToAMPM(String timeString) {
    // Parse the time string into a DateTime object
    final DateTime time = DateTime.parse('1970-01-01 ' + timeString);

    // Format the DateTime object with AM/PM
    final DateFormat ampmFormat = DateFormat('h:mm a');
    return ampmFormat.format(time);
  }

  @override
  Widget build(BuildContext context) {
    final isExpanded = useState(false);
    final maxLines = isExpanded.value ? 100 : 2;
    final isStoreFavored = useState<bool>(false);

    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 170,
                decoration: BoxDecoration(
                  color: Colors.red,
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(imageURL),
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 35,
                        height: 35,
                        child: CustomBackButton(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                        ),
                      ),
                    ),
                    Consumer(builder: (context, ref, child) {
                      return IconButton(
                        icon: Icon(
                          Icons.favorite,
                          color: isFavorite || isStoreFavored.value
                              ? Colors.red
                              : Colors.white,
                        ),
                        onPressed: () async {
                          final isLogged =
                              await ref.watch(isLoggedInProvider.future);
                          if (!isLogged) {
                            showAdaptiveDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      title: Text('Login'),
                                      content: Text(
                                          'You need to login to add this store to your favorites'),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              context.push('/login');
                                            },
                                            child: Text('Login')),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text('Cancel')),
                                      ],
                                    ));
                            return;
                          }

                          if (isFavorite || isStoreFavored.value) {
                            isStoreFavored.value = false;
                            ref.read(deleteStoreFavProvider(id: id));
                            ref.invalidate(getStoresDetailsProvider(id: id));
                          } else {
                            isStoreFavored.value = true;
                            await ref.read(addStoreFavProvider(id: id));
                            ref.invalidate(getStoresDetailsProvider(id: id));
                          }
                        },
                      );
                    }),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 130),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.red,
                    backgroundImage: CachedNetworkImageProvider(imageURL),
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
                name,
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
            onTap: () {
              isExpanded.value = !isExpanded.value;
            },
            title: Text(
              categories,
              maxLines: maxLines,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: isExpanded.value
                ? Icon(Icons.exposure_minus_1)
                : Icon(Icons.add),
          ),
          SizedBox(height: 15),
          ListTile(
            onTap: () => context.push('/menu_reviews', extra: id),
            leading: Icon(Icons.star),
            title: Text("$ratings"),
            trailing: Icon(Icons.arrow_forward),
          ),
          SizedBox(height: 15),
          ListTile(
            onTap: () async {
              await Clipboard.setData(ClipboardData(text: address));
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text("Copied to clipboard")));
            },
            leading: Icon(Icons.location_on),
            title: Text(address),
            trailing: Icon(Icons.copy),
          ),
          SizedBox(height: 15),
          ListTile(
            leading: Icon(Icons.lock_clock),
            title: Text(
                "${timings != "fulltime" ? "Opens until " + convertTimeToAMPM(timings?[0]["to"]) : "Fulltime"}"),
            trailing: Icon(Icons.exposure_minus_1),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Visibility(
                visible: timings == "fulltime",
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Every day",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("Full time"),
                  ],
                ),
              ),
            ),
          ),
          Visibility(
            visible: timings != "fulltime",
            child: Container(
              alignment: Alignment.center,
              child: Center(
                child: ListView.builder(
                    itemCount: timings?.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(horizontal: 80),
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(timings?[index]["day"],
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(convertTimeToAMPM(timings?[index]["from"]) +
                              " - " +
                              convertTimeToAMPM(timings?[index]["to"]))
                        ],
                      );
                    }),
              ),
            ),
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer(builder: (context, ref, child) {
                return DetailsCard(
                  widget: Image.asset(
                    'assets/images/nearby/custom_need.png',
                    width: 50,
                  ),
                  text: "Custom Need",
                  onPressed: () {
                    ref.read(storeIDProvider.notifier).update((state) => id);

                    return context.push(
                      '/custom_need_screen',
                      extra: true,
                    );
                  },
                );
              }),
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
