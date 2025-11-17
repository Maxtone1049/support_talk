import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../Common/Gap.dart';

class TransactionSkeleton extends StatelessWidget {
  const TransactionSkeleton({super.key, required this.count});
  final int count;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: count,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox();
      },
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 16.h),
          child: Row(
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey.shade200,
                highlightColor: Colors.grey.shade300,
                child: const CircleAvatar(),
              ),
              const Gap(width: 16),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Shimmer.fromColors(
                      baseColor: Colors.grey.shade200,
                      highlightColor: Colors.grey.shade300,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 7,
                        color: Colors.red,
                        padding: const EdgeInsets.all(23),
                      ),
                    ),
                    const Gap(height: 4),
                    Shimmer.fromColors(
                      baseColor: Colors.grey.shade200,
                      highlightColor: Colors.grey.shade300,
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: 5,
                        color: Colors.red,
                        padding: const EdgeInsets.all(23),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
