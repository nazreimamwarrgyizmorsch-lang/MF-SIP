import 'package:flutter/material.dart';
import 'package:my_sip/common/widget/appbar/custom_appbar_normal.dart';
import 'package:my_sip/common/widget/appbar/widget/compact_icon.dart';
import 'package:my_sip/common/widget/button/elevated_button.dart';
import 'package:my_sip/common/widget/text/heading_section.dart';
import 'package:my_sip/common/widget/text/view_all.dart';
import 'package:my_sip/features/dashboard/screen/comparison_screen.dart';
import 'package:my_sip/features/mf/screen/dashboard/dashboard.dart';
import 'package:my_sip/utils/constant/colors.dart';
import 'package:my_sip/utils/constant/images.dart';
import 'package:my_sip/utils/constant/text_style.dart';
import 'package:readmore/readmore.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class FundDeatailsScreen extends StatefulWidget {
  const FundDeatailsScreen({super.key});

  @override
  State<FundDeatailsScreen> createState() => _FundDeatailsScreenState();
}

class _FundDeatailsScreenState extends State<FundDeatailsScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    // Using TabController is better for syncing with SliverPersistentHeader
    _tabController = TabController(length: 5, vsync: this);
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        setState(() {}); // Rebuild to update the active tab UI in the header
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            //AppBar
            SliverAppBar(
              pinned: true,
              flexibleSpace: CustomAppBarNormal(
                // backIcon: false,
                backgroundColor: Ucolors.light,
                actionsPadding: 10,
                title: 'Fund Details',
                action: [
                  CompactIcon(icon: Icons.bookmark_border, onPressed: () {}),
                  CompactIcon(
                    icon: Icons.shopping_cart_outlined,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 20)),

            ///
            SliverPadding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
              sliver: SliverToBoxAdapter(
                child: Column(
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(12),
                          child: Container(
                            constraints: BoxConstraints(
                              maxHeight: 40,
                              maxWidth: 40,
                            ),
                            child: Image.asset(
                              UImages.motilal,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            'Nippon India Large Cap Fund- Growth Plan- Growth Option',
                            style: Theme.of(context).textTheme.bodyLarge!
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      // alignment: WrapAlignment.spaceEvenly,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      // runSpacing: 4,
                      children: [
                        _metaText('Equity'),
                        _dot(),
                        _metaText('Large cap'),
                        _dot(),
                        _metaText('Very High', color: Ucolors.red),
                        _dot(),
                        _metaText('Status:'),

                        _metaText(
                          'Open',
                          color: Ucolors.success,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 10)),

            SliverPersistentHeader(
              pinned: true,
              // floating: false,
              delegate: SliverPageTabs(
                selectedIndex: _tabController.index,
                onTap: (index) {
                  _tabController.animateTo(index);
                  setState(() {});
                },
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            OverviewScreen(), // Ensure this uses a ListView or CustomScrollView
            Center(child: Text('Returns Page')),
            Center(child: Text('Risk Page')),
            Center(child: Text('Portfolio Page')),
            Center(child: Text('Info Page')),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        child: BottomBarButton(
          firstButton: 'Lumpsum',
          secondButton: 'Start SIP',
        ),
      ),
    );
  }
}

class OverviewScreen extends StatelessWidget {
  const OverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 10),
      // This is crucial: it allows the NestedScrollView to coordinate scrolling
      physics: const ClampingScrollPhysics(),
      children: [
        // --- Fund Overview Section ---
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 10),
          child: const USectionHeading(
            title: 'Fund Overview',
            showActionButton: false,
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Ucolors.light,
              border: Border.all(color: Ucolors.borderColor),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _twoColumnRow(
                  leftTitle: 'Min SIP',
                  leftValue: '₹ 5,000',
                  rightTitle: 'Min lumpsum',
                  rightValue: '₹ 500',
                ),
                const SizedBox(height: 10),
                _twoColumnRow(
                  leftTitle: 'Expense Ratio',
                  leftValue: '1.52%',
                  rightTitle: 'AUM',
                  rightValue: '₹ 50,312 Cr',
                ),
                const SizedBox(height: 10),
                _twoColumnRow(
                  leftTitle: 'Lock In',
                  leftValue: 'No Lock-in',
                  rightTitle: 'Launch Date',
                  rightValue: '2007-08-08',
                ),
                const SizedBox(height: 10),
                const Text(
                  'Exit Load:',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                ReadMoreText(
                  'Nippon India Large Cap Fund – Growth charges 1.0% of sell value; if fund sold before 7 days. There are no other charges.',
                  trimMode: TrimMode.Line,
                  trimLines: 1,
                  trimCollapsedText: 'Show More',
                  trimExpandedText: 'Show Less',
                  colorClickableText: Ucolors.primary,
                ),
              ],
            ),
          ),
        ),

        // --- Risk Analysis Section ---
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 10),
          child: const USectionHeading(
            title: 'Risk Analysis',
            showActionButton: false,
          ),
        ),

        CustomContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SpeedometerGauge(value: 85), // Updated to show high risk
              Text(
                'Your Principle Will be at:',
                style: Theme.of(
                  context,
                ).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 3),
              Text(
                'Very High Risk',
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Ucolors.red,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                'Suitable for aggressive investors and investors with very high-risk tolerance.',
                textAlign: TextAlign.center,
                style: UTextStyles.small.copyWith(color: Ucolors.darkgrey),
              ),
              const SizedBox(height: 5),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 15),
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: Ucolors.primary.withOpacity(0.5)),
            ),
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'View full Risk Analysis',
                  style: UTextStyles.buttonText.copyWith(
                    color: Ucolors.primary.withOpacity(0.5),
                  ),
                ),
                SizedBox(width: 10),
                Icon(
                  Icons.arrow_forward,
                  color: Ucolors.primary.withOpacity(0.5),
                ),
              ],
            ),
          ),
        ),
        // --- Fund Comparison Section ---
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 10),
          child: const USectionHeading(
            title: 'Fund Comparison',
            showActionButton: false,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.24,
          child: ListView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,

            itemBuilder: (context, index) => SizedBox(
              width: MediaQuery.of(context).size.width * 0.97,
              child: CustomContainer(
                topPadding: 15,
                child: Column(
                  children: [
                    FundComparisonItem(),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        // Left dashed line
                        Expanded(
                          child: DashedLine(color: Colors.blue.shade200),
                        ),

                        // VS circlef
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.blue, width: 1.5),
                          ),
                          child: const Text(
                            'VS',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),

                        // Right dashed line
                        Expanded(
                          child: DashedLine(color: Colors.blue.shade200),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),

                    FundComparisonItem(),
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 15),
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: Ucolors.primary.withOpacity(0.5)),
            ),
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Compare Funds',
                  style: UTextStyles.buttonText.copyWith(
                    color: Ucolors.primary.withOpacity(0.5),
                  ),
                ),
                SizedBox(width: 10),
                Icon(
                  Icons.arrow_forward,
                  color: Ucolors.primary.withOpacity(0.5),
                ),
              ],
            ),
          ),
        ),

        // --- Related Funds Section ---
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 10),
          child: const USectionHeading(
            title: 'Related Funds',
            showActionButton: false,
          ),
        ),

        // Add your Related Funds list here
        SizedBox(
          height: 140,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            separatorBuilder: (context, index) => SizedBox(width: 0),
            itemBuilder: (context, index) => SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,

              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    /// 🔹 Top Row (Icon + Title + Menu)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // / Fund Icon
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.shade100,
                          ),
                          child: ClipOval(
                            child: Image.asset(UImages.sbi, fit: BoxFit.cover),
                          ),
                        ),

                        // CircleAvatar(backgroundImage: AssetImage(UImages.sbi)),
                        const SizedBox(width: 12),

                        /// Title + Subtitle
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Nippon India Large Cap Fund- Growth Plan- Growth Option',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  height: 1.3,
                                ),
                              ),
                            ],
                          ),
                        ),

                        /// Menu
                        // const Icon(Icons.more_vert, color: Colors.grey),
                      ],
                    ),

                    const SizedBox(height: 10),

                    /// 🔹 Bottom Stats
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        StatItem1(
                          title: '2Y Returns',
                          amount: '63%',
                          percentage: '',
                          amountColor: Colors.green.shade800,

                          percentageColor: Ucolors.success,
                        ),
                        StatItem1(
                          percentage: '',
                          title: '3Y Returns',
                          amount: '43%',
                          amountColor: Colors.green.shade800,
                          percentageColor: Ucolors.success,
                        ),

                        StatItem1(
                          percentage: '',
                          title: '4Y Returns',
                          amountColor: Colors.green.shade800,

                          percentageColor: Ucolors.success,

                          amount: '35%',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 10),
          child: const USectionHeading(
            title: 'About this Fund',
            showActionButton: false,
          ),
        ),
        CustomContainer(
          topPadding: 15,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ReadMoreText(
                style: UTextStyles.medium,
                'Quant Small Cap Fund - Direct Plan - Growth is a Small Cap scheme. The fund is currently managed by Jeetu Vechha. This content is a placeholder — you can replace it with your API description.',
                trimMode: TrimMode.Line,
                trimLines: 2,
                trimCollapsedText: 'Show More',
                trimExpandedText: 'Show Less',
                colorClickableText: Ucolors.primary,
              ),
              SizedBox(height: 5),
              Text(
                'Fund Manager',
                style: UTextStyles.large.copyWith(fontWeight: FontWeight.w600),
              ),
              fundManager('Pratik 1'),
              DashedLine(color: Colors.grey.shade300),
              fundManager('Pratik 2'),
            ],
          ),
        ),

        // Padding(
        //   padding: const EdgeInsets.fromLTRB(16, 20, 16, 10),
        //   child: const USectionHeading(
        //     title: 'Investment Details',
        //     showActionButton: false,
        //   ),
        // ),

        ///Investment Details
        ExpansionTile(
          shape: Border(),
          collapsedShape: Border(),
          // dense: true,
          title: Text('Invesment Details'),
          children: [
            CustomContainer(
              bottomPadding: 0,
              child: Column(
                children: [
                  investmentDetailSection(
                    'Fund Size',
                    '₹ 5,000',
                    Icons.bar_chart,
                  ),
                  Divider(height: 0),
                  investmentDetailSection(
                    'Min Investement',
                    '₹ 5,00',
                    Icons.circle,
                  ),

                  Divider(height: 0),
                  investmentDetailSection(
                    'Turn over',
                    '23',
                    Icons.lightbulb_circle_rounded,
                  ),
                  Divider(height: 0),
                  investmentDetailSection(
                    'Expense Ratio',
                    '1.54',
                    Icons.pie_chart,
                  ),
                  Divider(height: 0),
                  investmentDetailSection(
                    'Exit Load',
                    '',
                    Icons.logout_outlined,
                  ),
                ],
              ),
            ),
          ],
        ),

        ///Basic Details
        ExpansionTile(
          shape: Border(),
          collapsedShape: Border(),
          // dense: true,
          title: Text('Basic Details'),
          children: [
            CustomContainer(
              bottomPadding: 0,
              child: Column(
                children: [
                  investmentDetailSection(
                    'Category',
                    'Large Cap',
                    Icons.bar_chart,
                  ),
                  Divider(height: 0),
                  investmentDetailSection('KRA', 'KARVY', Icons.circle),

                  Divider(height: 0),
                  investmentDetailSection(
                    'Inv. Plan',
                    'Growth',
                    Icons.lightbulb_circle_rounded,
                  ),
                  Divider(height: 0),
                  investmentDetailSection(
                    'Launched IN',
                    '2007-08-08',
                    Icons.pie_chart,
                  ),
                  Divider(height: 0),
                  investmentDetailSection(
                    'Bench Mark',
                    'BSE 100',
                    Icons.logout_outlined,
                  ),
                ],
              ),
            ),
          ],
        ),

        //AMC Information
        ExpansionTile(
          shape: Border(),
          collapsedShape: Border(),
          // dense: true,
          title: Text('AMC Inforamtion'),
          children: [
            CustomContainer(
              bottomPadding: 0,
              child: Column(
                children: [
                  investmentDetailSection(
                    'AMC',
                    'Nippon India MF',
                    Icons.bar_chart,
                  ),
                  Divider(height: 0),
                  investmentDetailSection(
                    'Email',
                    'abc.warrgyizmorch@gmail.com',
                    Icons.circle,
                  ),

                  Divider(height: 0),
                  investmentDetailSection(
                    'Office No',
                    '1876471871',
                    Icons.lightbulb_circle_rounded,
                  ),
                  Divider(height: 0),
                  investmentDetailSection(
                    'Website',
                    'http://www.google.com',
                    Icons.pie_chart,
                  ),
                  Divider(height: 0),
                  investmentDetailSection('Address', '', Icons.logout_outlined),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget investmentDetailSection(String title, String value, IconData icon) {
    return ListTile(
      contentPadding: EdgeInsets.zero,

      dense: true,
      isThreeLine: false,
      title: Row(
        children: [
          Icon(icon, color: Ucolors.blue),
          SizedBox(width: 5),
          Text(title),
        ],
      ),
      trailing: Text(value),
    );
  }

  Widget fundManager(String name) {
    return ListTile(
      leading: CircleAvatar(
        radius: 15,
        backgroundColor: Ucolors.darkgrey.withOpacity(0.2),
        child: Icon(Icons.person, color: Ucolors.dark),
      ),
      title: Text(
        name,
        style: UTextStyles.medium.copyWith(
          fontWeight: FontWeight.w600,
          color: Ucolors.dark,
        ),
      ),
      trailing: CompactIcon(
        icon: Icons.arrow_forward_ios_rounded,
        iconColor: Ucolors.darkgrey,
        iconSize: 15,

        onPressed: () {},
      ),
    );
  }
}

class DashedLine extends StatelessWidget {
  const DashedLine({
    super.key,
    this.color = Colors.blue,
    this.height = 1,
    this.dashWidth = 6,
    this.dashSpace = 4,
  });

  final Color color;
  final double height;
  final double dashWidth;
  final double dashSpace;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final dashCount = (constraints.maxWidth / (dashWidth + dashSpace))
            .floor();

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: height,
              child: DecoratedBox(decoration: BoxDecoration(color: color)),
            );
          }),
        );
      },
    );
  }
}

