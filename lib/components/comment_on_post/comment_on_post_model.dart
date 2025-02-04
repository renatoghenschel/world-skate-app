import '/flutter_flow/flutter_flow_util.dart';
import 'comment_on_post_widget.dart' show CommentOnPostWidget;
import 'package:flutter/material.dart';

class CommentOnPostModel extends FlutterFlowModel<CommentOnPostWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
