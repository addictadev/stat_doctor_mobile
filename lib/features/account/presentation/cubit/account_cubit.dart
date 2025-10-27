import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stat_doctor/core/injection/injection_container.dart';
import 'package:stat_doctor/core/storage/data/storage.dart';
import 'package:stat_doctor/features/account/data/models/user_model.dart';
import 'package:stat_doctor/features/account/data/repository/account_repoistory.dart';
part 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  final AccountRepoistory accountRepoistory;
  AccountCubit({required this.accountRepoistory}) : super(AccountInitial());

  Future<void> getProfile() async {
    UserModel? user = sl<Storage>().getUserData();
    user != null ? emit(ProfileLoaded(user: user)) : emit(ProfileLoading());
    final result = await accountRepoistory.getProfile();
    if (!isClosed) {
      result.fold(
        (failure) => emit(ProfileFailure(message: failure.message)),
        (success) {
         if(user != null) {emit(ProfileLoading());}
         emit(ProfileLoaded(user: success)); 
        }
      );
    }
  }
}
