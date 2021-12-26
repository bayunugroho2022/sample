// import 'package:flutter/material.dart';
//
// import 'package:get/get.dart';
//
// import '../controllers/doctor_controller.dart';
//
// class DoctorView extends GetView<DoctorController> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: Get.width,
//         height: Get.height,
//         child: Row(
//           children: [
//             Expanded(
//               flex: 3,
//               child: Column(
//                 children: [
//                   InkWell(
//                     onTap: (){
//                       controller.changePage(0);
//                     },
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text('dsadas'),
//                     ),
//                   ),
//                   InkWell(
//                     onTap: (){
//                       controller.changePage(1);
//                     },
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text('dsadas'),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//
//             Expanded(
//               flex: 7,
//               child: Obx(() => IndexedStack(
//                 index: controller.currentIndex.value,
//                 children: controller.pages,
//               )),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:bayu_flutter/app/modules/business/src/business_page.dart';
import 'package:bayu_flutter/app/modules/concertric/views/concertric_view.dart';
import 'package:bayu_flutter/app/modules/doctor/controllers/doctor_controller.dart';
import 'package:bayu_flutter/app/modules/shirt/views/shirt_view.dart';
import 'package:bayu_flutter/app/utils/state_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class DoctorView extends StatexWidget<DoctorController> {
  DoctorView() : super(() => DoctorController());

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller.pageController,
        children: [
          ConcertricView(),
          BusinessPage(),
        ],
      ),
      bottomNavigationBar: Obx(
            () => BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Business',
            ),
          ],
          currentIndex: controller.selectedTab$().index,
          selectedItemColor: Colors.blue,
          onTap: controller.toPage,
        ),
      ),
    );
  }

}



















