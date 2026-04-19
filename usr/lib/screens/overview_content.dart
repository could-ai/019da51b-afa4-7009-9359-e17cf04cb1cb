import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/stat_card.dart';
import '../widgets/course_card.dart';

class OverviewContent extends StatelessWidget {
  const OverviewContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Welcome back, John!',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Here is your learning progress for this week.',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
                // Search Box
                Container(
                  width: 300,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: 'Search courses...',
                      border: InputBorder.none,
                      icon: Icon(Icons.search, color: AppColors.textSecondary),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),

            // Statistics Grid
            LayoutBuilder(
              builder: (context, constraints) {
                int crossAxisCount = constraints.maxWidth > 900 ? 3 : (constraints.maxWidth > 600 ? 2 : 1);
                return GridView.count(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 24,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  childAspectRatio: 2.5,
                  children: const [
                    StatCard(
                      title: 'Active Courses',
                      value: '4',
                      icon: Icons.play_circle_fill,
                      color: AppColors.statActive,
                    ),
                    StatCard(
                      title: 'Completed Courses',
                      value: '12',
                      icon: Icons.check_circle,
                      color: AppColors.statCompleted,
                    ),
                    StatCard(
                      title: 'Hours Learned',
                      value: '56h',
                      icon: Icons.access_time_filled,
                      color: AppColors.statHours,
                    ),
                  ],
                );
              },
            ),
            
            const SizedBox(height: 40),

            // In Progress Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'In Progress',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('View All'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            
            // Course List
            SizedBox(
              height: 280,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  CourseCard(
                    title: 'Advanced Flutter Architecture',
                    category: 'Mobile Dev',
                    progress: 0.65,
                    imageUrl: '',
                    duration: '4h 30m left',
                  ),
                  SizedBox(width: 24),
                  CourseCard(
                    title: 'UI/UX Design Principles',
                    category: 'Design',
                    progress: 0.30,
                    imageUrl: '',
                    duration: '8h 15m left',
                  ),
                  SizedBox(width: 24),
                  CourseCard(
                    title: 'Database Management Basics',
                    category: 'Backend',
                    progress: 0.85,
                    imageUrl: '',
                    duration: '1h 10m left',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
