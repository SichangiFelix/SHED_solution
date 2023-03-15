import 'package:flutter/material.dart';

import '../../emergency/screens/emergency_page.dart';
import '../../shorts/screens/shorts_page.dart';
import 'home_page.dart';

List<Widget> homePages = [
  const ShortsPage(),
  const HomePage(),
  const EmergencyPage(),
];