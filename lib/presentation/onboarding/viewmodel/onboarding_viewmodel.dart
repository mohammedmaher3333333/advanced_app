import 'dart:async';

import 'package:advanced_app/domain/models.dart';
import 'package:advanced_app/presentation/base/baseviewmodel.dart';

import '../../resources/assets_manager.dart';
import '../../resources/strings_manager.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  // stream controller output
  final StreamController _streamController = StreamController<SliderViewObject>();
  late final List<SliderObject> _list;

  int _currentIndex = 0;

  // onboarding viewModel Inputs
  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    // view model start your jop
    _list = _getSliderData();
    _postDataToView();
  }

  @override
  int goNext() {
    int nextIndex = _currentIndex + 1;
    if (nextIndex >= _list.length) {
      nextIndex = 0;
    }
    return nextIndex;
  }

  @override
  int goPrevious() {
    int previousIndex = _currentIndex - 1;
    if (previousIndex < 0) {
      previousIndex = _list.length - 1;
    }
    return previousIndex;
  }

  @override
  void onPageChanged(int index) {
    _currentIndex = index;
    _postDataToView();
  }

  @override
  Sink get inputSliderViewObject => _streamController.sink;

  @override
  Stream<SliderViewObject> get outputSliderViewObject =>
      _streamController.stream.map(
        (sliderViewObject) => sliderViewObject,
      );

  // onboarding private function
  void _postDataToView() {
    inputSliderViewObject.add(
        SliderViewObject(_list[_currentIndex], _list.length, _currentIndex));
  }

  List<SliderObject> _getSliderData() => [
        SliderObject(
          title: AppStrings.onBoardingSubTitle1,
          subTitle: AppStrings.onBoardingSubTitle1,
          image: ImageAssets.onboardingLogo1,
        ),
        SliderObject(
          title: AppStrings.onBoardingSubTitle2,
          subTitle: AppStrings.onBoardingSubTitle2,
          image: ImageAssets.onboardingLogo2,
        ),
        SliderObject(
          title: AppStrings.onBoardingSubTitle3,
          subTitle: AppStrings.onBoardingSubTitle3,
          image: ImageAssets.onboardingLogo3,
        ),
        SliderObject(
          title: AppStrings.onBoardingSubTitle4,
          subTitle: AppStrings.onBoardingSubTitle4,
          image: ImageAssets.onboardingLogo4,
        ),
      ];
}

mixin OnBoardingViewModelInputs {
  int goNext();

  int goPrevious();

  void onPageChanged(int index);

  // stream controller input
  Sink get inputSliderViewObject;
}

mixin OnBoardingViewModelOutputs {
  // stream controller output
  Stream<SliderViewObject> get outputSliderViewObject;
}

// import 'dart:async';
// import 'dart:ffi';
//
// import 'package:advanced_flutter_arabic/domain/model/models.dart';
// import 'package:easy_localization/easy_localization.dart';
//
// import '../../base/baseviewmodel.dart';
// import '../../resources/assets_manager.dart';
// import '../../resources/strings_manager.dart';
//
// class OnBoardingViewModel extends BaseViewModel
//     with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
//   // stream controllers outputs
//   final StreamController _streamController =
//       StreamController<SliderViewObject>();
//   late final List<SliderObject> _list;
//   int _currentIndex = 0;
//
//   //OnBoarding ViewModel Inputs
//   @override
//   void dispose() {
//     _streamController.close();
//   }
//
//   @override
//   void start() {
//     // view model start your job
//     _list = _getSliderData();
//     _postDataToView();
//   }
//
//   @override
//   int goNext() {
//     int nextIndex = ++_currentIndex;
//     if (nextIndex == _list.length) {
//       nextIndex = 0;
//     }
//     return nextIndex;
//   }
//
//   @override
//   int goPrevious() {
//     int previousIndex = --_currentIndex;
//     if (previousIndex == -1) {
//       previousIndex = _list.length - 1;
//     }
//     return previousIndex;
//   }
//
//   @override
//   void onPageChanged(int index) {
//     _currentIndex = index;
//     _postDataToView();
//   }
//
//   @override
//   Sink get inputSliderViewObject => _streamController.sink;
//
//   //OnBoarding ViewModel outputs
//   @override
//   Stream<SliderViewObject> get outputSliderViewObject =>
//       _streamController.stream.map((sliderViewObject) => sliderViewObject);
//
//   // onboarding private functions
//   void _postDataToView() {
//     inputSliderViewObject.add(
//         SliderViewObject(_list[_currentIndex], _list.length, _currentIndex));
//   }
//
//   List<SliderObject> _getSliderData() => [
//         SliderObject(AppStrings.onBoardingTitle1.tr(),
//             AppStrings.onBoardingSubTitle1.tr(), ImageAssets.onboardingLogo1),
//         SliderObject(AppStrings.onBoardingTitle2.tr(),
//             AppStrings.onBoardingSubTitle2.tr(), ImageAssets.onboardingLogo2),
//         SliderObject(AppStrings.onBoardingTitle3.tr(),
//             AppStrings.onBoardingSubTitle3.tr(), ImageAssets.onboardingLogo3),
//         SliderObject(AppStrings.onBoardingTitle4.tr(),
//             AppStrings.onBoardingSubTitle4.tr(), ImageAssets.onboardingLogo4),
//       ];
// }
//
// // inputs mean that "Orders" that our view model will receive from view
// abstract class OnBoardingViewModelInputs {
//   int goNext(); // when user clicks on right arrow or swipe left
//   int goPrevious(); // when user clicks on left arrow or swipe right
//   void onPageChanged(int index);
//
//   // stream controller input
//   Sink get inputSliderViewObject;
// }
//
// abstract class OnBoardingViewModelOutputs {
//   // stream controller output
//   Stream<SliderViewObject> get outputSliderViewObject;
// }
