import'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,

      // 👇 First page will be Getting Started
      home: GettingStartedPage(),
    );
  }
}

// ======================================================
// GETTING STARTED PAGE
// ======================================================

class GettingStartedPage extends StatelessWidget {
  const GettingStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F2FA),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              const Icon(Icons.login, size: 100, color: Colors.deepPurple),

              const SizedBox(height: 30),

              const Text(
                'Welcome!',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 15),

              const Text(
                'Get started with our app',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),

              const SizedBox(height: 50),
              SizedBox(
                width: double.infinity,

                child: ElevatedButton(
                  onPressed: () {
                    // 👇 Go to Login Page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CreateAccountPage(),
                      ),
                    );
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 15),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),

                  child: const Text(
                    'Get Started',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // LEFT - LOG IN
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },

                    child: const Text(
                      'Log in',
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  // RIGHT - CREATE ACCOUNT
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CreateAccountPage(),
                        ),
                      );
                    },

                    child: const Text(
                      'Create an Account',
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ======================================================
// LOGIN PAGE
// ======================================================

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Password visibility
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login Page',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),

        leading: IconButton(
          icon: const Icon(Icons.message),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Message button clicked")),
            );
          },
        ),

        actions: [
          IconButton(
            icon: const Icon(Icons.add_a_photo),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Add photo clicked")),
              );
            },
          ),
        ],

        centerTitle: true,
        backgroundColor: Colors.blue,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            const Text(
              'Welcome Back!',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 30),

            TextField(
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
            ),

            const SizedBox(height: 20),
            TextField(
              obscureText: !isPasswordVisible,
              decoration: InputDecoration(
                labelText: 'Password',
                border: const OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
                suffixIcon: GestureDetector(
                  onTapDown: (_) {
                    setState(() {
                      isPasswordVisible = true;
                    });
                  },

                  onTapUp: (_) {
                    setState(() {
                      isPasswordVisible = false;
                    });
                  },

                  onTapCancel: () {
                    setState(() {
                      isPasswordVisible = false;
                    });
                  },

                  child: Icon(
                    isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,

              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Log in button clicked")),
                  );
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,

                  padding: const EdgeInsets.symmetric(vertical: 15),

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),

                child: const Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  bool ispasswordvisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create an account',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        //centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Create a new account', style: TextStyle(fontSize: 25)),
            const SizedBox(height: 30),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
            ),
            const SizedBox(height: 30),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Full Name',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person_outline),
              ),
            ),
            const SizedBox(height: 30),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.password),
              ),
            ),

            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Account Created")),
                  );

                  Text("Account Created");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurpleAccent,
                ),
                child: const Text(
                  'Create an account',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