class FundComparisonItem extends StatelessWidget {
  const FundComparisonItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // / Fund Icon
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.shade100,
              ),
              child: ClipOval(
                child: Image.asset(UImages.sbi, fit: BoxFit.cover),
              ),
            ),

            // CircleAvatar(backgroundImage: AssetImage(UImages.sbi)),
            const SizedBox(width: 12),

            /// Title + Subtitle
            Flexible(
              child: const Text(
                softWrap: true,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,

                'Nippon India Large Cap Fund- Growth Plan- Growth Option',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  height: 1.3,
                ),
              ),
            ),

            /// Menu
            // const Icon(Icons.more_vert, color: Colors.grey),
          ],
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: '3Y Return :',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: Ucolors.darkgrey,
                ),
              ),
              const TextSpan(text: '  '),
              TextSpan(
                text: '19.18%',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: Ucolors.success,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// class OverviewScreen extends StatelessWidget {
//   const OverviewScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return CustomScrollView(
//       slivers: [
//         // Top section
//         SliverToBoxAdapter(
//           child: Padding(
//             padding: const EdgeInsets.fromLTRB(16, 20, 16, 10),
//             child: const USectionHeading(
//               title: 'Fund Overview',
//               showActionButton: false,
//               // buttonTitle: 'See all',
//             ),
//           ),
//         ),
//         SliverToBoxAdapter(
//           child: Padding(
//             padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
//             child: Container(
//               padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
//               decoration: BoxDecoration(
//                 color: Ucolors.light,
//                 border: Border.all(color: Ucolors.borderColor),
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   _twoColumnRow(
//                     leftTitle: 'Min SIp',
//                     leftValue: '₹ 5,000',
//                     rightTitle: 'Min lumpsum',
//                     rightValue: '₹ 5,00',
//                   ),
//                   const SizedBox(height: 10),
//                   _twoColumnRow(
//                     leftTitle: 'Expense Ratio',
//                     leftValue: '1.52%',
//                     rightTitle: 'AUM',
//                     rightValue: '₹ 5,00',
//                   ),
//                   const SizedBox(height: 10),

//                   _twoColumnRow(
//                     leftTitle: 'Lock In ',
//                     leftValue: 'NO Lock-in',
//                     rightTitle: 'Launch Date',
//                     rightValue: '2002-02-02',
//                   ),
//                   SizedBox(height: 10),
//                   const Text(
//                     'Exit Load:',
//                     style: TextStyle(fontSize: 12, color: Colors.grey),
//                   ),

//                   ReadMoreText(
//                     'Nippon India Large Cap Fund – Growth charges 1.0% '
//                     'of sell value; if fund sold before 7 days. '
//                     'There are no other charges. ',
//                     trimMode: TrimMode.Line,
//                     trimLines: 1,
//                     trimCollapsedText: 'Show More',
//                     trimExpandedText: 'Show Less',
//                     colorClickableText: Ucolors.primary,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         SliverToBoxAdapter(
//           child: Padding(
//             padding: const EdgeInsets.fromLTRB(16, 20, 16, 10),
//             child: const USectionHeading(
//               title: 'Risk Analysis',
//               showActionButton: false,
//               // buttonTitle: 'See all',
//             ),
//           ),
//         ),
//         SliverToBoxAdapter(
//           child: CustomContainer(
//             child: Column(
//               // mainAxisAlignment: MainAxisAlignment.start,
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 SpeedometerGauge(value: 50),
//                 Text(
//                   'Your Principle Will be at:',
//                   style: Theme.of(
//                     context,
//                   ).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 3),
//                 Text(
//                   'Very High Risk',
//                   style: Theme.of(context).textTheme.labelLarge!.copyWith(
//                     fontWeight: FontWeight.bold,
//                     color: Ucolors.red,
//                   ),
//                 ),
//                 const SizedBox(height: 3),

//                 Text(
//                   textAlign: TextAlign.center,
//                   'Suitable for balanced investments and investors with medium risk tolerance.',
//                   style: UTextStyles.small.copyWith(color: Ucolors.darkgrey),
//                 ),
//                 const SizedBox(height: 5),
//               ],
//             ),
//           ),
//         ),

//         SliverToBoxAdapter(
//           child: Padding(
//             padding: const EdgeInsets.fromLTRB(16, 20, 16, 10),
//             child: const USectionHeading(
//               title: 'Fund Comparison',
//               showActionButton: false,
//               // buttonTitle: 'See all',
//             ),
//           ),
//         ),
//         SliverToBoxAdapter(
//           child: Padding(
//             padding: const EdgeInsets.fromLTRB(16, 20, 16, 10),
//             child: const USectionHeading(
//               title: 'Related Funds',
//               showActionButton: false,
//               // buttonTitle: 'See all',
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

class SpeedometerGauge extends StatelessWidget {
  final double value; // 0–100

  const SpeedometerGauge({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,

      child: SfRadialGauge(
        axes: [
          RadialAxis(
            radiusFactor: 1,
            centerY: 0.8,

            // centerX: 0,
            minimum: 0,
            maximum: 100,
            startAngle: 180,
            endAngle: 0,
            showTicks: false,
            showLabels: false,
            axisLineStyle: const AxisLineStyle(
              thickness: 0.15,
              thicknessUnit: GaugeSizeUnit.factor,
              color: Colors.transparent,
            ),

            // COLOR SEGMENTS
            ranges: [
              GaugeRange(
                startValue: 0,
                endValue: 20,
                color: Colors.green,
                startWidth: 15,
                endWidth: 15,
              ),
              GaugeRange(
                startValue: 20,
                endValue: 40,
                color: Colors.lightGreen,
                startWidth: 15,
                endWidth: 15,
              ),
              GaugeRange(
                startValue: 40,
                endValue: 60,
                color: Colors.yellow,
                startWidth: 15,
                endWidth: 15,
              ),
              GaugeRange(
                startValue: 60,
                endValue: 80,
                color: Colors.orange,
                startWidth: 15,
                endWidth: 15,
              ),
              GaugeRange(
                startValue: 80,
                endValue: 100,
                color: Colors.red,
                startWidth: 15,
                endWidth: 15,
              ),
            ],

            // NEEDLE
            pointers: [
              NeedlePointer(
                value: value,
                needleLength: 0.6,
                needleStartWidth: 1,
                needleEndWidth: 4,
                needleColor: Colors.black,
                knobStyle: const KnobStyle(
                  color: Colors.black,
                  knobRadius: 0.06,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.child,
    this.topPadding = 4,
    this.bottomPadding = 15,
  });

  final Widget child;
  final double topPadding;
  final double bottomPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
      child: Container(
        padding: EdgeInsets.fromLTRB(15, topPadding, 15, bottomPadding),
        decoration: BoxDecoration(
          color: Ucolors.light,
          border: Border.all(color: Ucolors.borderColor),
          borderRadius: BorderRadius.circular(12),
        ),
        child: child,
      ),
    );
  }
}

Widget _twoColumnRow({
  required String leftTitle,
  required String leftValue,
  required String rightTitle,
  required String rightValue,
}) {
  return Row(
    children: [
      Expanded(child: _infoItem(leftTitle, leftValue)),
      Expanded(child: _infoItem(rightTitle, rightValue)),
    ],
  );
}

Widget _infoItem(String title, String value) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title, style: TextStyle(fontSize: 12, color: Ucolors.darkgrey)),
      const SizedBox(height: 4),
      Text(
        value,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
      ),
    ],
  );
}

class SliverPageTabs extends SliverPersistentHeaderDelegate {
  final int selectedIndex;
  final ValueChanged<int> onTap;
  static final ScrollController _scrollController = ScrollController();

  SliverPageTabs({required this.selectedIndex, required this.onTap});

  final tabs = const [
    'Overview',
    'Returns',
    'Risk',
    'Portfolio',
    'Information',
  ];
  // Logic to move the horizontal list automatically
  void _scrollToActiveTab() {
    if (_scrollController.hasClients) {
      // 100.0 is an estimated width per tab item
      double offset = selectedIndex * 90.0;
      double target = offset.clamp(
        0.0,
        _scrollController.position.maxScrollExtent,
      );

      _scrollController.animateTo(
        target,
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToActiveTab());
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(25),
      ),
      margin: EdgeInsets.symmetric(horizontal: 10),
      // padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListView.separated(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemCount: tabs.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final isSelected = index == selectedIndex;

          return GestureDetector(
            onTap: () => onTap(index),
            child: Center(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 0),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                  // border: Border.all(
                  //   color: isSelected ? Colors.white : Colors.grey.shade300,
                  // ),
                ),
                child: Text(
                  tabs[index],
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                    color: isSelected ? Ucolors.primary : Colors.grey.shade700,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  double get maxExtent => 50;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(covariant SliverPageTabs oldDelegate) {
    return oldDelegate.selectedIndex != selectedIndex;
  }
}

Widget _dot() {
  return const Text('•', style: TextStyle(fontSize: 12, color: Colors.grey));
}

Widget _metaText(
  String text, {
  Color color = Colors.grey,
  FontWeight fontWeight = FontWeight.normal,
}) {
  return Text(
    text,
    style: TextStyle(fontSize: 12, color: color, fontWeight: fontWeight),
  );
}

// import 'package:flutter/material.dart';

// class NipponFundDetailScreen extends StatelessWidget {
//   const NipponFundDetailScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: DefaultTabController(
//         length: 5,
//         child: NestedScrollView(
//           headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
//             return <Widget>[
//               // This is the part that scrolls away
//               SliverAppBar(
//                 expandedHeight: 220.0, // Height of the top details
//                 pinned: true, // Keeps the TabBar at the top
//                 floating: false,
//                 backgroundColor: Colors.white,
//                 elevation: 0,
//                 leading: const Icon(Icons.arrow_back, color: Colors.black),
//                 flexibleSpace: FlexibleSpaceBar(
//                   collapseMode: CollapseMode.pin,
//                   background: Padding(
//                     padding: const EdgeInsets.only(
//                       top: 80,
//                       left: 16,
//                       right: 16,
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text(
//                           "Nippon India Large Cap Fund- Growth Plan",
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const SizedBox(height: 10),
//                         _buildMiniStats(), // Helper for NAV and Returns
//                       ],
//                     ),
//                   ),
//                 ),
//                 // This is the pinned TabBar
//                 bottom: PreferredSize(
//                   preferredSize: const Size.fromHeight(48),
//                   child: Container(
//                     color: Colors.white,
//                     child: const TabBar(
//                       isScrollable: true,
//                       indicatorColor: Colors.red,
//                       labelColor: Colors.black,
//                       unselectedLabelColor: Colors.grey,
//                       tabs: [
//                         Tab(text: "Overview"),
//                         Tab(text: "Returns"),
//                         Tab(text: "Risk"),
//                         Tab(text: "Portfolio"),
//                         Tab(text: "Information"),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ];
//           },
//           // This is the scrollable/swipeable content below the TabBar
//           body: const TabBarView(
//             children: [
//               OverviewContent(), // Your main content list
//               Center(child: Text("Returns Content")),
//               Center(child: Text("Risk Content")),
//               Center(child: Text("Portfolio Content")),
//               Center(child: Text("Info Content")),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildMiniStats() {
//     return const Row(
//       children: [
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("NAV", style: TextStyle(color: Colors.grey, fontSize: 12)),
//             Text("₹93", style: TextStyle(fontWeight: FontWeight.bold)),
//           ],
//         ),
//         SizedBox(width: 40),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "Returns (1Y)",
//               style: TextStyle(color: Colors.grey, fontSize: 12),
//             ),
//             Text(
//               "8.38%",
//               style: TextStyle(
//                 color: Colors.green,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }

// // Ensure the content inside TabBarView is also scrollable
// class OverviewContent extends StatelessWidget {
//   const OverviewContent({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       padding: const EdgeInsets.all(16),
//       itemCount: 20,
//       itemBuilder: (context, index) =>
//           Card(child: ListTile(title: Text("Fund Data Point $index"))),
//     );
//   }
// }

// class SliverPageTabs extends SliverPersistentHeaderDelegate {
//   final int selectedIndex;
//   final ValueChanged<int> onTap;

//   SliverPageTabs({required this.selectedIndex, required this.onTap});

//   @override
//   Widget build(
//     BuildContext context,
//     double shrinkOffset,
//     bool overlapsContent,
//   ) {
//     // Add a Container with solid color so content doesn't bleed behind the tabs
//     return Container(
//       color: Colors.grey[50],
//       alignment: Alignment.center,
//       child: Container(
//         height: 45,
//         margin: const EdgeInsets.symmetric(horizontal: 16),
//         decoration: BoxDecoration(
//           color: Colors.grey[200],
//           borderRadius: BorderRadius.circular(25),
//         ),
//         child: ListView.separated(
//           scrollDirection: Axis.horizontal,
//           padding: const EdgeInsets.symmetric(horizontal: 10),
//           itemCount: 5,
//           separatorBuilder: (_, __) => const SizedBox(width: 8),
//           itemBuilder: (context, index) {
//             final tabs = ['Overview', 'Returns', 'Risk', 'Portfolio', 'Info'];
//             final isSelected = index == selectedIndex;
//             return GestureDetector(
//               onTap: () => onTap(index),
//               child: Center(
//                 child: AnimatedContainer(
//                   duration: const Duration(milliseconds: 200),
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 20,
//                     vertical: 8,
//                   ),
//                   decoration: BoxDecoration(
//                     color: isSelected ? Colors.white : Colors.transparent,
//                     borderRadius: BorderRadius.circular(20),
//                     boxShadow: isSelected
//                         ? [BoxShadow(color: Colors.black12, blurRadius: 4)]
//                         : [],
//                   ),
//                   child: Text(
//                     tabs[index],
//                     style: TextStyle(
//                       color: isSelected ? Colors.blue : Colors.grey[700],
//                       fontWeight: isSelected
//                           ? FontWeight.bold
//                           : FontWeight.normal,
//                     ),
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }

//   @override
//   double get maxExtent => 60;
//   @override
//   double get minExtent => 60;
//   @override
//   bool shouldRebuild(covariant SliverPageTabs oldDelegate) => true;
// }
