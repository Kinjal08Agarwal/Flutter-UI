import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome Form UI',
      debugShowCheckedModeBanner: false,
      home: const WelcomeFormPage(),
    );
  }
}

class WelcomeFormPage extends StatelessWidget {
  const WelcomeFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          SizedBox.expand(
            child: Image.asset(
              'assets/background.png', // Place your image in assets/images or assets/
              fit: BoxFit.cover,
            ),
          ),

          // Dark transparent form card
          Center(
            child: Container(
              width: 320,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.75),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Welcome',
                    style: TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "let's start your journey!",
                    style: TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(height: 24),
                  TextField(
                    decoration: _inputDecoration('Name'),
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    decoration: _inputDecoration('Last Name'),
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    decoration: _inputDecoration('Email'),
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DashboardPage()),
                        );
                      },
                      child: const Text('submit', style: TextStyle(fontSize: 16)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: Colors.white54),
      filled: true,
      fillColor: Colors.white10,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE7E9EE),
      body: Row(
        children: [
          // Sidebar
          Container(
            width: 200,
            color: Colors.white,
            child: Column(
              children: [
                const SizedBox(height: 30),
                const Icon(Icons.dashboard, size: 50),
                buildMenuItem(context, Icons.dashboard, "Dashboard"),
                ExpansionTile(
                  leading: const Icon(Icons.shopping_cart),
                  title: const Text("Purchase"),
                  children: const [
                    ListTile(title: Text("Purchase List")),
                    ListTile(title: Text("Payment")),
                    ListTile(title: Text("Purchase Return")),
                    ListTile(title: Text("Return Receive")),
                  ],
                ),
                buildMenuItem(context, Icons.shopping_bag, "Product"),
                buildMenuItem(context, Icons.bar_chart, "Reports"),
                buildMenuItem(context, Icons.person, "Customer"),
                buildMenuItem(context, Icons.factory, "Manufacturer"),
                buildMenuItem(context, Icons.people, "Employee"),
                buildMenuItem(context, Icons.settings, "Settings"),
              ],
            ),
          ),

          // Main content
          Expanded(
            child: Column(
              children: [
                // Top bar
                Container(
                  color: Colors.white,
                  height: 60,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.menu),
                          const SizedBox(width: 16),
                          Container(
                            width: 200,
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Search",
                                prefixIcon: const Icon(Icons.search),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.notifications_none),
                          const SizedBox(width: 16),
                          const CircleAvatar(
                            backgroundImage: AssetImage("assets/profile.jpg"), // optional
                          ),
                          const SizedBox(width: 8),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text("Thomas F."),
                              Text("Admin", style: TextStyle(fontSize: 12)),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),

                // Main body
                const Expanded(
                  child: Center(
                    child: Text("Welcome to the Dashboard!"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMenuItem(BuildContext context, IconData icon, String label) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      onTap: () {
        // You can add navigation or other actions here
      },
    );
  }
}
