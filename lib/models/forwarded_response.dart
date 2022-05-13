import 'dart:convert';

class Forward {
  final Map<String, dynamic> body;
  final Map<String, dynamic> head;
  final int status;

  Forward(this.body, this.head, this.status);
}

class ForwardResponse {
  final String source;
  final Forward forward;
  dynamic data;

  ForwardResponse(this.source, this.forward, this.data);
  // {
  //   if (data != null) {
  //     this.data = jsonDecode(data);
  //   }
  // }

  static ForwardResponse from(res) {
    final body = jsonDecode(res.body);
    final fwd = body['forward'];
    final forwardObj = Forward(fwd['body'], fwd['head'], fwd['status']);
    return ForwardResponse(body['from'], forwardObj, body['data']);
  }
}
