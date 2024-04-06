import 'dart:convert';
import "package:fireappx/models/profile.dart";
import 'package:fireappx/Screen/home/profile.dart';
import 'package:fireappx/models/pack.dart';
import 'package:fireappx/models/reward.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Profilemodel? profilemodel;
  List<Reward> rewards = [];
  List<Pack> packs = [];
  @override
  void initState() {
    super.initState();
    fetchdata();
  }

  Future<void> fetchdata() async {
    const url = "https://ajanitech.com/test/chat-app-x/user-1.json";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      setState(() {
        profilemodel = Profilemodel.fromJson(body['profile']);
        rewards =
            List.from(body['rewards']).map((e) => Reward.fromJson(e)).toList();
        packs = List.from(body["packs"]).map((e) => Pack.fromJson(e)).toList();
      });
    } else {
      print("Failed is load data");
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.08),
          child: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  'FireAppX',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(19),
                          side: const BorderSide(style: BorderStyle.none)),
                      backgroundColor: Colors.white,
                      elevation: 0,
                    ),
                    onPressed: () {},
                    child: Row(
                      children: [
                        SizedBox(
                            height: 25,
                            width: 25,
                            child: Image.asset("assets/image/icon-coin.png")),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          profilemodel != null
                              ? profilemodel!.coins.toString()
                              : "0",
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    )),
              ],
            ),
          )),

      ///
      ///
      ///
      ///
      /// Body
      body: SingleChildScrollView(
        child: Column(children: [
          Profile(
            name: profilemodel != null ? profilemodel!.name : "Unknown",
            number: profilemodel != null ? profilemodel!.phone : "Unknown",
            ontap: () {},
            url: profilemodel != null ? profilemodel!.photo : "Unknown",
            medal: profilemodel != null ? profilemodel!.membership : " Unknown",
          ),

          /**
         * 
         *    Daily Rewards Body
         * 
         * 
         */

          Container(
            height: height * 0.25,
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black12),
                borderRadius: BorderRadius.circular(12)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Daily Reward",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: height * 0.21,
                  child: ListView.builder(
                    itemCount: rewards.length,
                    itemBuilder: (context, index) {
                      final reward = rewards[index];
                      return ListTile(
                          tileColor: Colors.blue[50],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: BorderSide(width: 2, color: Colors.white)),
                          leading: Image.asset(
                            "assets/image/${reward.icon}",
                            height: 50, // Adjust the height as needed
                            width: 50,
                          ),
                          title: Text(reward.title,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                          subtitle: Text(reward.summary,
                              style: TextStyle(color: Colors.grey)),
                          trailing: SizedBox(
                            height: 30,
                            width: width * 0.12,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "+${reward.coins.toString()}",
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 15),
                                ),
                                Image.asset(
                                  "assets/image/icon-coin.png",
                                  height: 20,
                                  width: 20,
                                ),
                              ],
                            ),
                          ));
                    },
                  ),
                ),
              ],
            ),
          ),

          /**
             * 
             * Pack screen body
             * 
             * 
             * 
             * */
          Container(
              height: height * 0.38,
              width: width * 0.98,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black45),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Buy coins packs",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    itemCount: packs.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 5,
                        crossAxisCount: 3),
                    itemBuilder: (context, index) {
                      final pack = packs[index];
                      return Container(
                        height: height * 50,
                        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              width: 2,
                              color: Colors.amber,
                            )),
                        child: Column(
                          children: [
                            Text(
                              pack.coins.toString(),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              "Coins",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Image.asset(
                              "assets/image/${pack.icon}",
                              height: 50,
                              width: 50,
                            ),
                            // ElevatedButton(
                            //   style: ElevatedButton.styleFrom(
                            //       elevation: 0,
                            //       shape: RoundedRectangleBorder(
                            //           borderRadius: BorderRadius.circular(12)),
                            //       backgroundColor: Colors.red),
                            //   onPressed: () {},
                            //   child: Text(
                            //     pack.coins.toString(),
                            //     style: const TextStyle(
                            //         color: Colors.black,
                            //         fontWeight: FontWeight.bold),
                            //   ),
                            // ),
                            Container(
                              height: 30,
                              width: 60,
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                  color: Color.fromARGB(255, 253, 36, 20)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "₹${pack.coins.toString()}",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              )),
        ]),
      ),
    );
  }
}
