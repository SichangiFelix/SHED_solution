import 'package:flutter/material.dart';

class TopicSearchBar extends StatefulWidget {
  const TopicSearchBar({Key? key}) : super(key: key);

  @override
  State<TopicSearchBar> createState() => _TopicSearchBarState();
}

class _TopicSearchBarState extends State<TopicSearchBar> {
  late double _deviceHeight;
  late double _deviceWidth;
  late TextEditingController _searchTextFieldController;

  @override
  Widget build(BuildContext context) {
    _deviceWidth = MediaQuery.of(context).size.width;
    _deviceHeight = MediaQuery.of(context).size.height;
    _searchTextFieldController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.only(left: 50.0,right: 50,top: 23,bottom: 23),
      child: Container(
        height: _deviceHeight * 0.05,
        width: _deviceWidth * 0.6,
        decoration: BoxDecoration(

            border: const Border(
              left: BorderSide(color: Colors.grey,width: 2,),
              right: BorderSide(color: Colors.grey,width: 2,),
              top: BorderSide(color: Colors.grey,width: 2,),
              bottom: BorderSide(color: Colors.grey,width: 2,),
            ) ,
            color: Colors.white12,
            borderRadius: BorderRadius.circular(15.0)),
        child: _searchField(),
      ),
    );
  }

  Widget _searchField() {
    const _border = InputBorder.none;
    return Container(
      margin: const EdgeInsets.only(left: 5,top: 2),
      width: _deviceWidth * 0.5,
      height: _deviceHeight * 0.05,
      child: TextField(
        controller: _searchTextFieldController,
        onSubmitted: (_input) {},

        decoration: const InputDecoration(
            focusedBorder: _border,

            hintStyle: TextStyle(
              color: Colors.black,
            ),
            filled: false,
            fillColor: Colors.black,
            hintText: 'Search Topics'),
      ),
    );
  }
}
