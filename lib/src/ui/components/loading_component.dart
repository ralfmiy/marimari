// // ignore_for_file: unnecessary_null_comparison, unnecessary_type_check

// import 'package:flutter/material.dart';

// import '../../../values/k_colors.dart';

// class LoadingComponent extends StatefulWidget {
//   final Color color;
//   final double size;
//   final IndexedWidgetBuilder? itemBuilder;
//   final Duration duration;

//   const LoadingComponent({
//     Key? key,
//     this.color = Colors.grey,
//     this.size = 50.0,
//     this.itemBuilder,
//     this.duration = const Duration(milliseconds: 2000),
//   })  : assert(
//   !(itemBuilder is IndexedWidgetBuilder && color is Color) &&
//       !(itemBuilder == null && color == null),
//   'You should specify either a itemBuilder or a color'),
//         assert(size != null),
//         super(key: key);

//   @override
//   SpinKitChasingDotsState createState() => SpinKitChasingDotsState();
// }

// class SpinKitChasingDotsState extends State<LoadingComponent>
//     with TickerProviderStateMixin {
//   late AnimationController _scaleCtrl, _rotateCtrl;
//   late Animation<double> _scale, _rotate;

//   @override
//   void initState() {
//     super.initState();

//     _scaleCtrl = AnimationController(vsync: this, duration: widget.duration)
//       ..addListener(() => setState(() {}))
//       ..repeat(reverse: true);
//     _scale = Tween(begin: -1.0, end: 1.0)
//         .animate(CurvedAnimation(parent: _scaleCtrl, curve: Curves.easeInOut));

//     _rotateCtrl = AnimationController(vsync: this, duration: widget.duration)
//       ..addListener(() => setState(() {}))
//       ..repeat();
//     _rotate = Tween(begin: 0.0, end: 360.0)
//         .animate(CurvedAnimation(parent: _rotateCtrl, curve: Curves.linear));
//   }

//   @override
//   void dispose() {
//     _scaleCtrl.dispose();
//     _rotateCtrl.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: SizedBox.fromSize(
//         size: Size.square(widget.size),
//         child: Transform.rotate(
//           angle: _rotate.value * 0.0174533,
//           child: Stack(
//             children: <Widget>[
//               Positioned(top: 0.0, child: _circle(1.0 - _scale.value.abs(), 0)),
//               Positioned(bottom: 0.0, child: _circle(_scale.value.abs(), 1)),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _circle(double scale, int index) {
//     return Transform.scale(
//       scale: scale,
//       child: SizedBox.fromSize(
//         size: Size.square(widget.size * 0.6),
//         child: widget.itemBuilder != null
//             ? widget.itemBuilder!(context, index)
//             : DecoratedBox(
//             decoration:
//             BoxDecoration(shape: BoxShape.circle, color: widget.color)),
//       ),
//     );
//   }
// }

// Widget loadingComponent(bool isVisible, {Color color = KPrimary, double size = 50, EdgeInsetsGeometry? padding}) {
//   return Visibility(
//     visible: isVisible,
//     child: Container(
//       padding: padding ?? const EdgeInsets.all(0),
//       color:  Colors.transparent,
//       alignment: Alignment.center,
//       child: LoadingComponent(
//         color: color,
//         size: size,
//       ),
//     ),
//   );
// }

// import 'package:flutter/material.dart';

// class LoadingComponent extends StatefulWidget {
//   final Color color;
//   final double size;
//   final Color lColor;
//   final Duration duration;

//   const LoadingComponent({
//     Key? key,
//     this.color = Colors.grey,
//     this.size = 50.0,
//     this.lColor = Colors.blue, // Color del "L"
//     this.duration = const Duration(milliseconds: 2000),
//   }) : super(key: key);

//   @override
//   SpinKitLState createState() => SpinKitLState();
// }

// class SpinKitLState extends State<LoadingComponent>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;

//   @override
//   void initState() {
//     super.initState();

