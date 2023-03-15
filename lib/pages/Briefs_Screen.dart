import 'package:flutter/material.dart';
import 'package:simplonline/Helpers/BriefModal.dart';
import 'package:simplonline/constants.dart';
import 'package:provider/provider.dart';
import 'package:simplonline/pages/Login.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simplonline/pages/Signup.dart';
import 'package:simplonline/Providers/User_Provider.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'dart:convert';

import '../Providers/User_Provider.dart';

class Briefs extends StatefulWidget {
  const Briefs({Key? key}) : super(key: key);
  @override
  State<Briefs> createState() => _BriefsState();
}

class _BriefsState extends State<Briefs> {
  Future<List<BriefModal>> fetchBriefs() async {
    final data = await rootBundle.rootBundle.loadString('Db/briefs.json');
    final list = json.decode(data) as List<dynamic>;
    final briefs =
        list.map((dynamic item) => BriefModal.fromJson(item)).toList();
    return briefs;
  }

  @override
  void initState() {
    fetchBriefs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: fetchBriefs(),
        builder: (context, AsyncSnapshot<List<BriefModal>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Row(
                      children: [
                        // Image on the left
                        SizedBox(
                          width: 120,
                          height: 120,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              '${snapshot.data![index].image.toString()}',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        // Details on the right
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  snapshot.data![index].title.toString(),
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  snapshot.data![index].description.toString(),
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                SizedBox(height: 16),
                                Text(
                                  snapshot.data![index].duree.toString(),
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text('View Details'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                });
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
