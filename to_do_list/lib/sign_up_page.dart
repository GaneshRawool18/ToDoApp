import 'dart:developer';
import "package:flutter/material.dart";
import 'package:to_do_list/firebase_services.dart';
import 'package:to_do_list/login_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isObscure = true;
  TextEditingController nameController = TextEditingController();
  TextEditingController gmailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void dataClear() {
    nameController.clear();
    gmailController.clear();
    passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 226, 231, 233),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "To Do List",
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w800,
                    color: Colors.blue),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                width: 330,
                height: 500,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 190, 214, 233),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: TextField(
                        controller: nameController,
                        decoration: const InputDecoration(
                            hintText: "Enter User Name ",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(width: 1)),
                            labelText: "User Name ",
                            labelStyle: TextStyle(
                              color: Color.fromARGB(255, 11, 11, 11),
                              fontSize: 18,
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            suffixIcon: Icon(Icons.person)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: TextField(
                        controller: gmailController,
                        decoration: const InputDecoration(
                            hintText: "Enter User Email ",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(width: 1)),
                            labelText: "Email ",
                            labelStyle: TextStyle(
                              color: Color.fromARGB(255, 11, 11, 11),
                              fontSize: 18,
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            suffixIcon: Icon(Icons.mail)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: TextField(
                        controller: passwordController,
                        obscureText: isObscure,
                        decoration: InputDecoration(
                          hintText: "Enter Password",
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                          ),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(width: 1)),
                          labelText: " Password ",
                          labelStyle: const TextStyle(
                            color: Color.fromARGB(255, 11, 11, 11),
                            fontSize: 18,
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          suffixIcon: IconButton(
                            icon: Icon(
                              isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                isObscure = !isObscure;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        try {
                          if (nameController.text.trim().isNotEmpty &&
                              gmailController.text.trim().isNotEmpty &&
                              passwordController.text.trim().isNotEmpty) {
                            FirebaseServices.firebaseAddData(
                                nameController.text,
                                gmailController.text,
                                passwordController.text);
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return const LoginPage();
                            }));

                            dataClear();
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Please enter all details "),
                              backgroundColor: Color.fromARGB(255, 216, 9, 16),
                            ));
                          }
                        } catch (e) {
                          log("Error : $e");
                        }
                      },
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 40),
                          child: Container(
                            width: 100,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color.fromARGB(255, 28, 31, 252)),
                            child: const Padding(
                              padding: EdgeInsets.only(left: 20, top: 5),
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
