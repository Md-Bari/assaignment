import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: CardListScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

// Custom Card Widget
class AnimatedInfoCard extends StatefulWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final String description;

  const AnimatedInfoCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.description,
  }) : super(key: key);

  @override
  _AnimatedInfoCardState createState() => _AnimatedInfoCardState();
}

class _AnimatedInfoCardState extends State<AnimatedInfoCard> {
  double _scale = 1.0;

  void _onTapDown(_) => setState(() => _scale = 0.97);
  void _onTapUp(_) => setState(() => _scale = 1.0);
  void _onTapCancel() => setState(() => _scale = 1.0);

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: _scale,
      duration: Duration(milliseconds: 150),
      curve: Curves.easeOut,
      child: InkWell(
        onTapDown: _onTapDown,
        onTapUp: _onTapUp,
        onTapCancel: _onTapCancel,
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('${widget.title} tapped!')),
          );
        },
        child: Card(
          elevation: 4,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.asset(
                  widget.imagePath,
                  width: double.infinity,
                  height: 180,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.title,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text(widget.subtitle,
                        style: TextStyle(color: Colors.grey[600])),
                    SizedBox(height: 8),
                    Text(widget.description, style: TextStyle(fontSize: 14)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Screen with List of Cards
class CardListScreen extends StatelessWidget {
  final List<Map<String, String>> cardData = [
    {
      'imagePath': 'assets/images/shitol.jpg',
      'title': 'Mountain View',
      'subtitle': 'Nature / Travel',
      'description':
          'Enjoy the breathtaking view of the mountains during sunrise.',
    },
    {
      'imagePath': 'assets/images/zion.jpg',
      'title': 'Golden Retriever',
      'subtitle': 'Animals / Pets',
      'description': 'This friendly pup is always ready for a game of fetch.',
    },
    {
      'imagePath': 'assets/images/diu.jpeg',
      'title': 'Sunset Beach',
      'subtitle': 'Travel / Relax',
      'description':
          'Watch the sun dip below the horizon at this serene beach.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Local Image Cards')),
      body: ListView.builder(
        itemCount: cardData.length,
        itemBuilder: (context, index) {
          final item = cardData[index];
          return AnimatedInfoCard(
            imagePath: item['imagePath']!,
            title: item['title']!,
            subtitle: item['subtitle']!,
            description: item['description']!,
          );
        },
      ),
    );
  }
}
