import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:social_media_project/model/post.dart';
import 'package:social_media_project/sharedPreference/shared_pref.dart';

import 'login.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  var token = SharedPref.pref?.getString("token");

  void _onTabSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  var baseUrlImage = "https://b517-103-17-77-3.ngrok-free.app/storage/images";

  Future<List<Post>> getData() async {
    var dio = Dio();
    var token = SharedPref.pref?.getString("token");
    try {
      var response = await dio.get(
        'https://b517-103-17-77-3.ngrok-free.app/api/post',
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );
      var data = response.data as Map<String, dynamic>;
      var postData = data['data'] as List<dynamic>;
      List<Post> listPosts = [];
      if (response.statusCode == 200) {
        listPosts = postData.map((e) => Post.fromJson(e)).toList();
        // Cetak data ke terminal
        listPosts.forEach((post) {
          print("ID: ${post.user.id}");
          print("Judul: ${post.title}");
          print("Konten: ${post.content}");
          print("Image: ${post.picture}");
          print("=======");
        });
      } else {
        print("Gagal mengambil data. Kode status: ${response.statusCode}");
      }
      return listPosts;
    } catch (e) {
      print("Terjadi kesalahan saat mengambil data: $e");
      throw e;
    }
  }

  @override
  Widget build(BuildContext context) {
    print(token);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            centerTitle: true,
            title: Text(
              "Home",
              style: TextStyle(color: Colors.black87),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              IconButton(
                onPressed: () {
                  SharedPref.pref?.remove("token");
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                icon: Icon(Icons.logout),
                color: Colors.black87,
              ),
            ],
          )
        ],
        body: FutureBuilder<List<Post>>(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: const CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Text("ini tampilan ketika error");
            } else {
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) => Card(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 23),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(
                                  'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60'),
                            ),
                            SizedBox(
                              width: 17,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${snapshot.data?[index].user.name}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                Text(
                                  "Blablabla",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 10),
                                ),
                                Text(
                                  "12 jam",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 10),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 19,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "${snapshot.data?[index].title}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text('${snapshot.data?[index].content}')),
                        SizedBox(
                          height: 19,
                        ),
                        Container(
                          height: 210,
                          width: double.infinity,
                          child: Image.network(
                            '$baseUrlImage/${snapshot.data?[index].picture}',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.thumb_up,
                                color: Color(0xFF2b9348),
                              ),
                              iconSize: 18,
                            ),
                            Text(
                              "100 Likes",
                              style: TextStyle(color: Colors.black45),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Text(
                              "10 Komentar",
                              style: TextStyle(color: Colors.black45),
                            ),
                          ],
                        ),
                        Container(
                          color: Colors.black12,
                          width: 250,
                          height: 1,
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.thumb_up,
                                color: Color(0xFF2b9348),
                              ),
                              iconSize: 28,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.comment,
                                color: Color(0xFF2b9348),
                              ),
                              iconSize: 28,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.share,
                                color: Color(0xFF2b9348),
                              ),
                              iconSize: 28,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          // Tambahkan logika perpindahan halaman sesuai dengan index
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Color(0xFF2b9348),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        selectedLabelStyle: TextStyle(color: Color(0xFF2b9348)),
        unselectedLabelStyle: TextStyle(color: Colors.grey),
      ),
    );
  }
}
