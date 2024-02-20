import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  dynamic prompt;

  List<dynamic> tasks = [];
  void addToTasks(dynamic item) => tasks.add(item);
  void removeFromTasks(dynamic item) => tasks.remove(item);
  void removeAtIndexFromTasks(int index) => tasks.removeAt(index);
  void insertAtIndexInTasks(int index, dynamic item) =>
      tasks.insert(index, item);
  void updateTasksAtIndex(int index, Function(dynamic) updateFn) =>
      tasks[index] = updateFn(tasks[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for prompt widget.
  FocusNode? promptFocusNode;
  TextEditingController? promptController;
  String? Function(BuildContext, String?)? promptControllerValidator;
  // Stores action output result for [Backend Call - API (Create New Task)] action in promptButton widget.
  ApiCallResponse? apiResults;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    promptFocusNode?.dispose();
    promptController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
