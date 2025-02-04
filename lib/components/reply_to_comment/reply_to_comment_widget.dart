import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'reply_to_comment_model.dart';
export 'reply_to_comment_model.dart';

class ReplyToCommentWidget extends StatefulWidget {
  const ReplyToCommentWidget({
    super.key,
    required this.postID,
    required this.comment,
  });

  final DocumentReference? postID;
  final DocumentReference? comment;

  @override
  State<ReplyToCommentWidget> createState() => _ReplyToCommentWidgetState();
}

class _ReplyToCommentWidgetState extends State<ReplyToCommentWidget> {
  late ReplyToCommentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReplyToCommentModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 1.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 10.0,
                    borderWidth: 1.0,
                    buttonSize: 40.0,
                    fillColor: FlutterFlowTheme.of(context).primary,
                    icon: Icon(
                      Icons.arrow_downward,
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                  ),
                  AuthUserStreamWidget(
                    builder: (context) => Container(
                      width: 60.0,
                      height: 60.0,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.network(
                        valueOrDefault<String>(
                          currentUserPhoto,
                          'https://cdn-icons-png.flaticon.com/128/747/747376.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  AuthUserStreamWidget(
                    builder: (context) => Text(
                      currentUserDisplayName,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            fontSize: 18.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ].divide(const SizedBox(width: 5.0)),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).primary,
                    width: 2.0,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: TextFormField(
                    controller: _model.textController,
                    focusNode: _model.textFieldFocusNode,
                    autofocus: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'Readex Pro',
                                letterSpacing: 0.0,
                              ),
                      hintText: 'Adicione uma resposta...',
                      hintStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'Readex Pro',
                                letterSpacing: 0.0,
                              ),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0.0,
                        ),
                    validator:
                        _model.textControllerValidator.asValidator(context),
                  ),
                ),
              ),
              StreamBuilder<PostsRecord>(
                stream: PostsRecord.getDocument(widget.postID!),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ),
                    );
                  }

                  final buttonPostsRecord = snapshot.data!;

                  return FFButtonWidget(
                    onPressed: () async {
                      var repliesRecordReference =
                          RepliesRecord.createDoc(widget.postID!);
                      await repliesRecordReference.set(createRepliesRecordData(
                        comment: widget.comment,
                        replyText: _model.textController.text,
                        replyUser: currentUserReference,
                        replyUserName: currentUserDisplayName,
                        replyUserImage: currentUserPhoto,
                      ));
                      _model.replyOutput = RepliesRecord.getDocumentFromData(
                          createRepliesRecordData(
                            comment: widget.comment,
                            replyText: _model.textController.text,
                            replyUser: currentUserReference,
                            replyUserName: currentUserDisplayName,
                            replyUserImage: currentUserPhoto,
                          ),
                          repliesRecordReference);

                      await widget.comment!.update({
                        ...mapToFirestore(
                          {
                            'commentReplies': FieldValue.arrayUnion(
                                [_model.replyOutput?.reference]),
                          },
                        ),
                      });

                      await NotificationRecord.createDoc(
                              buttonPostsRecord.postUser!)
                          .set(createNotificationRecordData(
                        type: 'Respondeu seu comentário',
                        seen: false,
                        person: buttonPostsRecord.postUser,
                        reply: _model.textController.text,
                        commentID: widget.comment,
                        time: getCurrentTimestamp,
                      ));
                      Navigator.pop(context);

                      safeSetState(() {});
                    },
                    text: 'Responder',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 45.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Readex Pro',
                                color: Colors.white,
                                letterSpacing: 0.0,
                              ),
                      elevation: 3.0,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  );
                },
              ),
            ].divide(const SizedBox(height: 10.0)),
          ),
        ),
      ),
    );
  }
}
