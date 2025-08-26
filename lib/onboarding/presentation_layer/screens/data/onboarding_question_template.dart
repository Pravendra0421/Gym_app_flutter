import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'squat_option_card.dart';

class OptionModel {
  final String id;
  final String text;
  OptionModel({required this.id, required this.text});
}

class VideoDisplayWidget extends StatefulWidget {
  final String videoPath;
  const VideoDisplayWidget({super.key, required this.videoPath});

  @override
  State<VideoDisplayWidget> createState() => _VideoDisplayWidgetState();
}

class _VideoDisplayWidgetState extends State<VideoDisplayWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoPath)
      ..initialize().then((_) {
        _controller.setLooping(true);
        _controller.setVolume(0.0);
        _controller.play();
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: AspectRatio(
        aspectRatio: _controller.value.aspectRatio,
        child: VideoPlayer(_controller),
      ),
    )
        : const Center(child: CircularProgressIndicator());
  }
}

// reusable template
class OnboardingQuestionTemplate extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String mediaPath;
  final List<OptionModel> options;
  final String? selectedOptionId;
  final Function(String) onOptionSelected;
  final VoidCallback? onBackPressed; //

  const OnboardingQuestionTemplate({
    super.key,
    required this.title,
    this.subtitle,
    required this.mediaPath,
    required this.options,
    required this.selectedOptionId,
    required this.onOptionSelected,
    this.onBackPressed, //
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
        leading: onBackPressed != null
            ? IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: onBackPressed,
        )
            : null,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title, Subtitle, Media, aur Options Grid...
              Text(
                title,
                style:
                const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 8),
                Text(
                  subtitle!,
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
              const SizedBox(height: 40),
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: mediaPath.endsWith('.mp4')
                    ? VideoDisplayWidget(videoPath: mediaPath)
                    : Image.asset(mediaPath, fit: BoxFit.contain),
              ),
              const SizedBox(height: 40),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 2.5,
                  ),
                  itemCount: options.length,
                  itemBuilder: (context, index) {
                    final option = options[index];
                    return SquatOptionCard(
                      text: option.text,
                      isSelected: selectedOptionId == option.id,
                      onTap: () => onOptionSelected(option.id),
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
}
