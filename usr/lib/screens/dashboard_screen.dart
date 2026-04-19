import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/sidebar.dart';
import 'overview_content.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Determine if we should show a sidebar or a bottom nav/drawer based on screen width
    final isDesktop = MediaQuery.of(context).size.width > 900;

    return Scaffold(
      appBar: isDesktop ? null : AppBar(
        title: const Text('Dashboard'),
        backgroundColor: AppColors.surface,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
      ),
      drawer: isDesktop ? null : Drawer(
        child: Sidebar(
          selectedIndex: _selectedIndex,
          onItemSelected: (index) {
            setState(() {
              _selectedIndex = index;
            });
            Navigator.pop(context); // Close drawer
          },
        ),
      ),
      body: Row(
        children: [
          if (isDesktop)
            SizedBox(
              width: 250,
              child: Sidebar(
                selectedIndex: _selectedIndex,
                onItemSelected: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
              ),
            ),
          Expanded(
            child: _buildBody(),
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    switch (_selectedIndex) {
      case 0:
        return const OverviewContent();
      case 1:
        return const Center(child: Text('My Courses'));
      case 2:
        return const Center(child: Text('Schedule'));
      case 3:
        return const Center(child: Text('Messages'));
      case 4:
        return const Center(child: Text('Settings'));
      default:
        return const OverviewContent();
    }
  }
}
