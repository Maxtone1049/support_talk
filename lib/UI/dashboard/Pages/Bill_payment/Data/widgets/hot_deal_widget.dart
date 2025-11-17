import 'package:flutter/material.dart';
import 'package:wepay/Models/Mobile%20Data/mobile_data_model.dart';
import 'package:wepay/custom/app_colors.dart';
import 'package:wepay/custom/responsive_text.dart';

class HotDealsWidget extends StatelessWidget {
  final List<DataPlan> dataPlans;
  final Function(DataPlan) onPlanSelected;

  const HotDealsWidget({
    super.key,
    required this.dataPlans,
    required this.onPlanSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 16.0, bottom: 8.0),
          child: Text(
            'HOT',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 160,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: dataPlans.length,
            itemBuilder: (context, index) {
              final plan = dataPlans[index];
              final parsed = plan.parseValidity();
              return GestureDetector(
                onTap: () => onPlanSelected(plan),
                child: _buildDealCard(
                  parsed['data'] ?? '',
                  parsed['price'] ?? '',
                  parsed['duration'] ?? '',
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildDealCard(String data, String price, String duration) {
    return Container(
      width: 120,
      height: 115,
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: kcDarkGreenColor,
        borderRadius: BorderRadius.circular(12.0),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey.withOpacity(0.2),
        //     spreadRadius: 1,
        //     blurRadius: 5,
        //     offset: const Offset(0, 2),
        //   ),
        // ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ResponsiveText.w600(data),
          const SizedBox(height: 8),
          ResponsiveText(duration, fontSize: 12, color: Colors.grey),
          const SizedBox(height: 8),
          ResponsiveText(
            '₦$price',
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: kcVeryLightGrey,
          ),
        ],
      ),
    );
  }
}
// class HotDealsWidget extends StatelessWidget {
//   final List<DataPlan> dataPlans;

//   const HotDealsWidget({super.key, required this.dataPlans, required Null Function(dynamic plan) onPlanSelected});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Padding(
//           padding: EdgeInsets.only(left: 16.0, bottom: 8.0),
//           child: Text(
//             'HOT DEALS',
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//         ),
//         SizedBox(
//           height: 160,
//           child: ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: dataPlans.length,
//             itemBuilder: (context, index) {
//               final plan = dataPlans[index];
//               final parsed = plan.parseValidity();
//               return _buildDealCard(
//                 parsed['data'] ?? '',
//                 parsed['price'] ?? '',
//                 parsed['duration'] ?? '',
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildDealCard(String data, String price, String duration) {
//     return Container(
//       width: 120,
//       height: 115,
//       margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
//       padding: const EdgeInsets.all(12.0),
//       decoration: BoxDecoration(
//         color: kcDarkGreenColor,
//         borderRadius: BorderRadius.circular(12.0),
//         // boxShadow: [
//         //   BoxShadow(
//         //     color: Colors.grey.withOpacity(0.2),
//         //     spreadRadius: 1,
//         //     blurRadius: 5,
//         //     offset: const Offset(0, 2),
//         //   ),
//         // ],
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           ResponsiveText.w600(data),
//           const SizedBox(height: 8),
//           ResponsiveText(duration, fontSize: 12, color: Colors.grey),
//           const SizedBox(height: 8),
//           ResponsiveText(
//             '₦$price',
//             fontSize: 12,
//             fontWeight: FontWeight.bold,
//             color: kcVeryLightGrey,
//           ),
//         ],
//       ),
//     );
//   }
// }
