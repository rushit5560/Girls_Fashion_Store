import 'package:flutter/material.dart';
import 'package:girls_fashion_store/common/img_url.dart';
import '../../models/notification_screen_model/notification_model.dart';

class NotificationScreen extends StatelessWidget {

  List<NotificationInfo> notificationLists = [
    NotificationInfo(
      notiImgUrl: ImgUrl.noti1,
      notiTitle: 'Your Order Has Been Delivered.',
      notiTime: '12 min ago',
    ),
    NotificationInfo(
      notiImgUrl: ImgUrl.noti2,
      notiTitle: 'Your Wishlist is Updated',
      notiTime: '12 min ago',
    ),
    NotificationInfo(
      notiImgUrl: ImgUrl.noti3,
      notiTitle: 'Use 30% off Code.',
      notiTime: '12 min ago',
    ),
    NotificationInfo(
      notiImgUrl: ImgUrl.noti1,
      notiTitle: 'Your Order Has Been Delivered.',
      notiTime: '12 min ago',
    ),
    NotificationInfo(
      notiImgUrl: ImgUrl.noti2,
      notiTitle: 'Your Wishlist is Updated',
      notiTime: '12 min ago',
    ),
    NotificationInfo(
      notiImgUrl: ImgUrl.noti3,
      notiTitle: 'Your Order Has Been Delivered.',
      notiTime: '12 min ago',
    ),
    NotificationInfo(
      notiImgUrl: ImgUrl.noti1,
      notiTitle: 'Your Wishlist is Updated',
      notiTime: '12 min ago',
    ),
    NotificationInfo(
      notiImgUrl: ImgUrl.noti2,
      notiTitle: 'Your Order Has Been Delivered.',
      notiTime: '12 min ago',
    ),
    NotificationInfo(
      notiImgUrl: ImgUrl.noti3,
      notiTitle: 'Your Wishlist is Updated',
      notiTime: '12 min ago',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notification',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        // shrinkWrap: true,
        itemCount: notificationLists.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              elevation: 10, borderRadius: BorderRadius.circular(10),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        width: 65, height: 65,
                        decoration: BoxDecoration(shape: BoxShape.circle),
                        child: Image(
                          image: AssetImage(notificationLists[index].notiImgUrl),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              notificationLists[index].notiTitle,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            spacer(5),
                            Text(
                              notificationLists[index].notiTime,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.grey
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }


  Widget spacer(double value) {
    return SizedBox(height: value);
  }
}
