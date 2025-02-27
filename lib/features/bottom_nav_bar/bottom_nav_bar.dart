import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trend/features/add_post/presentation/new_post.dart';
import 'package:trend/features/auth/presentation/manager/auth_bloc.dart';
import 'package:trend/features/auth/presentation/manager/auth_state.dart';
import 'package:trend/features/auth/presentation/pages/login_screen.dart';
import 'package:trend/features/bottom_nav_bar/Bloc/Bottom_Nav_Bloc.dart';
import 'package:trend/features/bottom_nav_bar/Bloc/Bottom_Nav_States.dart';
import 'package:trend/features/bottom_nav_bar/Bloc/Bottom_Nav_event.dart';
import 'package:trend/features/notifications/presentation/Manager/NotificationBloc/notification_bloc.dart';
import 'package:trend/features/notifications/presentation/pages/notifications.dart';
import 'package:trend/features/posts/presentation/Pages/home_page.dart';
import 'package:trend/features/profile/presentation/Pages/my_profile/my_profile.dart';
import 'package:trend/shared/utiles/dependancy_injection.dart';
import 'package:trend/third_parties_module/abstract/i_deep_linking_module.dart';

import '../../shared/const/colors.dart';
import '../explore_page/presentation/pages/explore_main.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isFirstDependency = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!isFirstDependency) return;
    isFirstDependency = false;
    getIt<IDeepLinkingModule>().init(context: context);
  }

  final List<Widget> _pages = [
    const HomePage(),
    const ExploreMainPage(),
    const AddNewPostPage(),
    const Notifications(),
    const MyProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BottomNavBloc(),
      child: BlocBuilder<BottomNavBloc, BottomNavState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: IndexedStack(
              index: state.selectedIndex,
              children: _pages,
            ),
            bottomNavigationBar: SafeArea(
              child: Container(
                height: 45,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildNavBarItem(
                      context,
                      iconPath: 'assets/icons/home_icon.svg',
                      index: 0,
                      currentIndex: state.selectedIndex,
                    ),
                    _buildNavBarItem(
                      context,
                      iconPath: 'assets/icons/search.svg',
                      index: 1,
                      currentIndex: state.selectedIndex,
                    ),
                    _buildNavBarItem(
                      context,
                      iconPath: 'assets/icons/plus-circle.svg',
                      index: 2,
                      currentIndex: state.selectedIndex,
                    ),
                    _buildNavBarItem(
                      context,
                      iconPath: 'assets/icons/bell.svg',
                      index: 3,
                      currentIndex: state.selectedIndex,
                    ),
                    _buildNavBarItem(
                      context,
                      iconPath: 'assets/icons/person.svg',
                      index: 4,
                      currentIndex: state.selectedIndex,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildNavBarItem(
    BuildContext context, {
    required String iconPath,
    required int index,
    required int currentIndex,
  }) {
    return GestureDetector(
      onTap: () async {
        BlocProvider.of<BottomNavBloc>(context).add(BottomNavItemSelected(index));
        if (index == 3) {
          BlocProvider.of<NotificationBloc>(context).add(FetchNotificationsEvent());
        }
        if (index == 4) {
          AuthState state = context.read<AuthBloc>().state;
          if (state is! AuthAuthenticated) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen2()),
            );
          }
        }
      },
      child: SvgPicture.asset(
        iconPath,
        height: 25.5,
        color: currentIndex == index ? Color(AppColors.black) : Color(AppColors.greyDark),
      ),
    );
  }
}
