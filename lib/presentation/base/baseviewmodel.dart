// import 'package:advanced_flutter_arabic/presentation/common/state_renderer/state_renderer_impl.dart';
// import 'package:rxdart/rxdart.dart';

// abstract class BaseViewModel extends BaseViewModelInputs
//     with BaseViewModelOutputs {
//   // shared variables and function that will be used through any view model.
//   final StreamController _inputStreamController =
//       BehaviorSubject<FlowState>();
//
//   @override
//   Sink get inputState => _inputStreamController.sink;
//
//   @override
//   Stream<FlowState> get outputState => _inputStreamController.stream.map((flowState) => flowState);
//
//   @override
//   void dispose() {
//     _inputStreamController.close();
//   }
// }

abstract class BaseViewModel with BaseViewModelInputs, BaseViewModelOutputs {
  // Shared variables and functions that will be used throughout any view model.
}

mixin BaseViewModelInputs {
  void start(); // Start view model job

  void dispose(); // Called when the view model dies

  // Sink get inputState;
}

mixin BaseViewModelOutputs {
  // Will be implemented later

  // Stream<FlowState> get outputState;
}
