import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/category.dart';
import '../widgets/category_card.dart';
import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _username = '';

  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  Future<void> _loadUsername() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _username = prefs.getString('username') ?? 'User';
    });
  }

  Future<void> _logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);

    if (mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Category> categories = [
      Category(
        id: 'science',
        name: 'Science',
        icon: Icons.science,
        color: Colors.blue,
        description: 'Test your knowledge of scientific principles',
      ),
      Category(
        id: 'geography',
        name: 'Geography',
        icon: Icons.public,
        color: Colors.green,
        description: 'Challenge yourself with world geography',
      ),
      Category(
        id: 'mathematics',
        name: 'Mathematics',
        icon: Icons.calculate,
        color: Colors.red,
        description: 'Solve challenging math problems',
      ),
      Category(
        id: 'aptitude',
        name: 'Aptitude',
        icon: Icons.psychology,
        color: Colors.purple,
        description: 'Test your logical reasoning skills',
      ),
      Category(
        id: 'chemistry',
        name: 'Chemistry',
        icon: Icons.science_outlined,
        color: Colors.orange,
        description: 'Explore chemical elements and reactions',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Categories'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              showDialog(
                context: context,
                builder:
                    (context) => AlertDialog(
                      title: const Text('Logout'),
                      content: const Text('Are you sure you want to logout?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            _logout();
                          },
                          child: const Text('Logout'),
                        ),
                      ],
                    ),
              );
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello, $_username!',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Choose a category to start the quiz',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.85,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: categories.length,
              itemBuilder:
                  (ctx, index) => CategoryCard(category: categories[index]),
            ),
          ),
        ],
      ),
    );
  }
}
