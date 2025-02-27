// import 'package:flutter/material.dart';

// class ConfirmButton extends StatefulWidget {
//   final bool isEnabled;
//   const ConfirmButton({
//     super.key,
//     required this.isEnabled,
//     required void Function() onPressed,
//   });

//   @override
//   State<ConfirmButton> createState() => _ConfirmButtonState();
// }

// class _ConfirmButtonState extends State<ConfirmButton> {
//   bool isLoading = false;

//   void _onPressed() async {
//     if (!widget.isEnabled || isLoading) return;

//     setState(() {
//       isLoading = true;
//     });

//     // ❇️ محاكاة عملية تسجيل الدخول لمدة ثانيتين
//     await Future.delayed(const Duration(seconds: 2));

//     setState(() {
//       isLoading = false;
//     });

//     // ✅ عرض كارد رسالة النجاح في منتصف الشاشة
//     showDialog(
//       context: context,
//       barrierDismissible: false, // لا يمكن إغلاقه بالنقر خارجه
//       builder: (context) {
//         return AlertDialog(
//           contentPadding: const EdgeInsets.symmetric(
//             vertical: 32,
//             horizontal: 10,
//           ),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(12),
//           ),
//           content: SizedBox(
//             width: 340,
//             height: 98,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Icon(
//                   Icons.check_circle,
//                   color: Color(0xFF1B7754),
//                   size: 50,
//                 ),
//                 const SizedBox(height: 20),
//                 const Text(
//                   "  تسجيل الدخول   ",
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 382, // العرض المطلوب
//       height: 58, // الارتفاع المطلوب
//       child: ElevatedButton(
//         onPressed: widget.isEnabled ? _onPressed : null,
//         style: ElevatedButton.styleFrom(
//           backgroundColor:
//               widget.isEnabled ? const Color(0xFF1B7754) : Colors.grey.shade300,
//           foregroundColor: Colors.white,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(40),
//           ), // الزوايا الدائرية
//           padding: const EdgeInsets.all(16),
//         ),
//         child:
//             isLoading
//                 ? const SizedBox(
//                   width: 24,
//                   height: 24,
//                   child: CircularProgressIndicator(
//                     valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
//                     strokeWidth: 3,
//                   ),
//                 )
//                 : const Text("تأكيد", style: TextStyle(fontSize: 18)),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:rayhan/utils/app_colors.dart';

class ConfirmButton extends StatelessWidget {
  final bool isEnabled;
  final VoidCallback onPressed;
  final String? text;

  const ConfirmButton({
    super.key,
    required this.isEnabled,
    required this.onPressed,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 382,
      height: 58,
      child: ElevatedButton(
        onPressed: isEnabled ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: isEnabled ? AppColors.primary : Colors.grey.shade300,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          padding: const EdgeInsets.all(16),
        ),
        child: Text(text ?? "تأكيد", style: const TextStyle(fontSize: 18)),
      ),
    );
  }
}
