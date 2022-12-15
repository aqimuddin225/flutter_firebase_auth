import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/api_service.dart';
import 'package:flutter_firebase_auth/models/transaction.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Money> listMoney = [];
  Repository repo = Repository();

  getData() async{
    listMoney = await repo.getData();
  }
  
  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: SizedBox(height: 340, child: _head()),
              ),
              SliverToBoxAdapter(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Transactions History',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 19,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              'See all',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
              SliverList(delegate: SliverChildBuilderDelegate(
                childCount: listMoney.length,
                (context, index) {
                  return ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: const Icon(Icons.money, size: 40,),
                    ),
                    title: Text(
                      listMoney[index].title,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    subtitle: Text(
                      'today',
                      style: TextStyle(
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    trailing: Text(
                      listMoney[index].amount.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 19,
                        color: !listMoney[index].isBuy? Colors.green : Colors.red,
                      ),
                    ),
                  );
                })
              ) 
            ],
          )
        ),
    );
  }

  Widget _head(){
    return Stack(
            children: [
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 240,
                    decoration: const BoxDecoration(
                      color: Color(0xff368983),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)
                      ) 
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 35,
                            left: 340,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(7),
                              child: Container(
                                height: 40,
                                width: 40,
                                color: const Color.fromRGBO(250, 250, 250, 0.1),
                                child: const Icon(
                                  Icons.notification_add_outlined,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 35, left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Good afternoon',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: Color.fromARGB(255, 224, 223, 223),
                                  ),
                                ),
                                Text(
                                  'Ibrohim Aqimuddin',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                  ),
                ],
              ),
              Positioned(
                top: 160,
                left: 37,
                child: Container(
                  height: 170,
                  width: 320,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(47, 125, 121, 0.3),
                        offset: Offset(0, 6),
                        blurRadius: 12,
                        spreadRadius: 6,
                      ),
                    ],
                    color: const Color.fromARGB(255, 47, 125, 121),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Total Balance',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                            Icon(
                              Icons.more_horiz,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 7),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Row(
                          children: const [
                            Text(
                              '-',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 25),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: const [
                                CircleAvatar(
                                  radius: 13,
                                  backgroundColor: Color.fromARGB(255, 85, 145, 141),
                                  child: Icon(
                                    Icons.arrow_downward,
                                    color: Colors.white,
                                    size: 19,
                                  ),
                                ),
                                SizedBox(width: 7),
                                Text(
                                  'Income',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: Color.fromARGB(255, 216, 216, 216),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: const [
                                CircleAvatar(
                                  radius: 13,
                                  backgroundColor: Color.fromARGB(255, 85, 145, 141),
                                  child: Icon(
                                    Icons.arrow_upward,
                                    color: Colors.white,
                                    size: 19,
                                  ),
                                ),
                                SizedBox(width: 7),
                                Text(
                                  'Expenses',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: Color.fromARGB(255, 216, 216, 216),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 6),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              '-',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 17,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              '-',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 17,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          );
  }
}