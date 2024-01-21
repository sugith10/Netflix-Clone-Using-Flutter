import 'package:flutter/material.dart';

class UserProfileWidget extends StatelessWidget {
  const UserProfileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network('https://media.licdn.com/dms/image/D5603AQHL6xrN6LW9dA/profile-displayphoto-shrink_200_200/0/1696985633177?e=2147483647&v=beta&t=faFj8AwSXIHUyO74pF7DJYrq_uYXQkHgNn88cJgvHlg',
            height: 80,
            width: 80,
            ),
          ),
        const SizedBox(height: 5,),
      const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Sugith', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
        
        ],
      )
        ],
      
      ),
    );
  }
}