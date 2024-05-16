import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_gallery/controller/cubit/log_in_cubit.dart';
import 'package:my_gallery/utils/Api_service.dart';
import 'package:my_gallery/widgets/custom_text_field.dart';

class LoginFields extends StatefulWidget {
  const LoginFields({
    super.key,
  });

  @override
  State<LoginFields> createState() => _LoginFieldsState();
}

class _LoginFieldsState extends State<LoginFields> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(150),
        borderRadius: BorderRadius.circular(32.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('LOG IN',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.grey.shade800,
                    fontSize: 32.0,
                    fontWeight: FontWeight.w700)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: CustomTextField(
                textController: emailController,
                label: '    User Name',
              ),
            ),
            CustomTextField(
              label: '    Password',
              textController: passwordController,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  )),
                  backgroundColor: MaterialStateProperty.all(
                    const Color(0xFF7BB3FF),
                  )),
              onPressed: () async {
                await BlocProvider.of<LogInCubit>(context).logInUser(
                    email: emailController.text,
                    password: passwordController.text);
              },
              child: BlocBuilder<LogInCubit, LogInState>(
                builder: (context, state) {
                  if (state is LogInLoading) {
                    return const CircularProgressIndicator();
                  } else {
                    return const Text('SUBMIT',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700));
                  }
                },
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
