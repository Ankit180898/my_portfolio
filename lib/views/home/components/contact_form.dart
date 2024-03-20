// import 'dart:convert';

// import 'package:flutter/material.dart';

// class MyHomePage extends StatelessWidget {
//   MyHomePage({Key? key}) : super(key: key);

//   final _formKey = GlobalKey<FormState>();
//   final nameController = TextEditingController();
//   final emailController = TextEditingController();
//   final messageController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xfff5f5fd),
//       body: Center(
//         child: Container(
//           height: 450,
//           width: 400,
//           margin: const EdgeInsets.symmetric(
//             horizontal: 40,
//             vertical: 20,
//           ),
//           padding: const EdgeInsets.symmetric(
//             horizontal: 40,
//             vertical: 20,
//           ),
//           decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(10),
//               boxShadow: [
//                 BoxShadow(
//                     offset: const Offset(0, 5),
//                     blurRadius: 10,
//                     spreadRadius: 1,
//                     color: Colors.grey[300]!)
//               ]),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 const Text('Contact Us',
//                     style:
//                         TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//                 TextFormField(
//                   controller: nameController,
//                   decoration: const InputDecoration(hintText: 'Name'),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return '*Required';
//                     }
//                     return null;
//                   },
//                 ),
//                 TextFormField(
//                   controller: emailController,
//                   decoration: const InputDecoration(hintText: 'Email'),
//                   validator: (email) {
//                     if (email == null || email.isEmpty) {
//                       return 'Required*';
//                     } else if (!EmailValidator.validate(email)) {
//                       return 'Please enter a valid Email';
//                     }
//                     return null;
//                   },
//                 ),
//                 TextFormField(
//                   controller: messageController,
//                   decoration: const InputDecoration(hintText: 'Message'),
//                   maxLines: 5,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return '*Required';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(
//                   height: 45,
//                   width: 110,
//                   child: TextButton(
//                     style: TextButton.styleFrom(
//                         foregroundColor: Colors.white, backgroundColor: const Color(0xff151534),
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(40))),
//                     onPressed: () async {
//                       if (_formKey.currentState!.validate()) {
//                         final response = await sendEmail(
//                             nameController.value.text,
//                             emailController.value.text,
//                             messageController.value.text);
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           response == 200
//                               ? const SnackBar(
//                                   content: Text('Message Sent!'),
//                                   backgroundColor: Colors.green)
//                               : const SnackBar(
//                                   content: Text('Failed to send message!'),
//                                   backgroundColor: Colors.red),
//                         );
//                         nameController.clear();
//                         emailController.clear();
//                         messageController.clear();
//                       }
//                     },
//                     child: const Text('Send', style: TextStyle(fontSize: 16)),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// Future sendEmail(String name, String email, String message) async {
//   final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
//   final response = await http.post(url,
//       headers: {'Content-Type': 'application/json'},
//       body: json.encode({
//         'service_id': serviceId,
//         'template_id': templateId,
//         'user_id': userId,
//         'template_params': {
//           'from_name': name,
//           'from_email': email,
//           'message': message
//         }
//       }));
//   return response.statusCode;
// }