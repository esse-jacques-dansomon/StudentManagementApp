import 'package:flutter/material.dart';
import 'package:school_managment/config/app_colors.dart';
import 'package:school_managment/ui/base_widgets/cards/user_image_card.dart';

class ChatUserItem extends StatelessWidget {
  const ChatUserItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 13.0),
      child: Row(
        children: [
          const UserImage(
            height: 60, width: 60,
          ),
          const SizedBox(width: 15,),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Mrs Sara',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      '12:09 am',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                        'Message',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        )),
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.PRIMARY,
                      ),
                      child: const Center(

                        child: Text(
                          '2',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
