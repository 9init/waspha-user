// ignore_for_file: must_be_immutable

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phone_form_field/phone_form_field.dart';
import 'package:waspha/src/features/custom_need/presentation/custom_need.dart';
import 'package:waspha/src/features/nearby_stores/domain/stores_repository.dart';

import '../domain/likes_domain.dart';
import 'choose_location.dart';
import 'contact_list.dart';

class AddAddressScreen extends StatefulHookConsumerWidget {
  AddAddressScreen({super.key});

  @override
  ConsumerState<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends ConsumerState<AddAddressScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _titleController = TextEditingController();

  TextEditingController _landmarkController = TextEditingController();

  PhoneController _phoneController =
      PhoneController(PhoneNumber(isoCode: IsoCode.KW, nsn: ""));

  final List<String> iconsImages = [
    "assets/images/address/home.svg",
    "assets/images/address/work.svg",
    "assets/images/address/beach.svg"
  ];
  Map<int, bool> homeChecked = {0: true, 1: false, 2: false};

  _initMap(WidgetRef ref) {
    return FutureBuilder(
      future: ref.read(userLocationProvider.future),
      builder: (BuildContext context, AsyncSnapshot<LatLng> data) {
        final location = data.data;
        if (location == null) return Center(child: CircularProgressIndicator());

        final Completer<GoogleMapController> _controller =
            Completer<GoogleMapController>();

        _onMapCreated(GoogleMapController controller) {
          // TODO - Check whhy this is not working
          controller.setMapStyle(
              '[{"featureType": "poi","stylers": [{"visibility": "off"}]}]');
          _controller.complete(controller);
        }

        CameraPosition _kGooglePlex = CameraPosition(
          target: location,
          zoom: 14.4746,
        );

        return AbsorbPointer(
          absorbing: true,
          child: GoogleMap(
            initialCameraPosition: _kGooglePlex,
            myLocationButtonEnabled: false,
            onMapCreated: _onMapCreated,
            markers: Set.from(
              [Marker(markerId: MarkerId("location"), position: location)],
            ),
          ),
        );
      },
    );
  }

