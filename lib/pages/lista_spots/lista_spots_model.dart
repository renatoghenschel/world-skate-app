import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'lista_spots_widget.dart' show ListaSpotsWidget;
import 'package:flutter/material.dart';

class ListaSpotsModel extends FlutterFlowModel<ListaSpotsWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  final textFieldKey = GlobalKey();
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? textFieldSelectedOption;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<SpotsRecord> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
  }
}
