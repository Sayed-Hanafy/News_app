import 'package:flutter/material.dart';
import 'package:news_app/core/data_source/local_data/preference_manager.dart';
import 'package:news_app/core/them/light_color.dart';
import 'package:news_app/features/auth/custom_text_form_field.dart';
import 'package:news_app/features/auth/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passWordController = TextEditingController();

  final TextEditingController confirmPassWordController =
      TextEditingController();

  final GlobalKey<FormState> _key = GlobalKey();

  String? errorMessage;
  bool isLoading = false;

  void register() async {
    setState(() {
      errorMessage = null;
      isLoading = true; // Clear previous error message
    });

    final savedUser = PreferencesManager().getString("key_email");
    if (savedUser != null && savedUser == emailController.text) {
      setState(() {
        errorMessage = 'Email already exists';
        isLoading = false;
      });
    } else {
      await PreferencesManager().setString("key_email", emailController.text);
      await PreferencesManager().setString(
        "key_password",
        passWordController.text,
      );
      await PreferencesManager().setBool('key_logged_in_screen', true);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _key,
            child: Center(
              child: SingleChildScrollView(
               // physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.asset('assets/images/logo.png', height: 45),
                    ),
                    SizedBox(height: 24),
                    Text(
                      'Welcome to Newts',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    SizedBox(height: 16),
                    CustomTextFormField(
                      validator: (value) {
                        {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          final emailRegex = RegExp(
                            r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                          );
                          if (!emailRegex.hasMatch(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        }
                      },
                      controller: emailController,
                      hintText: 'Enter your email',
                      title: 'Email',
                      obscureText: false,
                    ),
                    SizedBox(height: 12),
                    CustomTextFormField(
                      validator: (value) {
                        {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        }
                      },
                      controller: passWordController,
                      hintText: '*************',
                      title: 'Password',
                      obscureText: true,
                    ),
                    SizedBox(height: 20),
                    CustomTextFormField(
                      validator: (value) {
                        {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm your password';
                          }
                          if (value != passWordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        }
                      },
                      controller: confirmPassWordController,
                      hintText: '*************',
                      title: 'Confirm Password',
                      obscureText: true,
                    ),
                    SizedBox(height: 20),

                    Text("${errorMessage ?? ''}", style: TextStyle(color: Colors.red)),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: LightColor.primary,
                        ),
                        onPressed: () {
                          if (_key.currentState?.validate() ?? false) {
                            register();
                          }
                        },
                        child: Text('Sign Up'),
                      ),
                    ),
                    SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Have an account ?',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(width: 8),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: LightColor.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
