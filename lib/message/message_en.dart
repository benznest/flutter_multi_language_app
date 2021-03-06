import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

class MessageLookupEn extends MessageLookupByLibrary {
  get localeName => 'en';

  final messages = {
    "hello": () => "Hello",
    "your_locale": () =>"Your locale is",
    "total_items": (count) => totalItems(count),
  };

  static totalItems(int count) {
    String unit = Intl.plural(count, zero: "item", one: "item", other: "items");
    return "Total $count $unit.";
  }
}
