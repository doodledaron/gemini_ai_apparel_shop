import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:gemini_ai_apparel_shop/constants/colors.dart';
import 'package:gemini_ai_apparel_shop/src/modules/camera/camera_bloc/camera_bloc.dart';
import 'package:go_router/go_router.dart';

class SuggestionScreen extends StatefulWidget {
  const SuggestionScreen({super.key});

  @override
  State<SuggestionScreen> createState() => _SuggestionScreenState();
}

class _SuggestionScreenState extends State<SuggestionScreen> {
  bool _showSecondBubble = false;
  bool _showThirdBubble = false;

  int getSuggestionTabIndex(String suggestion) {
    switch (suggestion) {
      case "Casual":
        return 0;
      case "Formal":
        return 1;
      case "Active":
        return 2;
      case "Street wear":
        return 3;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final response = context.read<CameraBloc>().response;
    final String description = response["image_description"];
    final String suggestion = response["suggestion"];
    final String reason = response["reason"];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Suggestion'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/robot.jpg'),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      ChatBubble(
                        clipper:
                            ChatBubbleClipper1(type: BubbleType.receiverBubble),
                        backGroundColor: primaryColor,
                        margin: const EdgeInsets.only(top: 20),
                        child: Container(
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.7,
                          ),
                          child: AnimatedTextKit(
                            onFinished: () {
                              setState(() {
                                _showSecondBubble = true;
                              });
                            },
                            isRepeatingAnimation: false,
                            animatedTexts: [
                              TypewriterAnimatedText(
                                'Hey! $description',
                                speed: const Duration(milliseconds: 38),
                                textStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      _showSecondBubble
                          ? _buildSecondChatBubble(context, suggestion, reason)
                          : const SizedBox(),
                      _showThirdBubble
                          ? _buildThirdChatBubble(context, suggestion, reason)
                          : const SizedBox(),
                    ],
                  ),
                ],
              ),
              Container(
                color: Colors.red,
              )
            ],
          ),
        ),
      ),
    );
  }

  ChatBubble _buildSecondChatBubble(
      BuildContext context, String suggestion, String reason) {
    return ChatBubble(
      clipper: ChatBubbleClipper1(type: BubbleType.receiverBubble),
      backGroundColor: primaryColor,
      margin: const EdgeInsets.only(top: 20),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7,
        ),
        child: AnimatedTextKit(
          isRepeatingAnimation: false,
          onFinished: () {
            setState(() {
              _showThirdBubble = true;
            });
          },
          animatedTexts: [
            TypewriterAnimatedText(
              '$suggestion would rock :) $reason',
              speed: const Duration(milliseconds: 38),
              textStyle: const TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  ChatBubble _buildThirdChatBubble(
      BuildContext context, String suggestion, String reason) {
    return ChatBubble(
      clipper: ChatBubbleClipper1(type: BubbleType.receiverBubble),
      backGroundColor: primaryColor,
      margin: const EdgeInsets.only(top: 20),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7,
        ),
        child: AnimatedTextKit(
          isRepeatingAnimation: false,
          onFinished: () {
            final tabIndex = getSuggestionTabIndex(suggestion);
            print('The tab index is : $tabIndex');
            context.goNamed("navigation", extra: tabIndex);
          },
          animatedTexts: [
            TypewriterAnimatedText(
              'Now Trendify will navigate you to the $suggestion section......',
              speed: const Duration(milliseconds: 38),
              textStyle: const TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
