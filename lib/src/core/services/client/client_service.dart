abstract interface class ClientService {
  Future get(String url, {bool requiresAuth, String contentType});
  Future post(String url, Object data, {bool requiresAuth, String contentType});
  Future put(String url, Object data, {bool requiresAuth, String contentType});
}
