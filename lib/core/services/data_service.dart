abstract class DataServic {
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      String? documentId});
  Future<Map<String, dynamic>?> getData({
    required String path,
    String? documentId,
  });
  Future<bool> chekIfDataExists(
    {required String path, required String documentId}
  );
}
