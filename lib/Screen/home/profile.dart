import 'package:fireappx/Screen/home/Sectionlist.dart';

import 'package:flutter/material.dart';

/*
 * 
 * Profile Screen you can see all profile information 
 * 
 * 
 * 
 */
class Profile extends StatelessWidget {
  const Profile({
    super.key,
    required this.name,
    required this.number,
    required this.ontap,
    required this.url,
    required this.medal,
  });
  final String name;
  final String number;
  final VoidCallback ontap;
  final String url;
  final String medal;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
          height: height * 0.22,
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xfff12002E)),

          // Manage your Membership
          child: Sectionlist(
              ontap: ontap,
              imageicon: "assets/image/icon-gold-star.png",
              text: "Manage your membership "),
        ),

        //
        //
        //     Profile Pricture and Name
        //
        //
        //

        Container(
          height: height * 0.15,
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/image/bg-gold.png")),
              color: Colors.transparent),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Stack(
                children: [
                  // Profile Avatar
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.amber,
                    backgroundImage: NetworkImage(url),
                  ),
                  Positioned(
                    bottom: 1,
                    left: 10,
                    top: 60,
                    child: Container(
                      height: 25,
                      width: 60,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          color: Color(0xffAE8625)),
                      child: Text(
                        textAlign: TextAlign.center,
                        medal,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Profile name
                  Text(name,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),

                  // Phone Number
                  Text(
                    number,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ],
              ),

              /// Edit button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    backgroundColor: const Color(0xfff12002E)),
                onPressed: () {},
                child:
                    const Text('Edit', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        )
      ],
    );
  }
}
