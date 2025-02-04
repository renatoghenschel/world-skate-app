import '/flutter_flow/flutter_flow_util.dart';
import 'adicionar_avaliacao_spot_widget.dart' show AdicionarAvaliacaoSpotWidget;
import 'package:flutter/material.dart';

class AdicionarAvaliacaoSpotModel
    extends FlutterFlowModel<AdicionarAvaliacaoSpotWidget> {
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
