import 'package:flutter/material.dart';
import 'api_service.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Reset Password")),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 40),
              Image.asset(
                'assets/images/logo_forgot_password.png',
                width: 200,
                height: 200,
              ),

              const SizedBox(height: 30),

              // EMAIL
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "The field cannot be empty";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              // RESET BUTTON
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {

                    await ApiService().resetPassword(
                      emailController.text,
                    );

                    showDialog(
                      context: context,
                      builder: (_) => const AlertDialog(
                        title: Text("Thông báo"),
                        content: Text("Đã reset password"),
                      ),
                    );
                  }
                },
                child: const Text("Reset Password"),
              ),

              const SizedBox(height: 10),

              // BACK BUTTON
              OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Back"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}