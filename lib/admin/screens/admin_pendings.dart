import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:learnhub/admin/screens/admin_content.dart';
import 'package:learnhub/common/widgets/course_card.dart';
import 'package:learnhub/providers/pending_provider.dart';
import 'package:provider/provider.dart';

class AllPendings extends StatefulWidget {
  const AllPendings({super.key});

  @override
  State<AllPendings> createState() => _AllPendingsState();
}

class _AllPendingsState extends State<AllPendings> {
  @override
  Widget build(BuildContext context) {
    final pendingProvider = Provider.of<PendingProvider>(context);
    final pendingCourses = pendingProvider.product;

    if (kDebugMode) {
      print('pendingCourses:$pendingCourses');
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('All Pendings'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: pendingCourses.map((course) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  AdminContent(course: course,),
                    ),
                  );
                },
                child: CourseCard(
                  thumbnailUrl: course.imagePath ?? '', 
                  title: course.name ?? 'No Title',
                  author: course.userName ?? 'No Author', 
                  price: course.price.toDouble(),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
