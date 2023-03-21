import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  late double _deviceHeight;
  late double _deviceWidth;
  late TextEditingController _searchTextFieldController;

  @override
  Widget build(BuildContext context) {
    _deviceWidth = MediaQuery.of(context).size.width;
    _deviceHeight = MediaQuery.of(context).size.height;
    _searchTextFieldController = TextEditingController();
    return  Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: _deviceHeight * 0.05,
        width: _deviceWidth * 0.8,
        decoration: BoxDecoration(

          border: const Border(
            left: BorderSide(color: Colors.grey,width: 2,),
            right: BorderSide(color: Colors.grey,width: 2,),
            top: BorderSide(color: Colors.grey,width: 2,),
            bottom: BorderSide(color: Colors.grey,width: 2,),
          ) ,
            color: Colors.white12,
            borderRadius: BorderRadius.circular(15.0)),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           // _searchButton(),
            _searchField(),
          ],
        ),
      ),
    );
  }
  Widget _searchButton() {
    return IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.search,
          color: Colors.white,
        ));
  }

  Widget _searchField() {
    const _border = InputBorder.none;
    return Container(
      margin: EdgeInsets.only(left: 5,top: 2),
      width: _deviceWidth * 0.7,
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
            hintText: 'Search '),
      ),
    );
  }
}
