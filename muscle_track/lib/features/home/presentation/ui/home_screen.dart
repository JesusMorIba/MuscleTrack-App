import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:muscle_track/core/core.dart';
import 'package:muscle_track/features/home/presentation/ui/widget/history_content.dart';
import 'package:muscle_track/features/home/presentation/ui/widget/home_content.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeContent(),
    const Center(child: Text('Discover Page')),
    const Center(child: Text('Report Page')),
    const HistoryContent(),
    const Center(child: Text('Settings Page')),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icons/icon_small.png',
                width: 40,
                height: 40,
              ),
              const SizedBox(width: 4),
              Text(
                'Muscle Track',
                style: AppTextStyles.heading4(color: AppColors.black),
              ),
            ],
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
        ),
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: AppTextStyles.bodyXSmallBold(),
          unselectedLabelStyle: AppTextStyles.bodyXSmallBold(),
          backgroundColor: AppColors.white,
          elevation: 2,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/home.svg',
                height: 24,
                colorFilter: _currentIndex == 0
                    ? const ColorFilter.mode(AppColors.primary, BlendMode.srcIn)
                    : const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/discover.svg',
                height: 24,
                colorFilter: _currentIndex == 1
                    ? const ColorFilter.mode(AppColors.primary, BlendMode.srcIn)
                    : const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
              ),
              label: 'Discover',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/report.svg',
                height: 24,
                colorFilter: _currentIndex == 2
                    ? const ColorFilter.mode(AppColors.primary, BlendMode.srcIn)
                    : const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
              ),
              label: 'Report',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/history.svg',
                height: 24,
                colorFilter: _currentIndex == 3
                    ? const ColorFilter.mode(AppColors.primary, BlendMode.srcIn)
                    : const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
              ),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/setting.svg',
                height: 24,
                colorFilter: _currentIndex == 4
                    ? const ColorFilter.mode(AppColors.primary, BlendMode.srcIn)
                    : const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
              ),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
