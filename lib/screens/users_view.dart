import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ucaa_datamgt/index.dart';

class UserView extends StatefulWidget {
  const UserView({Key? key}) : super(key: key);

  @override
  _UserViewState createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: PreferredSize(
        child: SafeArea(
          child: Container(
            color: Theme.of(context).backgroundColor,
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Builder(
                  builder: (context) => InkWell(
                    splashColor: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(10),
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: Icon(Icons.arrow_back,
                          size: 28, color: Theme.of(context).primaryColor),
                    ),
                  ),
                ),
                const Text(
                  'User Accounts',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const SizedBox(width: 10),
              ],
            ),
          ),
        ),
        preferredSize: const Size.fromHeight(50),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('users')
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return const Text('Something went wrong');
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Column(
                          children: const [LinearProgressIndicator()],
                        );
                      }
                      if (snapshot.hasData && snapshot.data!.docs.isEmpty) {
                        return Container(
                            height: MediaQuery.of(context).size.height,
                            color: Theme.of(context).backgroundColor,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                SizedBox(height: 10),
                                Text(
                                  'No Users here!',
                                  style: TextStyle(fontSize: 18),
                                )
                              ],
                            ));
                      }
                      return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (BuildContext context, int index) {
                          // Map<String, dynamic> user = snapshot.data!.docs[index]
                          //     .data() as Map<String, dynamic>;
                          var user = Usr('', '', '', '', 1, '');
                          user.fromMap(
                              snapshot.data!.docs[index].id,
                              snapshot.data!.docs[index].data()
                                  as Map<String, dynamic>);
                          return Card(
                            child: ListTile(
                              leading: Icon(Icons.person,
                                  color: Theme.of(context).primaryColor),
                              title: Text(user.email,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16)),
                              subtitle: Text('Role: ' + user.role),
                            ),
                          );
                        },
                      );
                    },
                  )),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.to(() => const AddUser());
        },
        icon: const Icon(Icons.add),
        label: const Text('Add User'),
        backgroundColor: Theme.of(context).primaryColorLight,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
