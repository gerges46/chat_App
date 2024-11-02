import 'package:chat_app/helper/show_snack_bar.dart';
import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// ignore: must_be_immutable
class RegisterPage extends StatefulWidget {
  static String id = 'RegisterPage';

  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? email;

  String? password;

 bool isLoading =false;

  GlobalKey<FormState> globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: const Color(0xff2B475E),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Form(
            key: globalKey,
            child: ListView(
              children: [
                const SizedBox(
                  height: 75,
                ),
                Image.asset(
                  'assets/images/scholar.png',
                  height: 100,
                ),
           const     Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   Text(
                      'Scholar Chat',
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontFamily: 'Pacifico',
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 75,
                ),
                const Row(
              
                  children: [
                    Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomTextFormField(
                  onChanged: (data) {
                    email = data;
                  },
                  hint: 'Email',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  onChanged: (data) {
                    password = data;
                  },
                  hint: 'Password',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomButton(
                  text: 'Register',
                  onTap: () async {
                    if (globalKey.currentState!.validate()) {
                   isLoading=true;
                   setState(() {
                     
                   });
                      try {
                        await registerUser();
                        Navigator.pushNamed(context, ChatPage.id,arguments: email);
                      showSnackBar(context, 'success');
                      } on FirebaseException catch (e) {
                        if (e.code == 'weak-password') {
                          showSnackBar(context, ' weak password');
                        } else if (e.code == 'email-aready-in-use') {
                          showSnackBar(context, 'email aready exist');
                        }
                      } catch (e) {
                        print(e);
                      }
               
                    }
                    isLoading=false;
                    setState(() {
                      
                    });
                   
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'aready have an account ?',
                      style: TextStyle(color: Colors.white),
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          '   Login',
                          style: TextStyle(color: Color(0xffc7EDE6)),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }



  Future<void> registerUser() async {

    UserCredential  user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}
