import 'package:flutter/material.dart';

import '../../chats/screens/chats_page.dart';
import '../../emergency/screens/emergency_page.dart';
import 'home_page.dart';

List<Widget> homePages = [
  const ChatsPage(),
  const HomePage(),
  EmergencyPage(),
];