import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'solicitacoes_page_model.dart';
export 'solicitacoes_page_model.dart';

class SolicitacoesPageWidget extends StatefulWidget {
  const SolicitacoesPageWidget({super.key});

  @override
  State<SolicitacoesPageWidget> createState() => _SolicitacoesPageWidgetState();
}

class _SolicitacoesPageWidgetState extends State<SolicitacoesPageWidget> {
  late SolicitacoesPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SolicitacoesPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'Solicitações',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed('socialFeed');
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 25.0,
                    ),
                  ),
                  Text(
                    'Solicitações',
                    style: FlutterFlowTheme.of(context).displaySmall.override(
                          fontFamily: 'Outfit',
                          letterSpacing: 0.0,
                        ),
                  ),
                ].divide(const SizedBox(width: 10.0)),
              ),
              actions: const [],
              centerTitle: false,
              elevation: 0.0,
            ),
            body: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Esses são os usúarios que te chamaram para um chat',
                          style:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                    child: StreamBuilder<List<ChatInvitationRecord>>(
                      stream: queryChatInvitationRecord(
                        parent: currentUserReference,
                        queryBuilder: (chatInvitationRecord) =>
                            chatInvitationRecord.where(
                          'state',
                          isEqualTo: 'pending',
                        ),
                      ),
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
                        List<ChatInvitationRecord>
                            listViewChatInvitationRecordList = snapshot.data!;

                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewChatInvitationRecordList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewChatInvitationRecord =
                                listViewChatInvitationRecordList[listViewIndex];
                            return Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 8.0),
                              child: StreamBuilder<UsersRecord>(
                                stream: UsersRecord.getDocument(
                                    listViewChatInvitationRecord.sender!),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }

                                  final menuItemUsersRecord = snapshot.data!;

                                  return Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      boxShadow: const [
                                        BoxShadow(
                                          blurRadius: 3.0,
                                          color: Color(0x411D2429),
                                          offset: Offset(
                                            0.0,
                                            1.0,
                                          ),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            'outroUsuarioFeed',
                                            queryParameters: {
                                              'userID': serializeParam(
                                                listViewChatInvitationRecord
                                                    .sender,
                                                ParamType.DocumentReference,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 1.0, 1.0, 1.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(6.0),
                                                child: Image.network(
                                                  menuItemUsersRecord.photoUrl,
                                                  width: 80.0,
                                                  height: 80.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 8.0, 4.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      menuItemUsersRecord
                                                          .displayName,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .headlineSmall
                                                          .override(
                                                            fontFamily:
                                                                'Outfit',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  4.0,
                                                                  8.0,
                                                                  0.0),
                                                      child: AutoSizeText(
                                                        menuItemUsersRecord.bio
                                                            .maybeHandleOverflow(
                                                          maxChars: 70,
                                                          replacement: '…',
                                                        ),
                                                        textAlign:
                                                            TextAlign.start,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                FFButtonWidget(
                                                  onPressed: () async {
                                                    await listViewChatInvitationRecord
                                                        .reference
                                                        .delete();

                                                    await NotificationRecord
                                                            .createDoc(
                                                                listViewChatInvitationRecord
                                                                    .sender!)
                                                        .set(
                                                            createNotificationRecordData(
                                                      type:
                                                          'Aceitou a solicitação',
                                                      seen: false,
                                                      person:
                                                          currentUserReference,
                                                      time: getCurrentTimestamp,
                                                    ));

                                                    await currentUserReference!
                                                        .update({
                                                      ...mapToFirestore(
                                                        {
                                                          'pendingFriends':
                                                              FieldValue
                                                                  .arrayRemove([
                                                            listViewChatInvitationRecord
                                                                .sender
                                                          ]),
                                                          'friends': FieldValue
                                                              .arrayUnion([
                                                            listViewChatInvitationRecord
                                                                .sender
                                                          ]),
                                                        },
                                                      ),
                                                    });

                                                    await listViewChatInvitationRecord
                                                        .sender!
                                                        .update({
                                                      ...mapToFirestore(
                                                        {
                                                          'friends': FieldValue
                                                              .arrayUnion([
                                                            currentUserReference
                                                          ]),
                                                          'pendingFriends':
                                                              FieldValue
                                                                  .arrayRemove([
                                                            currentUserReference
                                                          ]),
                                                        },
                                                      ),
                                                    });
                                                    // AuthUserData

                                                    var chatsRecordReference =
                                                        ChatsRecord.collection
                                                            .doc();
                                                    await chatsRecordReference
                                                        .set({
                                                      ...mapToFirestore(
                                                        {
                                                          'participantsImages':
                                                              [
                                                            currentUserPhoto
                                                          ],
                                                          'participantsNames': [
                                                            currentUserDisplayName
                                                          ],
                                                          'participantsID': [
                                                            currentUserReference
                                                          ],
                                                        },
                                                      ),
                                                    });
                                                    _model.output = ChatsRecord
                                                        .getDocumentFromData({
                                                      ...mapToFirestore(
                                                        {
                                                          'participantsImages':
                                                              [
                                                            currentUserPhoto
                                                          ],
                                                          'participantsNames': [
                                                            currentUserDisplayName
                                                          ],
                                                          'participantsID': [
                                                            currentUserReference
                                                          ],
                                                        },
                                                      ),
                                                    }, chatsRecordReference);
                                                    // otherUserData

                                                    await _model
                                                        .output!.reference
                                                        .update({
                                                      ...mapToFirestore(
                                                        {
                                                          'participantsImages':
                                                              FieldValue
                                                                  .arrayUnion([
                                                            menuItemUsersRecord
                                                                .photoUrl
                                                          ]),
                                                          'participantsNames':
                                                              FieldValue
                                                                  .arrayUnion([
                                                            menuItemUsersRecord
                                                                .displayName
                                                          ]),
                                                          'participantsID':
                                                              FieldValue
                                                                  .arrayUnion([
                                                            menuItemUsersRecord
                                                                .reference
                                                          ]),
                                                        },
                                                      ),
                                                    });

                                                    context.pushNamed('chats');

                                                    safeSetState(() {});
                                                  },
                                                  text: 'Aceitar',
                                                  options: FFButtonOptions(
                                                    height: 40.0,
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
                                                    iconPadding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .success,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    elevation: 3.0,
                                                    borderSide: const BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
                                                FFButtonWidget(
                                                  onPressed: () async {
                                                    await listViewChatInvitationRecord
                                                        .reference
                                                        .update(
                                                            createChatInvitationRecordData(
                                                      rejected: true,
                                                      state: 'done',
                                                    ));
                                                    var confirmDialogResponse =
                                                        await showDialog<bool>(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return AlertDialog(
                                                                  title: const Text(
                                                                      'Decline invitation'),
                                                                  content: const Text(
                                                                      'Vôce deseja bloquear este usuário?'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed: () => Navigator.pop(
                                                                          alertDialogContext,
                                                                          false),
                                                                      child: const Text(
                                                                          'Não'),
                                                                    ),
                                                                    TextButton(
                                                                      onPressed: () => Navigator.pop(
                                                                          alertDialogContext,
                                                                          true),
                                                                      child: const Text(
                                                                          'Sim'),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            ) ??
                                                            false;
                                                    if (confirmDialogResponse) {
                                                      await currentUserReference!
                                                          .update({
                                                        ...mapToFirestore(
                                                          {
                                                            'blockedUser':
                                                                FieldValue
                                                                    .arrayUnion([
                                                              menuItemUsersRecord
                                                                  .reference
                                                            ]),
                                                            'pendingFriends':
                                                                FieldValue
                                                                    .arrayRemove([
                                                              menuItemUsersRecord
                                                                  .reference
                                                            ]),
                                                          },
                                                        ),
                                                      });
                                                      await listViewChatInvitationRecord
                                                          .reference
                                                          .delete();
                                                    } else {
                                                      await currentUserReference!
                                                          .update({
                                                        ...mapToFirestore(
                                                          {
                                                            'pendingFriends':
                                                                FieldValue
                                                                    .arrayRemove([
                                                              listViewChatInvitationRecord
                                                                  .sender
                                                            ]),
                                                          },
                                                        ),
                                                      });
                                                    }
                                                  },
                                                  text: 'Recusar',
                                                  options: FFButtonOptions(
                                                    height: 40.0,
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
                                                    iconPadding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    elevation: 3.0,
                                                    borderSide: const BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
                                              ].divide(const SizedBox(height: 5.0)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
