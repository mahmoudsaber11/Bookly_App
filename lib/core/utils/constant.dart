// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xff100B20);
const kGtSectraFine = 'GT Sectra Fine';

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );
void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(context,
    MaterialPageRoute(builder: ((context) => widget)), (route) => false);
