import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fpj_core/fpj_cores.dart';

// import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';


// abstract class FpjStatefulWidget extends StatefulWidget {
//   ScrollController? _scrollController;
//   RefreshController? _refreshController;
//   TextEditingController? _editingController;
//   FocusNode? _focusNode;
//   CancelToken? _cancelToken;
//
//
//   CancelToken cancelNetToken() {
//     _cancelToken ?? CancelToken();
//     return _cancelToken!;
//   }
//
//   FocusNode focusNode() {
//     _focusNode ??= FocusNode();
//     return _focusNode!;
//   }
//
//   ScrollController scrollCon() {
//     _scrollController ??= ScrollController();
//     return _scrollController!;
//   }
//
//   TextEditingController editingCon({String? text}) {
//     _editingController ??= TextEditingController(text: text);
//     return _editingController!;
//   }
//
//   RefreshController refreshCon({
//     bool initRefresh = false,
//   }) {
//     _refreshController ??= RefreshController(
//       initialRefresh: initRefresh,
//     );
//
//     return _refreshController!;
//   }
//
//   void initState();
//
//   Widget build(BuildContext context);
//
//   void dispose();
//
//   _FpjState? _state;
//
//   setState(VoidCallback fn) {
//     _state?.notifyUI(fn);
//   }
//
//   @override
//   State<FpjStatefulWidget> createState() {
//     return _FpjState();
//   }
// }
//
// class _FpjState extends State<FpjStatefulWidget> {
//   @override
//   void initState() {
//     super.initState();
//     widget._state = this;
//     widget.initState();
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     widget.dispose();
//     widget._scrollController?.dispose();
//     widget._refreshController?.dispose();
//     widget._focusNode?.dispose();
//     widget._editingController?.dispose();
//     widget._cancelToken?.cancel("ui widget dispose");
//   }
//
//   notifyUI(VoidCallback fn) {
//     if (mounted) {
//       setState(fn);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     widget._state = this;
//     return widget.build(context);
//   }
// }













































































abstract class FpjState<T extends StatefulWidget> extends State<T> {

  ScrollController? _scrollController;
  RefreshController? _refreshController;
  TextEditingController? _editingController;
  FocusNode? _focusNode;
  CancelToken? _cancelToken;

  CancelToken cancelNetToken() {
    _cancelToken ?? CancelToken();
    return _cancelToken!;
  }

  FocusNode focusNode() {
    _focusNode ??= FocusNode();
    return _focusNode!;
  }

  ScrollController scrollCon() {
    _scrollController ??= ScrollController();
    return _scrollController!;
  }

  TextEditingController editingCon({String? text}) {
    _editingController ??= TextEditingController(text: text);
    return _editingController!;
  }

  RefreshController refreshCon({
    bool initRefresh = false,
  }) {
    _refreshController ??= RefreshController(
      initialRefresh: initRefresh,
    );
    return _refreshController!;
  }

  @override
  void initState() {
    super.initState();
    InitState();
  }

  @override
  Widget build(BuildContext context) {
    return Build(context);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController?.dispose();
    _refreshController?.dispose();
    _focusNode?.dispose();
    _editingController?.dispose();
    _cancelToken?.cancel("ui widget dispose");
    Dispose();
  }

  void InitState();
  Widget Build(BuildContext context);
  void Dispose();

}
