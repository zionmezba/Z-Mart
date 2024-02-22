import 'package:flutter/material.dart';

import 'curved_edges.dart';

class ZCurvedEdgeWidget extends StatelessWidget {
  const ZCurvedEdgeWidget({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(clipper: ZCustomCurvedEdges(), child: child);
  }
}
