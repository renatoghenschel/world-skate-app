import '/flutter_flow/flutter_flow_util.dart';
import 'add_post_widget.dart' show AddPostWidget;
import 'package:flutter/material.dart';

class AddPostModel extends FlutterFlowModel<AddPostWidget> {
  ///  Local state fields for this component.

  String? imageURL;

  String videoURL = 'jjjj';

  bool imageUploaded = false;

  bool videoUploaded = false;

  ///  State fields for stateful widgets in this component.

  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

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
