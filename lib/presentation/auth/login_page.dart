import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nmonybag/presentation/auth/registationPage.dart';
import 'package:nmonybag/presentation/auth/util/validation_ruls.dart';

class LoginPage extends HookWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailControlar = useTextEditingController();
    final passwordControlar = useTextEditingController();
    final showPassword = useState(false);
    final formkey = useMemoized(() => GlobalKey<FormState>());
    return Scaffold(
      body: Form(
        key: formkey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          shrinkWrap: true,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 200, bottom: 40),
              child: Text(
                'Login',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            TextFormField(
              controller: emailControlar,
              validator: ValidationRuls.email,
              decoration: const InputDecoration(
                  labelText: 'Email',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple))),
              enabled: true,
            ),
            const SizedBox(height: 20),
            TextFormField(
                controller: passwordControlar,
                validator: ValidationRuls.password,
                obscureText: !showPassword.value,
                decoration: InputDecoration(
                    suffix: InkWell(
                        onTap: () {
                          showPassword.value = !showPassword.value;
                        },
                        child: showPassword.value
                            ? const Icon(
                                CupertinoIcons.eye,
                                color: Colors.deepPurple,
                              )
                            : const Icon(
                                CupertinoIcons.eye_slash,
                                color: Colors.grey,
                              )),
                    labelText: 'Password',
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurple)),
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurple))),
                enabled: true),
            SizedBox(height: 80),
            ElevatedButton(
                onPressed: () {
                  print(formkey.currentState?.validate());
                },
                child: Text('Login')),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegistatioPage()));
                },
                child: Text('Sign Up'))
          ],
        ),
      ),
    );
  }
}
