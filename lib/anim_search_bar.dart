import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AnimSearchBar extends StatefulWidget {
  const AnimSearchBar({
    super.key, 
    required this.duration,
    this.expandedWidth,
    this.icon = const Icon(Icons.search),
    this.controller,
    this.focusNode,
    this.keyboardType,
    this.textInputAction,
    this.style,
    this.textAlign = TextAlign.start,
    this.readOnly = false,
    this.obscuringCharacter = '•',
    this.obscureText = false,
    this.autocorrect = true,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.inputFormatters,
    this.enabled,
    this.cursorWidth = 2.0,
    this.closedWidth = 40,
    this.cursorColor,
    this.autofillHints = const <String>[],
    this.prefixIcon = const Icon(Icons.arrow_back_ios),
    this.suffixIcon = const Icon(Icons.close),
    this.hintText,
    this.labelText,
    this.border,
    this.enabledBorder,
    this.focusedBorder,
    this.errorBorder,
    this.focusedErrorBorder,
    this.contentPadding = const EdgeInsets.all(12.0),
    this.prefixText,
    this.suffixText,
    this.onSwitchedState,
    this.height
  });

  final Duration duration;
  final Widget icon;
  final double? expandedWidth;
  final double closedWidth;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextStyle? style;
  final TextAlign textAlign;
  final bool readOnly;
  final String obscuringCharacter;
  final bool obscureText;
  final bool autocorrect;
  final double? height;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;
  final double cursorWidth;
  final Color? cursorColor;
  final Iterable<String>? autofillHints;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final String? hintText;
  final String? labelText;
  final InputBorder? border;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusedErrorBorder;
  final EdgeInsetsGeometry? contentPadding;
  final String? prefixText;
  final String? suffixText;
  final void Function(bool isExpanded)? onSwitchedState;

  @override
  State<AnimSearchBar> createState() => _AnimSearchBarState();
}

class _AnimSearchBarState extends State<AnimSearchBar> {
  bool isExpanded = false;
  bool showSearchIcon = true;

  void switchState() {
    if (isExpanded) {
      setState(() => showSearchIcon = false);
      setState(() => isExpanded = false);

      Future.delayed(
        widget.duration, 
        () => setState(() => showSearchIcon = true)
      );
    } else {
      setState(() {
        isExpanded = true;
        showSearchIcon = false;
      });
    }
    widget.onSwitchedState?.call(isExpanded);
  }

  @override
  Widget build(BuildContext context) {
    final width = widget.expandedWidth ?? MediaQuery.sizeOf(context).width;
    return Column(
      children: [
        AnimatedContainer(
          duration: widget.duration,
          height: widget.height,
          width: isExpanded ? width : 40,
          child: showSearchIcon && !isExpanded 
              ? IconButton(
                  onPressed: switchState,
                  icon: widget.icon,
                )
              : TextField(
                  controller: widget.controller,
                  focusNode: widget.focusNode,
                  keyboardType: widget.keyboardType,
                  textInputAction: widget.textInputAction,
                  style: widget.style,
                  textAlign: widget.textAlign,
                  readOnly: widget.readOnly,
                  obscureText: widget.obscureText,
                  obscuringCharacter: widget.obscuringCharacter,
                  autocorrect: widget.autocorrect,
                  onChanged: widget.onChanged,
                  onEditingComplete: widget.onEditingComplete,
                  onSubmitted: widget.onSubmitted,
                  inputFormatters: widget.inputFormatters,
                  enabled: widget.enabled,
                  cursorWidth: widget.cursorWidth,
                  cursorColor: widget.cursorColor,
                  autofillHints: widget.autofillHints,
                  decoration: InputDecoration(
                    prefixIcon: IconButton(
                      onPressed: switchState,
                      icon: widget.prefixIcon,
                    ),
                    suffixIcon: IconButton(
                      onPressed: switchState,
                      icon: widget.suffixIcon,
                    ),
                    hintText: widget.hintText,
                    labelText: widget.labelText,
                    border: widget.border,
                    enabledBorder: widget.enabledBorder,
                    focusedBorder: widget.focusedBorder,
                    errorBorder: widget.errorBorder,
                    focusedErrorBorder: widget.focusedErrorBorder,
                    contentPadding: widget.contentPadding,
                  )
              )
        ),
      ],
    );
  }
}
