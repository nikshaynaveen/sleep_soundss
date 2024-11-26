// // ignore_for_file: avoid_print

// import 'package:flutter/material.dart';
// import 'package:sleep_sounds/screens/discover/pack_detail.dart';

// class AllSongsGrid extends StatelessWidget {
//   final String selectedCategory;
//   final List<Map<String, dynamic>> _musicItems = [
//     {
//       'title': 'For Kids',
//       'subtitle': '7 Songs • Instrumental',
//       'image': 'assets/images/guitar_camp.png',
//       'category': 'For Kids',
//       'description':
//           'Relax with mellow guitar melodies perfect for campfire nights and peaceful escapes. Pure instrumental warmth for any moment.',
//       'songs': [
//         {'title': 'Song 1', 'artist': 'Artist A'},
//         {'title': 'Song 2', 'artist': 'Artist B'},
//       ]
//     },
//     {
//       'title': 'For Kids',
//       'subtitle': '7 Songs • Instrumental',
//       'image': 'assets/images/guitar_camp.png',
//       'category': 'For Kids',
//       'description':
//           'Relax with mellow guitar melodies perfect for campfire nights and peaceful escapes. Pure instrumental warmth for any moment.',
//       'songs': [
//         {'title': 'Song 1', 'artist': 'Artist A'},
//         {'title': 'Song 2', 'artist': 'Artist B'},
//       ]
//     },
//     {
//       'title': 'Ambient',
//       'subtitle': '7 Songs • Instrumental',
//       'image': 'assets/images/guitar_camp.png',
//       'category': 'Ambient',
//       'description':
//           'Relax with mellow guitar melodies perfect for campfire nights and peaceful escapes. Pure instrumental warmth for any moment.',
//       'songs': [
//         {'title': 'Song 1', 'artist': 'Artist A'},
//         {'title': 'Song 2', 'artist': 'Artist B'},
//       ]
//     },
//     {
//       'title': 'Ambient',
//       'subtitle': '7 Songs • Instrumental',
//       'image': 'assets/images/guitar_camp.png',
//       'category': 'Ambient',
//       'description':
//           'Relax with mellow guitar melodies perfect for campfire nights and peaceful escapes. Pure instrumental warmth for any moment.',
//       'songs': [
//         {'title': 'Song 1', 'artist': 'Artist A'},
//         {'title': 'Song 2', 'artist': 'Artist B'},
//       ]
//     },
//   ];

//   AllSongsGrid({super.key, required this.selectedCategory});

//   @override
//   Widget build(BuildContext context) {
//     List<Map<String, dynamic>> filteredItems = _musicItems.where((item) {
//       if (selectedCategory == 'All') {
//         return true;
//       } else {
//         return item['category'] == selectedCategory;
//       }
//     }).toList();

//     return GridView.builder(
//       padding: const EdgeInsets.all(8.0),
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         crossAxisSpacing: 8.0,
//         mainAxisSpacing: 1.0,
//         childAspectRatio: 0.70,
//       ),
//       itemCount: filteredItems.length,
//       itemBuilder: (context, index) {
//         final item = filteredItems[index];
//         return _buildGridItem(context, item);
//       },
//     );
//   }

//   Widget _buildGridItem(BuildContext context, Map<String, dynamic> item) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => PackDetail(
//               title: item['title']!,
//               subtitle: item['subtitle']!,
//               image: item['image']!,
//               description: item['description']!,
//               songs: item['songs'], mood: '', dreams: '',
//             ),
//           ),
//         );
//       },
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             AspectRatio(
//               aspectRatio: 1,
//               child: Stack(
//                 children: [
//                   Container(
//                     decoration: BoxDecoration(
//                         image: DecorationImage(
//                           image: AssetImage(item['image']!),
//                           fit: BoxFit.cover,
//                         ),
//                         borderRadius: BorderRadius.circular(12),
//                         border: Border.all(
//                             strokeAlign: BorderSide.strokeAlignCenter,
//                             color: const Color(0xff21283f))),
//                   ),
//                   Positioned(
//                     top: 8,
//                     left: 8,
//                     child: GestureDetector(
//                       onTap: () {
//                         print("Play button clicked for ${item['title']}");
//                       },
//                       child: Container(
//                         padding: const EdgeInsets.all(8.0),
//                         decoration: BoxDecoration(
//                           color: Colors.black.withOpacity(0.6),
//                           shape: BoxShape.circle,
//                         ),
//                         child: const Icon(
//                           Icons.play_arrow,
//                           color: Colors.white,
//                           size: 22,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               item['title']!,
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.w500,
//                 fontFamily: 'SF',
//                 fontSize: 20,
//               ),
//             ),
//             const SizedBox(height: 4),
//             Text(
//               item['subtitle']!,
//               style: const TextStyle(
//                 color: Colors.white60,
//                 fontFamily: 'SF',
//                 fontSize: 14,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
