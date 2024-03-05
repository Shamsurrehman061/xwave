abstract class BaseNetwork{

  dynamic getApi(var url, var header);
  dynamic getPost(var url, var body);
  dynamic getPosthWithHeader(var url, var body, var header);
  dynamic getPosthWithMultipart(var url, var body);


}