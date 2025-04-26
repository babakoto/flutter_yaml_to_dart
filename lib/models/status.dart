// ⚠️ This file is auto-generated. Do not edit.

enum Status {
  activeFile,
  inactive;

  bool get isActiveFile => this == Status.activeFile;
  bool get isInactive => this == Status.inactive;

 static Status fromMap(Map<String,dynamic> json){
  switch(json['status']) {
    case 'active-file':
      return Status.activeFile;
    case 'inactive':
      return Status.inactive;
    default:
      throw Exception('Invalid value for status');
  }
}
}

