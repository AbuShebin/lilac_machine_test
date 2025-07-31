import 'package:flutter/material.dart';
import 'package:lilac/core/widgets/customTextField_common.dart';
import 'package:lilac/features/chat/presentation/chat_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: Text("Messages",style: TextStyle(fontWeight: FontWeight.bold),),),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: h * 0.12,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                itemCount: 15,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Column(
                    children: [
                      CircleAvatar(radius:  w * 0.07),
                      const SizedBox(height: 4),
                      const Text("Name", style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: CustomTextField(labelText: "Search", h: h, w: w * 0.95),
            ),

            SizedBox(height: h * 0.015),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.05),
              child: const Text(
                "Chat",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),

            SizedBox(height: h * 0.01),

            Expanded(
              child: ListView.separated(
                itemCount: 20,
                separatorBuilder: (context, index) => const Divider(thickness: 0.5),
                itemBuilder: (context, index) => ListTile(
                  leading: CircleAvatar(radius: w * 0.07),
                  title: const Text("Name"),
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChatScreen(),)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
