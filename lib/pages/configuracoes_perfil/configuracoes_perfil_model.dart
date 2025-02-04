import '/flutter_flow/flutter_flow_util.dart';
import 'configuracoes_perfil_widget.dart' show ConfiguracoesPerfilWidget;
import 'package:flutter/material.dart';

class ConfiguracoesPerfilModel
    extends FlutterFlowModel<ConfiguracoesPerfilWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for Name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  // State field(s) for userName widget.
  FocusNode? userNameFocusNode1;
  TextEditingController? userNameTextController1;
  String? Function(BuildContext, String?)? userNameTextController1Validator;
  // State field(s) for userName widget.
  FocusNode? userNameFocusNode2;
  TextEditingController? userNameTextController2;
  String? Function(BuildContext, String?)? userNameTextController2Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    userNameFocusNode1?.dispose();
    userNameTextController1?.dispose();

    userNameFocusNode2?.dispose();
    userNameTextController2?.dispose();
  }
}
