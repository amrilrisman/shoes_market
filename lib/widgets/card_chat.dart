import 'package:flutter/cupertino.dart';
import 'package:package/core/style/theme.dart';
import 'package:package/widgets/card_previewItems.dart';

class ChatBubble extends StatelessWidget {
  final bool isSend;
  final bool hasProduct;
  final String text;
  const ChatBubble(
      {Key? key,
      required this.isSend,
      required this.text,
      required this.hasProduct})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSend ? Alignment.topRight : Alignment.topLeft,
      child: Column(
        crossAxisAlignment:
            isSend ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          hasProduct ? const CardPreviewItem() : const SizedBox(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            margin: const EdgeInsets.only(right: 30, left: 30, bottom: 30),
            decoration: BoxDecoration(
                color:
                    isSend ? const Color(0xFF2B2844) : const Color(0xFF252836),
                borderRadius: BorderRadius.only(
                  topLeft: isSend
                      ? const Radius.circular(12)
                      : const Radius.circular(0),
                  topRight: isSend
                      ? const Radius.circular(0)
                      : const Radius.circular(12),
                  bottomLeft: const Radius.circular(12),
                  bottomRight: const Radius.circular(12),
                )),
            child: Text(
              text,
              style: descriptionTextStyle.copyWith(
                color: backgroundCard,
                fontWeight: regular,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
