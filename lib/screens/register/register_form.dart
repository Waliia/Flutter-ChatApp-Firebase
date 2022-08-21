//import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_firebase_demo/controller/login_controller.dart';
import 'package:flutter_firebase_demo/controller/register_controller.dart';
import 'package:flutter_firebase_demo/widgets/simple_btn.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  // int activeIndex = 0;
  // @override
  // void initState() {
  //   Timer.periodic(const Duration(seconds: 5), (timer) {
  //     setState(() {
  //       activeIndex++;
  //       if (activeIndex == 4) activeIndex = 0;
  //     });
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    final GlobalKey<FormFieldState> emailGlobalKey =
        GlobalKey<FormFieldState>();
    final GlobalKey<FormFieldState> passwordGlobalKey =
        GlobalKey<FormFieldState>();
    final GlobalKey<FormFieldState> nameGlobalKey = GlobalKey<FormFieldState>();

    //var bloc = Provider.of<RegisterBloc>(context, listen: false);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          child: Column(children: [
            const SizedBox(
              height: 50,
            ),
            // Container(
            //   height: 350,
            //   child: Stack(
            //     children: [
            //       Positioned(
            //         top: 0,
            //         bottom: 0,
            //         left: 0,
            //         right: 0,
            //         child: AnimatedOpacity(
            //           duration: const Duration(seconds: 1),
            //           opacity: activeIndex == 0 ? 1 : 0,
            //           curve: Curves.linear,
            //           child: Image.network(
            //             'https://ouch-cdn2.icons8.com/As6ct-Fovab32SIyMatjsqIaIjM9Jg1PblII8YAtBtQ/rs:fit:784:784/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9zdmcvNTg4/LzNmMDU5Mzc0LTky/OTQtNDk5MC1hZGY2/LTA2YTkyMDZhNWZl/NC5zdmc.png',
            //             height: 400,
            //           ),
            //         ),
            //       ),
            //       Positioned(
            //         top: 0,
            //         left: 0,
            //         right: 0,
            //         bottom: 0,
            //         child: AnimatedOpacity(
            //           opacity: activeIndex == 1 ? 1 : 0,
            //           duration: const Duration(seconds: 1),
            //           curve: Curves.linear,
            //           child: Image.network(
            //             'https://ouch-cdn2.icons8.com/vSx9H3yP2D4DgVoaFPbE4HVf6M4Phd-8uRjBZBnl83g/rs:fit:784:784/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9zdmcvNC84/MzcwMTY5OS1kYmU1/LTQ1ZmEtYmQ1Ny04/NTFmNTNjMTlkNTcu/c3Zn.png',
            //             height: 400,
            //           ),
            //         ),
            //       ),
            //       Positioned(
            //         top: 0,
            //         left: 0,
            //         right: 0,
            //         bottom: 0,
            //         child: AnimatedOpacity(
            //           opacity: activeIndex == 2 ? 1 : 0,
            //           duration: const Duration(seconds: 1),
            //           curve: Curves.linear,
            //           child: Image.network(
            //             'https://ouch-cdn2.icons8.com/fv7W4YUUpGVcNhmKcDGZp6pF1-IDEyCjSjtBB8-Kp_0/rs:fit:784:784/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9zdmcvMTUv/ZjUzYTU4NDAtNjBl/Yy00ZWRhLWE1YWIt/ZGM1MWJmYjBiYjI2/LnN2Zw.png',
            //             height: 400,
            //           ),
            //         ),
            //       ),
            //       Positioned(
            //         top: 0,
            //         left: 0,
            //         right: 0,
            //         bottom: 0,
            //         child: AnimatedOpacity(
            //           opacity: activeIndex == 3 ? 1 : 0,
            //           duration: const Duration(seconds: 1),
            //           curve: Curves.linear,
            //           child: Image.network(
            //             'https://ouch-cdn2.icons8.com/AVdOMf5ui4B7JJrNzYULVwT1z8NlGmlRYZTtg1F6z9E/rs:fit:784:767/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9zdmcvOTY5/L2NlMTY1MWM5LTRl/ZjUtNGRmZi05MjQ3/LWYzNGQ1MzhiOTQ0/Mi5zdmc.png',
            //             height: 400,
            //           ),
            //         ),
            //       )
            //     ],
            //   ),
            // ),
            const SizedBox(
              height: 40,
            ),
            TextFormField(
              key: nameGlobalKey,
              validator: isValidName,
              controller: nameController,
              onChanged: (value) {
                emailGlobalKey.currentState!.validate();
              },
              keyboardType: TextInputType.name,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                  label: const Text('Username'),
                  hintText: 'username',
                  contentPadding: const EdgeInsets.all(0.0),
                  labelStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                  prefixIcon: const Icon(
                    Icons.person,
                    color: Colors.black,
                    size: 18,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: Colors.grey.shade200, width: 2)),
                  floatingLabelStyle:
                      const TextStyle(color: Colors.black, fontSize: 18),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: Colors.black, width: 1.5))),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              key: emailGlobalKey,
              validator: isValidEmail,
              controller: emailController,
              onChanged: (value) {
                emailGlobalKey.currentState!.validate();
              },
              keyboardType: TextInputType.emailAddress,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                  label: const Text('Email'),
                  hintText: 'e-mail',
                  contentPadding: const EdgeInsets.all(0.0),
                  labelStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                  prefixIcon: const Icon(
                    Icons.person,
                    color: Colors.black,
                    size: 18,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: Colors.grey.shade200, width: 2)),
                  floatingLabelStyle:
                      const TextStyle(color: Colors.black, fontSize: 18),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: Colors.black, width: 1.5))),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              key: passwordGlobalKey,
              validator: isValidPassword,
              controller: passwordController,
              onChanged: (value) {
                emailGlobalKey.currentState!.validate();
              },
              obscureText: true,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                  label: const Text('Password'),
                  hintText: 'password',
                  contentPadding: const EdgeInsets.all(0.0),
                  labelStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                  prefixIcon: const Icon(
                    Icons.person,
                    color: Colors.black,
                    size: 18,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: Colors.grey.shade200, width: 2)),
                  floatingLabelStyle:
                      const TextStyle(color: Colors.black, fontSize: 18),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: Colors.black, width: 1.5))),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // TextButton(
                //     onPressed: () {},
                //     child: const Text(
                //       'Forgot Password?',
                //       style: TextStyle(
                //           color: Colors.black,
                //           fontSize: 14,
                //           fontWeight: FontWeight.w400),
                //     )),
                const SizedBox(
                  width: 30,
                ),
                RegisterButton(
                  registerBtnClick: btnRegisterClick,
                  nameController: nameController,
                  passwordController: passwordController,
                  emailController: emailController,
                  nameValidationKey: nameGlobalKey,
                  emailValidationKey: emailGlobalKey,
                  passwordValidationKey: passwordGlobalKey,
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already Have an Account!',
                  style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
                TextButton(
                  onPressed: (() {
                    loginClick(context);
                  }),
                  child: const Text('Login',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 14,
                          fontWeight: FontWeight.w400)),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
