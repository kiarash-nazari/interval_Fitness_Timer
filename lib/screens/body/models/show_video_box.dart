import 'package:flutter/material.dart';
import 'package:interval_timer/components/extentions.dart';
import 'package:interval_timer/res/colors.dart';
import 'package:interval_timer/screens/body/widgets/videos_in_expantion_panel.dart';
import 'package:interval_timer/utils/youtube/youtube_service.dart';

class ShowVideoBox extends StatefulWidget {
  final String primeriChoosen;

  const ShowVideoBox({
    super.key,
    required this.primeriChoosen,
  });

  @override
  State<ShowVideoBox> createState() => _ShowVideoBoxState();
}

class _ShowVideoBoxState extends State<ShowVideoBox> {
  final List<bool> isExpandedList = [false, false, false];
  final YoutubeService _youtubeService = YoutubeService();
  Future<List<String>> _videoIds = Future.value([]);

  void _searchVideos(String part) {
    // Use a regular expression to remove the prefixes "left" or "right"
    String cleanPart =
        part.replaceAll(RegExp(r'^(left|right)(First|Second|Third)?'), '');
    String finalSerachPrompt = "Gym exersice for $cleanPart";
    setState(() {
      _videoIds = _youtubeService.fetchVideoIds(finalSerachPrompt);
    });
  }

  void _searchMobilityVideos(String part) {
    // Use a regular expression to remove the prefixes "left" or "right"
    String cleanPart =
        part.replaceAll(RegExp(r'^(left|right)(First|Second|Third)?'), '');
    String finalSerachPrompt = "mobility  exersice for $cleanPart";
    setState(() {
      _videoIds = _youtubeService.fetchVideoIds(finalSerachPrompt);
    });
  }

  void _searchBodyWeightVideos(String part) {
    // Use a regular expression to remove the prefixes "left" or "right"
    String cleanPart =
        part.replaceAll(RegExp(r'^(left|right)(First|Second|Third)?'), '');
    String finalSerachPrompt = "body weight exersice for $cleanPart";
    setState(() {
      _videoIds = _youtubeService.fetchVideoIds(finalSerachPrompt);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      content: Column(
        children: [
          24.heightBox,
          ExpansionPanelList(
            expandedHeaderPadding: const EdgeInsets.all(10),
            expansionCallback: (panelIndex, isExpanded) {
              setState(() {
                isExpandedList[panelIndex] = isExpanded;

                if (isExpandedList[0]) {
                  _searchVideos(widget.primeriChoosen);
                } else if (isExpandedList[1]) {
                  _searchMobilityVideos(widget.primeriChoosen);
                } else if (isExpandedList[2]) {
                  _searchBodyWeightVideos(widget.primeriChoosen);
                }
              });
            },
            children: [
              ExpansionPanel(
                isExpanded: isExpandedList[0],
                headerBuilder: (context, isExpanded) {
                  isExpandedList[1] = false;
                  isExpandedList[2] = false;
                  return const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text("Gym Exercises"),
                  );
                },
                body: VideosInExpantionPanel(videoIds: _videoIds),
                canTapOnHeader: true,
              ),
              ExpansionPanel(
                  isExpanded: isExpandedList[1],
                  headerBuilder: (context, isExpanded) {
                    isExpandedList[0] = false;
                    isExpandedList[2] = false;
                    return const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text("Mobility"),
                    );
                  },
                  body: VideosInExpantionPanel(videoIds: _videoIds)),
              ExpansionPanel(
                  isExpanded: isExpandedList[2],
                  headerBuilder: (context, isExpanded) {
                    isExpandedList[1] = false;
                    isExpandedList[0] = false;
                    return const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text("Body Weight"),
                    );
                  },
                  body: VideosInExpantionPanel(videoIds: _videoIds)),
            ],
          ),
        ],
      ),
      backgroundColor: AppColors.bgInterval,
    );
  }
}
