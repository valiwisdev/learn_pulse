import 'package:flutter/material.dart';
import 'package:learn_pulse/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:go_router/go_router.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _form = GlobalKey<FormState>();

  String? _email = '';
  String? _password = '';
  bool? _isAuthenticating = false;
  bool isLogin = true;

  void _submitForm() {
    final isValid = _form.currentState!.validate();

    if (!isValid) {
      return;
    }

    _form.currentState!.save();

    try {
      setState(() {
        _isAuthenticating = true;
      });

      if (isLogin) {
        // Login user with _email and _password using firebase_auth
      } else {
        // Sign up user with _email and _password using firebase_auth
      }

    } catch (error) {
      // Handle error
      // also add on FirebaseAuthException to handle firebase auth errors and add ScaffoldMessenger to show error messages
    } finally {
      setState(() {
        _isAuthenticating = false;
      });
    }

    // check if user 
  }

  String? _emailValidator(String? value) {
    if (value == null || value.isEmpty || !value.contains('@')) {
      return 'Please enter your email';
    }

    return null;
  }

  String? _passwordValidator(String? value) {
    if (value == null || value.isEmpty || value.length < 6) {
      return 'Please enter your password';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: .center,
              crossAxisAlignment: .center,
              children: [
                Column(
                  spacing: 15,
                  children: [
                    const Text(
                      'Welcome',
                      style: TextStyle(fontSize: 28, fontWeight: .bold),
                    ),
                    Icon(
                      Icons.edit,
                      size: 80,
                      color: theme.colorScheme.primary,
                    ),
                    Padding(
                      padding: const .only(bottom: 30),
                      child: Text(
                        'Sign in to continue',
                        style: TextStyle(fontSize: 20, fontWeight: .bold),
                      ),
                    ),
                  ],
                ),

                Form(
                  key: _form,
                  child: Padding(
                    padding: const .only(left: 30, right: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextFormField(
                          hintText: 'Email',
                          onSaved: (value) {
                            setState(() {
                              _email = value;
                            });
                          },
                          validator: _emailValidator,
                        ),
                        const SizedBox(height: 10),
                        CustomTextFormField(
                          hintText: 'Password',
                          onSaved: (value) {
                            setState(() {
                              _password = value;
                            });
                          },
                          obscureText: true,
                          validator: _passwordValidator,
                        ),
                        const SizedBox(height: 32),
                        SizedBox(
                          width: double.infinity,
                          child: FilledButton(
                            style: FilledButton.styleFrom(
                              backgroundColor: theme.colorScheme.primary,
                              foregroundColor: theme.colorScheme.onPrimary,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: _submitForm,
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Center(
                          child: Text.rich(
                            TextSpan(
                              text: "Don't have an account? ",
                              style: const TextStyle(fontSize: 14),
                              children: [
                                WidgetSpan(
                                  alignment: PlaceholderAlignment.middle,
                                  child: InkWell(
                                    onTap: () {
                                      // Handle sign up navigation
                                    },
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    child: Text(
                                      'Sign Up',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: theme.colorScheme.primary,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
