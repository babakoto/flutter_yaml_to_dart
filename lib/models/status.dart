// ⚠️ This file is auto-generated. Do not edit.

enum Status {
  activeFile,
  inactiveFile,
  archivedFile,
  deletedFile;

  bool get isActiveFile => this == Status.activeFile;
  bool get isInactiveFile => this == Status.inactiveFile;
  bool get isArchivedFile => this == Status.archivedFile;
  bool get isDeletedFile => this == Status.deletedFile;

 static Status fromMap(Map<String,dynamic> json){
  switch(json['status_file']) {
    case 'active_file':
      return Status.activeFile;
    case 'inactive_file':
      return Status.inactiveFile;
    case 'archived_file':
      return Status.archivedFile;
    case 'deleted_file':
      return Status.deletedFile;
    default:
      throw Exception('Invalid value for status_file');
  }
}
}

