import 'package:flutter_forms/src/annotations/index.dart';
import 'package:queries/collections.dart';

class Rules {
  static String email = r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$';

  // From Diego Perini on https://gist.github.com/dperini/729294
  static String url(List<EUrlProtocol> protocols) {
    String allowedProtocols = Collection(protocols)
        .select((arg1) => arg1.toString().split('.')[1])
        .toList()
        .join('|');

    String url = "^";

    // protocol identifier (optional)
    // short syntax // still required
    url += "(?:(?:(?:$allowedProtocols):)?\\/\\/)";

    // user:pass BasicAuth (optional)
    url += "(?:\\S+(?::\\S*)?@)?";
    url += "(?:";

    // IP address exclusion
    // private & local networks
    url += "(?!(?:10|127)(?:\\.\\d{1,3}){3})" +
        "(?!(?:169\\.254|192\\.168)(?:\\.\\d{1,3}){2})" +
        "(?!172\\.(?:1[6-9]|2\\d|3[0-1])(?:\\.\\d{1,3}){2})";

    // IP address dotted notation octets
    // excludes loopback network 0.0.0.0
    // excludes reserved space >= 224.0.0.0
    // excludes network & broadcast addresses
    // (first & last IP address of each class)
    url += "(?:[1-9]\\d?|1\\d\\d|2[01]\\d|22[0-3])" +
        "(?:\\.(?:1?\\d{1,2}|2[0-4]\\d|25[0-5])){2}" +
        "(?:\\.(?:[1-9]\\d?|1\\d\\d|2[0-4]\\d|25[0-4]))" +
        "|" +
        // host & domain names, may end with dot
        // can be replaced by a shortest alternative
        // (?![-_])(?:[-\\w\\u00a1-\\uffff]{0,63}[^-_]\\.)+
        "(?:" +
        "(?:" +
        "[a-z0-9\\u00a1-\\uffff]" +
        "[a-z0-9\\u00a1-\\uffff_-]{0,62}" +
        ")?" +
        "[a-z0-9\\u00a1-\\uffff]\\." +
        ")+" +
        // TLD identifier name, may end with dot
        "(?:[a-z\\u00a1-\\uffff]{2,}\\.?)" +
        ")";

    // port number (optional)
    url += "(?::\\d{2,5})?";

    // resource path (optional)
    url += "(?:[/?#]\\S*)?" + r"$";

    return url;
  }
}