  initState() {
    super.initState();
    final contactNumber = ref.read(getContactProvider);
    if (contactNumber != "") {
      _phoneController =
          PhoneController(PhoneNumber(isoCode: IsoCode.KW, nsn: contactNumber));
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMeChecked = useState(true);
    final isOtherChecked = useState(false);

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CustomCloseButton(),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Add new address",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            spreadRadius: 1)
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Pick an icon",
                                style: TextStyle(fontSize: 16)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 80,
                            child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount: 3,
                                separatorBuilder: (context, index) => SizedBox(
                                      width: 10,
                                    ),
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      homeChecked[index] = true;

                                      setState(() {
                                        for (int i = 0;
                                            i < homeChecked.length;
                                            i++) {
                                          if (i != index) {
                                            homeChecked[i] = false;
                                          }
                                        }
                                      });
                                    },
                                    child: Column(
                                      children: [
                                        SvgPicture.asset(
                                          iconsImages[index],
                                          width: 30,
                                          height: 30,
                                        ),
                                        Transform.scale(
                                          scale: 0.8,
                                          child: Checkbox(
                                              shape: CircleBorder(),
                                              value: homeChecked[index],
                                              onChanged: (v) {
                                                setState(() {
                                                  homeChecked[index] = v!;
                                                });

                                                for (int i = 0;
                                                    i < homeChecked.length;
                                                    i++) {
                                                  if (i != index) {
                                                    homeChecked[i] = false;
                                                  }
                                                }
                                              }),
                                        )
                                      ],
                                    ),
                                  );
                                }),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Form(
                                key: _formKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: TextFormField(
                                        controller: _titleController,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Title is required";
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          labelText: "Address Title",
                                          hintText: "Enter title",
                                          border: UnderlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("Used phone no.",
                                          style: TextStyle(
                                            fontSize: 16,
                                          )),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    ListTile(
                                      onTap: () {
                                        isMeChecked.value = true;
                                        isOtherChecked.value = false;
                                      },
                                      leading: Transform.scale(
                                        scale: 0.8,
                                        child: SizedBox(
                                          width: 10,
                                          child: Checkbox(
                                              shape: CircleBorder(),
                                              value: isMeChecked.value,
                                              onChanged: (v) {
                                                isMeChecked.value = v!;
                                                isOtherChecked.value = !v;
                                              }),
                                        ),
                                      ),
                                      title: Text("me"),
                                    ),
                                    ListTile(
                                      onTap: () {
                                        isOtherChecked.value = true;
                                        isMeChecked.value = false;
                                      },
                                      leading: Transform.scale(
                                        scale: 0.8,
                                        child: SizedBox(
                                          width: 10,
                                          child: Checkbox(
                                              value: isOtherChecked.value,
                                              shape: CircleBorder(),
                                              onChanged: (v) {
                                                isOtherChecked.value = v!;
                                                isMeChecked.value = !v;
                                              }),
                                        ),
                                      ),
                                      title: Text("other",
                                          style: TextStyle(fontSize: 16)),
                                      trailing: SizedBox(
                                        width: 150,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.black
                                                        .withOpacity(0.1),
                                                    blurRadius: 10,
                                                    spreadRadius: 1)
                                              ]),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                  hintText: "Name",
                                                  border: InputBorder.none),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.1),
                                                  blurRadius: 10,
                                                  spreadRadius: 1)
                                            ]),
                                        child: PhoneFormField(
                                          controller: _phoneController,
                                          decoration: InputDecoration(
                                              border: InputBorder.none),
                                          showFlagInInput: true,
                                          defaultCountry: IsoCode.KW,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Consumer(builder: (context, ref, child) {
                                      return Align(
                                        alignment: Alignment.centerRight,
                                        child: GestureDetector(
                                          onTap: () async {
                                            if (await FlutterContacts
                                                .requestPermission()) {
                                              List<Contact> contacts =
                                                  await FlutterContacts
                                                      .getContacts(
                                                withProperties: true,
                                              );
                                              context.push('/contacts',
                                                  extra: contacts);
                                            }
                                          },
                                          child: Container(
                                              width: 244,
                                              height: 44,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF663399),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "Pick from contact list",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              )),
                                        ),
                                      );
                                    }),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 250,
                                          child: TextFormField(
                                            controller: _landmarkController,
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return "Landmark is required";
                                              }
                                              return null;
                                            },
                                            decoration: InputDecoration(
                                              labelText: "Landmark",
                                              hintText: "Landmark",
                                              border: UnderlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Icon(Icons.info)
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("Location",
                                          style: TextStyle(
                                            fontSize: 16,
                                          )),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        context.push('/choose_location');
                                      },
                                      child: Container(
                                        height: 100,
                                        child: Stack(
                                          children: [
                                            _initMap(ref),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 30,
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text("Location"),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  () {
                                                    final details = ref.watch(
                                                        getChoosenLocationProvider);

                                                    final text =
                                                        details["address"] == ""
                                                            ? "Choose location"
                                                            : details[
                                                                "address"];
                                                    return Text(text);
                                                  }()
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Consumer(
                                      builder: (context, ref, child) {
                                        return SizedBox(
                                          height: 50,
                                          width: double.infinity,
                                          child: ElevatedButton(
                                            style: ButtonStyle(
                                              shape: MaterialStatePropertyAll(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15))),
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Color(0xFF663399)),
                                            ),
                                            onPressed: () {
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                ref
                                                    .read(addLocationProvider(
                                                      landmark:
                                                          _landmarkController
                                                              .text,
                                                      title:
                                                          _titleController.text,
                                                      phone: _phoneController
                                                          .value!.international
                                                          .toString(),
                                                    ).future)
                                                    .then(
                                                      (value) =>
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                        SnackBar(
                                                          content: Text(value),
                                                        ),
                                                      ),
                                                    );
                                              }
                                            },
                                            child: Text(
                                              "Save",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 17),
                                            ),
                                          ),
                                        );
                                      },
                                    )
                                  ],
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
