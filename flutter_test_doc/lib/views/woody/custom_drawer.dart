import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> with SingleTickerProviderStateMixin {
  Animation<Offset>? customDrawer;
  AnimationController? customDrawerCt;

  @override
  void initState() {
    customDrawerCt = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    )..addListener(() {
        setState(() {});
    });

    customDrawer = Tween(begin: const Offset(-2,0), end: Offset.zero).animate(customDrawerCt!);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: double.infinity,  
            child: Center(
              child: IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  this.customDrawerCt!.status.index == 3
                      ? this.customDrawerCt!.reverse()
                      : this.customDrawerCt!.forward();
                },
              ),
            ), 
          ),
          Positioned(
            top: 0,
            left: 0,
            child: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  customDrawerCt!.status.index == 3
                      ? customDrawerCt!.reverse()
                      : customDrawerCt!.forward();
                },
              ),
          ),
          SlideTransition(
            position: customDrawer!,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        )
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                            constraints: BoxConstraints(),
                            padding: EdgeInsets.zero,
                            icon: const Icon(Icons.menu),
                            onPressed: () => customDrawerCt!.reverse()
                          ),
                          Container(
                            width: double.infinity,
                            height: 200,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          ElevatedButton(
                            child: Row(
                              children: const [
                                Text('나가기',style: TextStyle(fontSize: 10),),
                                Icon(
                                  Icons.logout,
                                  size: 20,
                                ),
                              ],
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.grey[800],
                            ),
                            onPressed: () => customDrawerCt!.reverse()
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: GestureDetector(
                      onTap: (){
                        customDrawerCt!.reverse();
                      },
                      child: Container(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
  }
}
