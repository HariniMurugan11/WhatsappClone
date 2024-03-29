class ChatModel {
  String name;
  String time;
  String icon;
  bool isGroup;
  String currentMsg;
  String status;
  bool select;
  ChatModel(
      {this.name = 'Default',
      this.time = 'Default',
      this.icon = 'Default',
      this.isGroup = false,
      this.currentMsg = 'Default',
      this.status = 'Default',
      this.select = false
      });
}
