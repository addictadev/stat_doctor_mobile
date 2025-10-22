import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
part 'bnb_state.dart';

class BnbCubit extends Cubit<BnbState> {
  BnbCubit() : super(BnbState(bnbIndex: 0));
  
  void changeIndex({required int currentIndex}) {
    _haticFeedback();
    emit(BnbState(bnbIndex: currentIndex));
  }
  
  Future<void> _haticFeedback() async{
    final canVibrate = await Haptics.canVibrate();
    if(canVibrate) await Haptics.vibrate(HapticsType.success);
  }
}
