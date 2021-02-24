import 'package:beyondwallet/viewModels/base_viewModel.dart';

class UserProfileRootViewModel extends BaseViewModel {
  int _tabBarPosition = 0;

  int get tabBarPosition => _tabBarPosition;

  void updateTabBarPosition(int index) {
    _tabBarPosition = index;
    notifyListeners();
  }
}
