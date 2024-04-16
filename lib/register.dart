import 'package:flutter/material.dart';
import 'package:ui_login/constans.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 32, vertical: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Create Your Account",
                  style: textTextStyle.copyWith(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Fill in the details below to create an account.",
                  style: secondaryTextStyle.copyWith(fontSize: 14),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),

                // TextField untuk nama depan
                _buildTextField(
                  hint: "First Name",
                  icon: Icons.person,
                ),
                SizedBox(height: 10),

                // TextField untuk nama belakang
                _buildTextField(
                  hint: "Last Name",
                  icon: Icons.person_outline,
                ),
                SizedBox(height: 10),

                // Dropdown untuk jenis kelamin
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    hintText: "Gender",
                    prefixIcon: Icon(Icons.transgender),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  items: ["Male", "Female"]
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedGender = newValue;
                    });
                  },
                ),

                SizedBox(height: 10),

                // TextField untuk email
                _buildTextField(
                  hint: "Email",
                  icon: Icons.email,
                ),

                SizedBox(height: 10),

                // TextField untuk kata sandi
                _buildPasswordField(
                  hint: "Password",
                ),

                SizedBox(height: 10),

                // TextField untuk konfirmasi kata sandi
                _buildPasswordField(
                  hint: "Confirm Password",
                ),

                SizedBox(height: 31),

                // Tombol SIGN UP
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryButtonColor,
                    padding:
                        EdgeInsets.symmetric(vertical: 16, horizontal: 100),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    // Tambahkan logika pendaftaran di sini
                  },
                  child: Text(
                    "SIGN UP",
                    style: WhiteTextStyle.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                SizedBox(height: 2),
                // Tautan untuk login
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                  child: Text(
                    "Already have an account? Login",
                    style: secondaryTextStyle.copyWith(
                      fontSize: 14,
                      color: Color.fromARGB(255, 157, 35, 35),
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

  // Widget untuk membuat TextField dengan ikon
  Widget _buildTextField({required String hint, required IconData icon}) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 17,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  // Widget untuk membuat TextField untuk kata sandi dengan ikon
  Widget _buildPasswordField({required String hint}) {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(Icons.lock),
        suffixIcon: Icon(Icons.visibility_off),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 17,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
