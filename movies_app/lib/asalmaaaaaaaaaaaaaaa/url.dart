
// void openTorrent(String url) async {
//   final Uri uri = Uri.parse(url);
//   if (await canLaunchUrl(uri)) {
//     await launchUrl(uri, mode: LaunchMode.externalApplication);
//   } else {
//     throw "Could not launch $url";
//   }
// }



//  Column(
//                               children: movie.torrents!.map((torrent) {
//                                 return ListTile(
//                                   title: Text(
//                                       "${torrent.quality} - ${torrent.size}"),
//                                   subtitle: Text("Magnet: ${torrent.url}"),
//                                   onTap: () async {
//                                     openTorrent(torrent.url);
//                                     final Uri url = Uri.parse(torrent.url);
//                                     if (await canLaunchUrl(url)) {
//                                       await launchUrl(url);
//                                     } else {
//                                       throw "Could not launch $url";
//                                     }
//                                   },
//                                 );
//                               }).toList(),
//                             )