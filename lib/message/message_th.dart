import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

class MessageLookupTh extends MessageLookupByLibrary {
  get localeName => 'th';

  final messages = {
    "hello": MessageLookupByLibrary.simpleMessage("สวัสดี"),
    "your_locale": MessageLookupByLibrary.simpleMessage("ที่อยู่ของคุณคือ"),
    "total_items": (count) => totalItems(count),
  };

  static totalItems(int count) {
    String unit = Intl.plural(count, zero: "รายการ", one: "รายการ", other: "รายการ");
    return "ทั้งหมด $count $unit.";
  }

}