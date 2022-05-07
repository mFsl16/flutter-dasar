import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

void main() {
  runApp(MaterialApp(
    home: PhysicsCardDragDemo(),
  ));
}

class PhysicsCardDragDemo extends StatelessWidget {
  const PhysicsCardDragDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const DraggableCard(
        child: FlutterLogo(
          size: 128,
        ),
      ),
    );
  }
}

class DraggableCard extends StatefulWidget {
  const DraggableCard({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  State<DraggableCard> createState() => _DraggableCardState();
}

class _DraggableCardState extends State<DraggableCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Alignment> _animation;
  Alignment _alignment = Alignment.center;

  void _runAnimation(Offset pixelPerSecond, Size size) {
    _animation = _animationController
        .drive(AlignmentTween(begin: _alignment, end: Alignment.center));

    final unitsPerSecondsX = pixelPerSecond.dx / size.width;
    final unitsPerSeconfsY = pixelPerSecond.dy / size.height;
    final unitsPerSeconds = Offset(unitsPerSecondsX, unitsPerSeconfsY);
    final unitVelocity = unitsPerSeconds.distance;

    const spring = SpringDescription(mass: 30, stiffness: 1, damping: 1);

    final simulation = SpringSimulation(spring, 0, 1, -unitVelocity);
    _animationController.animateWith(simulation);
    _animationController.reset();
    _animationController.forward();
  }

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animationController.addListener(() {
      setState(() {
        _alignment = _animation.value;
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onPanDown: (details) {
        _animationController.stop();
      },
      onPanUpdate: (details) {
        setState(() {
          _alignment += Alignment(details.delta.dx / (size.width / 2),
              details.delta.dy / (size.height / 2));
        });
      },
      onPanEnd: (details) {
        _runAnimation(details.velocity.pixelsPerSecond, size);
      },
      child: Align(
        alignment: _alignment,
        child: Card(
          child: widget.child,
        ),
      ),
    );
  }
}
