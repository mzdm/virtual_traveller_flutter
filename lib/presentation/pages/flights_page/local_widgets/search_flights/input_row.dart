import 'package:flutter/material.dart';
import 'package:virtual_traveller_flutter/utils/theme_utils.dart';

enum _Type { text, dateTime, counter }

class InputRow extends StatelessWidget {
  InputRow({
    Key key,
    this.icon,
    @required this.label,
    @required this.inputLabels,
    @required this.inputHintTexts,
  })  : type = _Type.text,
        assert(label != null),
        assert(inputLabels != null),
        assert(inputHintTexts != null),
        super(key: key);

  InputRow.date({
    Key key,
    this.icon,
    @required this.label,
    @required this.inputLabels,
    @required this.inputHintTexts,
  })  : type = _Type.dateTime,
        assert(label != null),
        assert(inputLabels != null),
        assert(inputHintTexts != null),
        super(key: key);

  InputRow.counter({
    Key key,
    this.icon,
    @required this.label,
    @required this.inputLabels,
    @required this.inputHintTexts,
  })  : type = _Type.counter,
        assert(label != null),
        assert(inputLabels != null),
        assert(inputHintTexts != null),
        super(key: key);

  final _Type type;
  final IconData icon;
  final String label;
  final List<String> inputLabels;
  final List<String> inputHintTexts;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: Colors.black.withOpacity(0.45),
          size: 26.0,
        ),
        SizedBox(width: 8.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 15.0),
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: buildInputBox(
                      context,
                      isCounter: type == _Type.counter,
                      inputLabel: inputLabels[0],
                      inputHintText: inputHintTexts[0],
                    ),
                  ),
                  SizedBox(width: 12.0),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: buildInputBox(
                      context,
                      isCounter: type == _Type.counter,
                      inputLabel: inputLabels[1],
                      inputHintText: inputHintTexts[1],
                    ),
                  ),
                  if (type == _Type.counter && inputLabels.length == 3) ...[
                    SizedBox(width: 12.0),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: buildInputBox(
                        context,
                        isCounter: true,
                        inputLabel: inputLabels[2],
                        inputHintText: inputHintTexts[2],
                      ),
                    ),
                  ]
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildInputBox(
    BuildContext context, {
    bool isCounter = false,
    @required String inputLabel,
    @required String inputHintText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(inputLabel),
        SizedBox(height: 8.0),
        Container(
          width: double.infinity,
          padding: !isCounter ? const EdgeInsets.all(10.0) : const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey[900].withOpacity(0.25),
            ),
          ),
          child: !isCounter
              ? Text(
                  inputHintText,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                )
              : Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: SizedBox(
                        height: 26.0,
                        child: RaisedButton(
                          highlightElevation: 0.0,
                          elevation: 0.0,
                          padding: EdgeInsets.all(0.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.lerp(
                              BorderRadius.circular(5.0),
                              BorderRadius.circular(10.0),
                              0.2,
                            ),
                          ),
                          onPressed: () {},
                          color: ColorUtils.secondaryDefaultColorLightOrange,
                          child: Icon(
                            Icons.remove,
                            color: Colors.white,
                            size: 18.0,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Center(
                        child: Text(
                          inputHintText,
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: SizedBox(
                        height: 26.0,
                        child: RaisedButton(
                          highlightElevation: 0.0,
                          padding: EdgeInsets.all(0.0),
                          elevation: 0.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.lerp(
                              BorderRadius.circular(5.0),
                              BorderRadius.circular(10.0),
                              0.15,
                            ),
                          ),
                          onPressed: () {},
                          color: ColorUtils.secondaryDefaultColorLightOrange,
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 18.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ],
    );
  }
}
