import 'package:flutter/material.dart';
import 'package:mobile_nsk/pages/widgets/nsk_text.dart';

class NskDatePicker extends StatelessWidget {
  final void Function()? onStartTap;
  final void Function()? onEndTap;
  final void Function()? onTap;
  final String? start;
  final String? end;
  final int? interval;
  const NskDatePicker(
      {Key? key,
      this.onStartTap,
      this.onEndTap,
      this.onTap,
      this.start,
      this.end,
      this.interval})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 24, left: 15, right: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xffCDDAF9))),
        child: Container(
          margin: const EdgeInsets.all(15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: onStartTap,
                child: Row(
                  children: [
                    const Icon(
                      Icons.calendar_today_outlined,
                      color: Color(0xff2D60E2),
                    ),
                    const Spacer(),
                    Expanded(
                      flex: 10,
                      child: Text(
                        start.toString(),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  const Spacer(),
                  const Expanded(
                    flex: 6,
                    child:  Divider(
                      color: Colors.grey,
                    ),
                  ),
                  interval == null
                      ? const SizedBox()
                      : Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xffCDDAF9)),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: NskText('$interval дней'),
                        ),
                  // Spacer(),
                ],
              ),
              InkWell(
                onTap: onEndTap,
                child: Row(
                  children: [
                    const Icon(
                      Icons.calendar_today_outlined,
                      color: Color(0xff2D60E2),
                    ),
                    const Spacer(),
                    Expanded(
                      flex: 10,
                      child: Text(
                        end.toString(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
