import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class UserAppBar extends StatefulWidget implements PreferredSizeWidget {
  const UserAppBar({
    super.key,
    required this.image,
    required this.onPressed,
  });

  final VoidCallback onPressed;
  final String image;

  @override
  State<UserAppBar> createState() => _UserAppBarState();

  @override
Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _UserAppBarState extends State<UserAppBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(top:25,left: 8.0,right: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Image.asset(
                widget.image,
                height: 50,
                width: MediaQuery.of(context).size.width * 0.20,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.message,
                    color: Colors.black87,
                  ),
                  onPressed: widget.onPressed,
                ),

              ],
            )
          ],
        ),
      ),
    );
  }
}
