import 'package:fake_store_app/constants/constant.dart';
import 'package:fake_store_app/screens/home_screen.dart';
import 'package:fake_store_app/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  TextEditingController usernameController =
      TextEditingController(text: 'mor_2314');
  TextEditingController passwordController =
      TextEditingController(text: '83r5^_');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fake Store App'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.pinkAccent,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: basePadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: usernameController,
                decoration: const InputDecoration(
                  labelText: "Username",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () async {
                    final getToken = await ApiService().userLogin(
                        usernameController.text, passwordController.text);

                    if (getToken['token'] != null) {
                      // print(getToken['token'] != null);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              'Login Success! Your Token id is: ${getToken['token']}'),
                          backgroundColor: Colors.green,
                        ),
                      );
                      Future.delayed(Duration(seconds: 2), () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const HomeScreen(),
                          ),
                        );
                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Username or Password is Incorrect'),
                          backgroundColor: Colors.green,
                        ),
                      );
                      
                    }
                  },
                  child: Text(
                    'Login',
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
