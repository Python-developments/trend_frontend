/*

import 'package:shared_preferences/shared_preferences.dart';
import 'package:trend/features/profile/domain/repositories/profile_repository.dart';
import 'package:trend/features/profile/presentation/Manager/Bloc_Following/State_Following.dart';
import 'package:trend/features/profile/presentation/Manager/Bloc_Following/event_Following.dart';

class FollowingBloc extends Bloc<FollowingEvent, FollowingState> {
  final ProfileRepository repository;
  FollowingBloc(this.repository) : super(FollowingInitialState()) {
    on<FollowUserEvent>(_followUserEvent);
    on<UnFollowUserEvent>(_unfollowUserEvent);
  }

  Future<void> _followUserEvent(
      final FollowUserEvent event, final Emitter<FollowingState> emit) async {
    emit(FollowingLoadding());
    try {
      await repository.followUser(event.userId);
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      int c = int.parse(sharedPreferences.getString('following')!);

      c++;
      final bool x = await sharedPreferences.setString('following', c.toString());
      print('follow success $x');
      print(c);
      emit(FollowingSuccess());
    } catch (e) {
      emit(FollowingFailuer());
    }
  }

  Future<void> _unfollowUserEvent(
      final UnFollowUserEvent event, final Emitter<FollowingState> emit) async {
    emit(UnFollowingLoadding());
    try {
      await repository.unfollowUser(event.userId);
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

      int c = int.parse(sharedPreferences.getString('following')!);
      c--;
      final bool x = await sharedPreferences.setString('following', c.toString());

      emit(UnFollowingSuccess());
    } catch (e) {
      emit(UnFollowingFailuer());
    }
  }
}
*/
