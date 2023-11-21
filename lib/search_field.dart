import 'package:flutter/material.dart';


/// Widget that is used to search city
class SearchField extends StatefulWidget {
  const SearchField({
    Key? key,
    required this.labelText,
    required this.controller,
    required this.focusNode,
    this.labelColor,
    this.readOnly = false,
    this.enabled = true,
    this.selectedData,
  }) : super(key: key);

  /// if field is supposed to be read-only or not
  final bool readOnly;

  /// if field is enabled or not
  final bool enabled;

  /// label color of the field
  final Color? labelColor;

  /// text value of label
  final String labelText;

  /// focus-node of the field
  final FocusNode focusNode;

  /// [TextEditingController] controller of the field
  final TextEditingController controller;

  /// callback for selection by user
  final Function(String)? selectedData;

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {

  List<String> searchedDataList = [];

  @override
  void initState() {
    super.initState();
    _addFocusListener();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: widget.controller,
            focusNode: widget.focusNode,
            enabled: widget.enabled,
            onChanged: (value) {
              if (value.isNotEmpty) {
                searchedDataList = (cityList.where((element) => element.toLowerCase().contains(value.trim().toLowerCase())))
                    .toList();
              } else{
                searchedDataList.clear();
              }
              setState(() {});
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.fromLTRB(24, 24, 12, 12),
              counterText: '',
              border: _getBorder(),
              enabledBorder: _getBorder(),
              focusedBorder: _getFocusedBorder(),
              labelText: widget.labelText,
              labelStyle: _getTextStyle(),
              fillColor: widget.focusNode.hasFocus ? Theme.of(context).primaryColor : null,
              suffixIcon: _getSuffixIcon(),
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
            readOnly: widget.readOnly,
            cursorColor: Theme.of(context).primaryColor,
          ),
          if (widget.focusNode.hasFocus)
            Flexible(
              child: _suggestionList(searchedDataList,),
            )
          else
            const SizedBox(),
        ],
      ),
    );
  }

  /// list-view of search-suggestions
  Widget _suggestionList(List<String> list) {
    return list.isEmpty? const SizedBox() : Container(
      padding: const EdgeInsets.only(
        top: 24,
        bottom: 24,
      ),
      child: CustomScrollView(
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return GestureDetector(
                  onTap: () {
                    _onSelected(list[index]);
                  },
                  child: _listItemWidget(list[index]),
                );
              },
              childCount:list.length,
            ),
          )
        ],
      ),
    );
  }

  ///get border of textinput filed
  OutlineInputBorder _getBorder() {
    return  OutlineInputBorder(
      borderSide: BorderSide(width: 2, color: Theme.of(context).primaryColor),
      gapPadding: 6,
    );
  }

  ///get border of textinput filed
  OutlineInputBorder _getFocusedBorder() {
    return  OutlineInputBorder(
      borderSide: BorderSide(width: 2, color: Theme.of(context).primaryColor),
      gapPadding: 6,
    );
  }

  /// text style for textinput
  TextStyle _getTextStyle() {
    return TextStyle(
      color: Theme.of(context).primaryColor,
      fontSize: 12,
      fontWeight: FontWeight.w600,
      letterSpacing: 1.04,
      height: 1.1,
    );
  }

  /// widget for suffix-icon
  Widget _getSuffixIcon() {
    return widget.controller.text.isNotEmpty
        ? GestureDetector(
            onTap: () {
              searchedDataList.clear();
              widget.controller.clear();
              setState(() {});
            },
            child: const Icon(Icons.close),
          )
        : const Opacity(opacity: 0.0, child: Icon(Icons.search));
  }

  /// selection callback
  void _onSelected(String selectedData) {
    widget.controller.text = selectedData;
    widget.focusNode.unfocus();
    searchedDataList.clear();
    if (widget.selectedData != null) {
      widget.selectedData!(selectedData);
    }
    setState(() {});
  }

  Widget _listItemWidget(String listData){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(listData),
    );
  }

  @override
  void dispose() {
    widget.focusNode.removeListener(_onFocusChange);
    super.dispose();
  }

  void _addFocusListener() {
    widget.focusNode.addListener(_onFocusChange);
  }

  void _onFocusChange () {
    setState(() {});
  }
}

/// Dummy data list (you can replace with api call or local data)
const List<String> cityList = [
  "Ahmedabad",
  "Surat",
  "Vadodara",
  "Bhavnagar",
  "Jamnagar",
  "Gandhinagar",
  "Junagadh",
  "Gandhidham",
  "Anand",
  "Navsari",
  "Morbi",
  "Nadiad",
  "Surendranagar",
  "Bharuch",
  "Mehsana",
  "Bhuj",
  "Porbandar",
  "Palanpur",
  "Valsad",
  "Vapi",
  "Gondal",
  "Veraval",
  "Godhra",
  "Patan",
  "Kalol",
  "Dahod",
  "Botad",
  "Amreli",
  "Deesa",
  "Jetpur",
];
