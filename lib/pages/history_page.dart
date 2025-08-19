import 'package:fine_tune_app/pages/video_history_page.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color primaryGreen = Color(0xFF4EE382);
    const Color cardColor = Color(0xFF2E3033);
    const Color lightGrey = Color(0xFF99A0A5);

    final List<Map<String, String>> files = [
      {'name': 'finetune__0183122__wav', 'time': '7 minute ago'},
      {'name': 'finetune__0183121__wav', 'time': '8 minute ago'},
      {'name': 'finetune__0183120__wav', 'time': '27 minute ago'},
      {'name': 'finetune__0183119__wav', 'time': '51 minute ago'},
    ];

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF2E635F), Color(0xFF202020)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back_ios, color: Colors.white),
                    ),
                    Row(
                      children: const [
                        Icon(Icons.history, color: primaryGreen, size: 20),
                        SizedBox(width: 8),
                        Text(
                          'History',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Icon(Icons.settings, color: Colors.white),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.music_note, color: Colors.black),
                        label: const Text('Audio', style: TextStyle(color: Colors.black)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryGreen,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const VideoHistoryPage()));
                        },
                        icon: const Icon(Icons.videocam, color: lightGrey),
                        label: const Text('Video', style: TextStyle(color: lightGrey)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: cardColor,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  itemCount: files.length,
                  itemBuilder: (context, index) {
                    return _buildFileItem(
                      context,
                      files[index]['name']!,
                      files[index]['time']!,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildFileItem(BuildContext context, String fileName, String timeAgo) {
    const Color primaryGreen = Color(0xFF4EE382);
    const Color cardColor = Color(0xFF2E3033);
    const Color lightGrey = Color(0xFF99A0A5);

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const RemovingNoisePage(),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            const Icon(Icons.description, color: primaryGreen),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    fileName,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Text(
                    timeAgo,
                    style: const TextStyle(color: lightGrey, fontSize: 12),
                  ),
                ],
              ),
            ),
            const Icon(Icons.more_vert, color: lightGrey),
          ],
        ),
      ),
    );
  }
}

class RemovingNoisePage extends StatelessWidget {
  const RemovingNoisePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Removing Noise Page",
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