//     _controller = AnimationController(vsync: this, duration: widget.duration)
//       ..addListener(() => setState(() {}))
//       ..repeat();
//     _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: SizedBox.fromSize(
//         size: Size.square(widget.size),
//         child: Stack(
//           children: <Widget>[
//             Positioned(
//               top: _animation.value * widget.size,
//               left: 0.0,
//               child: _buildL(widget.lColor),
//             ),
//             Positioned(
//               top: (1 - _animation.value) * widget.size,
//               left: _animation.value * widget.size,
//               child: Transform.rotate(
//                 angle: 180 * 0.0174533,
//                 child: _buildL(widget.lColor),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildL(Color color) {
//     return Container(
//       width: widget.size * 0.6,
//       height: widget.size * 0.6,
//       decoration: BoxDecoration(
//         color: color,
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(10.0),
//           bottomRight: Radius.circular(10.0),
//         ),
//       ),
//     );
//   }
// }

// Widget loadingComponent(bool isVisible,
//     {Color color = Colors.blue, double size = 50, EdgeInsetsGeometry? padding}) {
//   return Visibility(
//     visible: isVisible,
//     child: Container(
//       padding: padding ?? const EdgeInsets.all(0),
//       color: Colors.transparent,
//       alignment: Alignment.center,
//       child: LoadingComponent(
//         color: color,
//         size: size,
//       ),
//     ),
//   );
// }

import 'package:flutter/material.dart';

class LoadingComponent extends StatelessWidget {
  final Color color;
  final double size;
  final Color lColor;

  const LoadingComponent({
    Key? key,
    this.color = Colors.black,
    this.size = 300.0,
    this.lColor = Colors.blue, // Color de las "L"
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: size,
        width: size,
        child: Stack(
          children: <Widget>[
            _buildL(Colors.green),
            
            buildLinvert(Colors.transparent)
            
          ],
        ),
      ),
    );
  }

  Widget _buildL(Color color) {
    // return Stack(
    //   alignment: AlignmentDirectional.center,
    //   children: [
    //     Container(
    //      width: size * 0.65,
    //     height: size * 1,
    //       color: Colors.black,
    //     ),
    //     SizedBox(
    //        width: size * 0.65,
    //     height: size * 0.7,
    //       child: Row(
    //         children: [
    //           Column(children: [Container(height:size * 0.2, width: size * 0.2,color: Colors.white,)]),
    //           Column(children: [Container(height:size * 0.7, width: size * 0.25,color: Colors.white,)]),
    //           Column(mainAxisAlignment: MainAxisAlignment.end,children: [Container(height:size * 0.2, width: size * 0.2,color: Colors.white,)]),
    //         ],
    //       ),
    //     )
    //   ],
    // );
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(children: [
          Container(
            height: size * 0.2,
            width: size * 0.2,
            color: color,
          ),
          Container(
            height: size * 0.8,
            width: size * 0.2,
            color: Colors.black,
          ),
        ]),
        Column(children: [
          Container(
            height: size * 0.8,
            width: size * 0.2,
            color: color,
          ),
          Container(
            height: size * 0.2,
            width: size * 0.2,
            color: Colors.black,
          ),
        ]),
      ],
    );
  }

  buildLinvert(color){
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(children: [
          Container(
            height: size * 0.2,
            width: size * 0.2,
            color: Colors.black,
          ),
          Container(
            height: size * 0.8,
            width: size * 0.2,
            color: color,
          ),
          
        ]),
        Column(children: [
          Container(
            height: size * 0.8,
            width: size * 0.2,
            color: Colors.black,
          ),
          Container(
            height: size * 0.2,
            width: size * 0.2,
            color: color,
          ),
           
          
         
        ]),
        
      ],
    );
  }
}




Widget loadingComponent(bool isVisible,
    {Color color = Colors.blue,
    double size = 50,
    EdgeInsetsGeometry? padding}) {
  return Center(
    child: Visibility(
      visible: isVisible,
      child: Center(
        child: Container(
          padding: padding ?? const EdgeInsets.all(0),
          color: Colors.yellow,
          alignment: Alignment.center,
          child: Center(
            child: LoadingComponent(
              color: color,
              size: size,
            ),
          ),
        ),
      ),
    ),
  );
}
