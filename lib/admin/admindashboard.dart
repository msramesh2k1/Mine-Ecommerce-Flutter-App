// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';

// class Dashboard extends StatefulWidget {
//   const Dashboard({Key? key}) : super(key: key);

//   @override
//   State<Dashboard> createState() => _DashboardState();
// }

// class _DashboardState extends State<Dashboard> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: MediaQuery.of(context).size.width,
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child:Column(
//             children: [
//               SizedBox(height: 20,),
             
//               Container(
//                 height: 40,
//                 width: 200,
//                 child: Padding(
//                   padding: const EdgeInsets.only(top:8.0,bottom: 8),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Image.network("https://cdn-icons-png.flaticon.com/128/1077/1077012.png"),
//                         Image.network("https://cdn-icons-png.flaticon.com/128/679/679922.png"),
//                          Image.network("https://cdn-icons-png.flaticon.com/128/7887/7887095.png")

              

                  
//                     ],
//                   ),
//                 ),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(40)
//                 ),
//               ),
//               SizedBox(height: 30,),
//               Container(
//                 height: 430,
         
//                 decoration: BoxDecoration(
//                          color: Colors.white,
//                   borderRadius: BorderRadius.circular(40)
//                 ),
//                 width: MediaQuery.of(context).size.width -100,
//               )
//             ],
//           ),
//         ),
//         decoration: BoxDecoration(
//            image: DecorationImage(
//                     image: NetworkImage(
//                       // "https://images.pexels.com/photos/3255761/pexels-photo-3255761.jpeg?auto=compress&cs=tinysrgb&w=600",
//                       "https://images.pexels.com/photos/6985259/pexels-photo-6985259.jpeg"
//                     ),
//                     fit: BoxFit.cover)),
        
//       ),
//     );
    
//   }
// }