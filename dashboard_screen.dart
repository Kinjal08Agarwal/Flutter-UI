import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _count = 0;

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
