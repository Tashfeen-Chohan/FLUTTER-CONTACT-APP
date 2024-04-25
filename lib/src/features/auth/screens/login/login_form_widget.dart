import 'package:flutter/material.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                label: Text("Email"),
                prefixIcon: Icon(Icons.email),
                hintText: "YOUR EMAIL",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              decoration: const InputDecoration(
                label: Text("PASSWORD"),
                prefixIcon: Icon(Icons.fingerprint),
                suffixIcon: Icon(Icons.remove_red_eye),
                hintText: "********",
                border: OutlineInputBorder(),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                child: const Text("Forget Password?"),
                onPressed: () {},
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  backgroundColor: Colors.black,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
                child: const Text("LOGIN"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
