import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'buscar_usuario_widget.dart' show BuscarUsuarioWidget;
import 'package:flutter/material.dart';

class BuscarUsuarioModel extends FlutterFlowModel<BuscarUsuarioWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<UsersRecord> simpleSearchResults1 = [];
  List<UsersRecord> simpleSearchResults2 = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
