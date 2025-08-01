import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lilac/core/provider/customer_model_provider.dart';
import 'package:lilac/core/utils/theme/theme.dart';
import 'package:lilac/core/widgets/customTextField_common.dart';
import 'package:lilac/features/auth/view/login_screen.dart';
import 'package:lilac/features/chat/view/chat_screen.dart';
import 'package:lilac/features/messages/provider/home_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContactUsersScreen extends ConsumerStatefulWidget {
  const ContactUsersScreen({super.key});

  @override
  ConsumerState<ContactUsersScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<ContactUsersScreen> {
  @override
  Widget build(BuildContext context) {
    final customerModel = ref.read(customerModelProvider);
    final userId = ref.read(userIdProvider);

    print("userId  $userId");

    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Messages", style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(onPressed: () async{
            SharedPreferences prefs =await SharedPreferences.getInstance();
            prefs.remove("userId");
            prefs.remove("isLoggedIn");

            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => LoginScreen(),), (route) => false,);

          }, icon: Icon(Icons.logout))
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: h * 0.12,
              child: Consumer(
                builder: (context, ref, child) => ref
                    .watch(messagesAsyncNotifierProvider)
                    .when(
                      data: (data) => ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        itemCount: data.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: w * 0.07,
                                backgroundImage: NetworkImage(
                                  data[index].attributes.profilePhotoUrl ?? '',
                                ),
                                backgroundColor: Colors
                                    .grey[200], // optional placeholder color
                              ),
                              const SizedBox(height: 4),
                              Text(
                                data[index].attributes.name,
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                      error: (error, stackTrace) => Text(error.toString()),
                      loading: () => Center(child: CircularProgressIndicator()),
                    ),
              ),
            ),

             Padding(
            padding:  EdgeInsets.only(left:  w*0.02,right: w*0.02),
            child:  SizedBox(
            width: w,
            child: TextFormField(
              style: TextStyle(
                fontFamily: 'Urbanist',
                fontSize: w * 0.037,
                color: Palette.blackColor,
              ),
              decoration: InputDecoration(
                hintText: "Search",
                hintStyle: TextStyle(
                  fontFamily: 'Urbanist',
                  fontSize: w * 0.036,
                  color: Palette.blackColor,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(w * 0.06),
                  borderSide: BorderSide(color: Colors.grey, width: w * 0.01),
                ),
                suffixIcon: Icon(Icons.search),
                
              ),
            ),
          ),
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
              child: Consumer(
                builder: (context, ref, child) => ref
                    .watch(messagesAsyncNotifierProvider)
                    .when(
                      data: (data) => ListView.separated(
                        itemCount: data.length,
                        separatorBuilder: (context, index) =>
                            const Divider(thickness: 0.5),
                        itemBuilder: (context, index) => ListTile(
                          leading: CircleAvatar(
                            radius: w * 0.07,
                            backgroundImage: NetworkImage(
                              data[index].attributes.profilePhotoUrl ?? '',
                            ),
                            backgroundColor:
                                Colors.grey[200],
                          ),
                          title: Text(data[index].attributes.name,style: TextStyle(fontWeight: FontWeight.bold),),
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ChatScreen(otherUserID: data[index].id,userName: data[index].attributes.name,),
                            ),
                          ),
                          trailing: Text(data[index].attributes.messageReceivedFromPartnerAt.substring(0,10)),
                        ),
                      ),
                      error: (error, stackTrace) => Text(error.toString()),
                      loading: () => Center(child: CircularProgressIndicator()),
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
