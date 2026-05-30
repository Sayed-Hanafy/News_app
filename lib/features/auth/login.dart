import 'package:flutter/material.dart';
import 'package:news_app/core/them/light_color.dart';
import 'package:news_app/features/auth/custom_text_form_field.dart';

class LoginScreen extends StatefulWidget {
 const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  

  TextEditingController emailController = TextEditingController();

  TextEditingController passWordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image.asset('assets/images/logo.png', height: 45)),
              SizedBox(height: 24),
              Text(
                'Welcome to Newts',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),

              SizedBox(height: 16),
              CustomTextFormField(
                controller: emailController,
                hintText: 'Enter your email',
                title: 'Email',
              ),
              SizedBox(height: 12),
              CustomTextFormField(
                controller: passWordController,
                hintText: '*************',
                title: 'Password',
                obscureText: true,
              ),
              SizedBox(height: 20),

              Center(
                child: SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: LightColor.primary,
                    ),
                    onPressed: () {},
                    child: Text('Sign In'),
                  ),
                ),
              ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don’t have an account ?',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(width: 8),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: LightColor.primary,
                      ),
                    ),
                  ),
                ],
              ),

              // TextFormField(
              //   keyboardType: TextInputType.emailAddress,
              //   decoration: InputDecoration(
              //     filled: true,
              //     fillColor: Colors.white,
              //     hintText: "Enter your email",
              //     border: OutlineInputBorder(),

              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
