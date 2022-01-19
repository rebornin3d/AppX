import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'new_car/view/new_car_page.dart';
import 'new_car_repository.dart';

class Dynamic_Form_Page extends StatelessWidget {
  const Dynamic_Form_Page({Key? key, required this.newCarRepository}) : super(key: key);

  final NewCarRepository newCarRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: newCarRepository,
      child: MaterialApp(home: NewCarPage()),
    );
  }
}
