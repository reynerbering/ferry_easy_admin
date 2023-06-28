import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ferry_easy_admin/widgets/admin_drawer.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constants.dart/colors.dart';

class Dashboard extends StatefulWidget {
  static const id = 'dashboard';

  Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  DateTime _targetDate = DateTime.now();
  final CollectionReference transactionsRef =
      FirebaseFirestore.instance.collection('Transactions');

  @override
  void initState() {
    super.initState();
    _targetDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    final DateTime startOfDay = _targetDate.toUtc();
    final DateTime endOfDay = startOfDay.add(const Duration(days: 1));

    final Future<QuerySnapshot> query = transactionsRef
        .where('transactionType', isEqualTo: 'Cashier Load')
        .where('dateIssued',
            isGreaterThanOrEqualTo: Timestamp.fromDate(startOfDay))
        .where('dateIssued', isLessThan: Timestamp.fromDate(endOfDay))
        .get();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard', style: TextStyle(fontFamily: 'Inter')),
        centerTitle: true,
        backgroundColor: kcPrimaryColor,
      ),
      drawer: AdminDrawer(),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/welcome-screen-waves.png'),
            fit: BoxFit.fitWidth,
            alignment: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Card(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: SizedBox(
              width: 958.0,
              height: 750.0,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(20),
                          child: Text(
                            'Total Ticket Transactions for ${DateFormat.yMMMMd().format(_targetDate)}',
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              fontSize: 40,
                              color: kcPrimaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.calendar_month,
                      size: 300,
                      color: kcDarkGray,
                    ),
                    FutureBuilder<QuerySnapshot>(
                      future: query,
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasData) {
                          final totalAmount = snapshot.data!.docs.fold<int>(
                            0,
                            (previousValue, document) =>
                                previousValue +
                                ((document.data()
                                            as Map<String, dynamic>)['amount']
                                        as num)
                                    .toInt(),
                          );
                          return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            elevation: 10,
                            child: Container(
                              width: 600,
                              margin: const EdgeInsets.all(25),
                              padding: const EdgeInsets.all(25),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Total Ticket Sales:',
                                        style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 24,
                                          color: kcPrimaryColor,
                                        ),
                                      ),
                                      Text(
                                        'PHP $totalAmount',
                                        style: const TextStyle(
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w700,
                                          fontSize: 70,
                                          color: kcPrimaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 100),
                                  Expanded(
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  kcPrimaryColor)),
                                      onPressed: () async {
                                        final DateTime? picked =
                                            await showDatePicker(
                                          context: context,
                                          initialDate: _targetDate,
                                          firstDate: DateTime(2015, 8),
                                          lastDate: DateTime(2101),
                                        );
                                        if (picked != null &&
                                            picked != _targetDate) {
                                          setState(() {
                                            _targetDate = picked;
                                          });
                                        }
                                      },
                                      child: const Text('Select date'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text('Error: ${snapshot.error}'),
                          );
                        }

                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
