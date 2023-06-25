import 'package:bot_toast/bot_toast.dart';

class Misc {
  const Misc._();

  static void showLoading() {
    BotToast.showLoading(backButtonBehavior: BackButtonBehavior.ignore);
  }

  static void closeAllLoading() {
    BotToast.closeAllLoading();
  }

  static void showToast(String text) {
    BotToast.showText(text: text);
  }

  static String getInitial(String name) {
    return name.trim().isNotEmpty
        ? name.trim().split(RegExp(' +')).map((s) => s[0]).take(2).join()
        : '';
  }
}
