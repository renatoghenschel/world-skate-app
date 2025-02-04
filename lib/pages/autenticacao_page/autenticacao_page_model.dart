import '/flutter_flow/flutter_flow_util.dart';
import 'autenticacao_page_widget.dart' show AutenticacaoPageWidget;
import 'package:flutter/material.dart';

class AutenticacaoPageModel extends FlutterFlowModel<AutenticacaoPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for nameSign widget.
  FocusNode? nameSignFocusNode;
  TextEditingController? nameSignTextController;
  String? Function(BuildContext, String?)? nameSignTextControllerValidator;
  // State field(s) for emailSign widget.
  FocusNode? emailSignFocusNode;
  TextEditingController? emailSignTextController;
  String? Function(BuildContext, String?)? emailSignTextControllerValidator;
  // State field(s) for passwordSign widget.
  FocusNode? passwordSignFocusNode;
  TextEditingController? passwordSignTextController;
  late bool passwordSignVisibility;
  String? Function(BuildContext, String?)? passwordSignTextControllerValidator;
  // State field(s) for passwordConfirmSign widget.
  FocusNode? passwordConfirmSignFocusNode;
  TextEditingController? passwordConfirmSignTextController;
  late bool passwordConfirmSignVisibility;
  String? Function(BuildContext, String?)?
      passwordConfirmSignTextControllerValidator;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;

  @override
  void initState(BuildContext context) {
    passwordSignVisibility = false;
    passwordConfirmSignVisibility = false;
    passwordVisibility = false;
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    nameSignFocusNode?.dispose();
    nameSignTextController?.dispose();

    emailSignFocusNode?.dispose();
    emailSignTextController?.dispose();

    passwordSignFocusNode?.dispose();
    passwordSignTextController?.dispose();

    passwordConfirmSignFocusNode?.dispose();
    passwordConfirmSignTextController?.dispose();

    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();
  }
}
