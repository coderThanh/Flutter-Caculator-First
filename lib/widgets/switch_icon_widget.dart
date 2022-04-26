import 'package:flutter/material.dart';

class SwitchIcon extends StatefulWidget {
  String textOff;
  String textOn;
  Color textColorOn;
  Color textColorOff;
  Widget? iconOff;
  Widget? iconOn;
  Color bgColorOff;
  Color bgColorOn;
  Color btnColorOff;
  Color btnColorOn;
  double width;
  double height;
  double btnWidth;
  double btnHeight;
  double textWidth;
  double paddingVerti;
  double paddingHori;
  bool isActive;
  List<BoxShadow>? boxShadow;
  void Function() onChanged;

  SwitchIcon({
    Key? key,
    this.textOn = 'On',
    this.textOff = 'Off',
    this.bgColorOff = const Color.fromARGB(255, 139, 139, 139),
    this.bgColorOn = const Color.fromARGB(255, 9, 185, 117),
    this.btnColorOff = Colors.white,
    this.btnColorOn = Colors.white,
    this.textColorOff = Colors.white,
    this.textColorOn = Colors.white,
    this.iconOff,
    this.iconOn,
    this.paddingVerti = 2,
    this.paddingHori = 3,
    this.width = 55,
    this.height = 25,
    this.btnWidth = 20,
    this.btnHeight = 20,
    this.textWidth = 34,
    this.boxShadow = const [
      BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.1),
        blurRadius: 10,
      ),
    ],
    required this.isActive,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<SwitchIcon> createState() => _SwitchIconState();
}

class _SwitchIconState extends State<SwitchIcon> {
  late String _text;
  late Color _bg;
  late double _spacePosition;
  int timeDura = 400;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _text = widget.isActive ? widget.textOn : widget.textOff;
    _bg = widget.isActive ? widget.bgColorOn : widget.bgColorOff;
    _spacePosition = widget.width - widget.btnWidth - widget.paddingHori;
  }

  @override
  void didUpdateWidget(covariant SwitchIcon oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    _text = widget.isActive ? widget.textOn : widget.textOff;
    _bg = widget.isActive ? widget.bgColorOn : widget.bgColorOff;
    _spacePosition = widget.width - widget.btnWidth - widget.paddingHori * 2;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      padding: EdgeInsets.symmetric(
        vertical: widget.paddingVerti,
        horizontal: widget.paddingHori,
      ),
      decoration: BoxDecoration(
        color: _bg,
        borderRadius: BorderRadius.circular(50),
        boxShadow: widget.boxShadow,
      ),
      child: InkWell(
        onTap: widget.onChanged,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Circle
            AnimatedPositioned(
              duration: Duration(milliseconds: timeDura),
              left: widget.isActive ? 0 : _spacePosition,
              child: Container(
                child: widget.iconOn,
                alignment: Alignment.center,
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  color:
                      widget.isActive ? widget.btnColorOn : widget.btnColorOff,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
            // Text on
            Positioned(
              right: 2,
              child: SizedBox(
                width: widget.textWidth,
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: timeDura - 200),
                  opacity: widget.isActive ? 1 : 0,
                  child: Text(
                    _text.isNotEmpty ? _text : '',
                    style: TextStyle(
                      color: widget.textColorOn,
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                    overflow: TextOverflow.fade,
                    textAlign: TextAlign.right,
                    softWrap: false,
                  ),
                ),
              ),
            ),
            // Text off
            Positioned(
              left: 2,
              child: SizedBox(
                width: widget.textWidth,
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: timeDura - 200),
                  opacity: widget.isActive ? 0 : 1,
                  child: Text(
                    _text.isNotEmpty ? _text : '',
                    style: TextStyle(
                      color: widget.textColorOff,
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                    overflow: TextOverflow.fade,
                    textAlign: TextAlign.left,
                    softWrap: false,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
