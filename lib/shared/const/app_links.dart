class ApiEndpoints {
  static const String baseUrl = 'http://167.71.92.176:8000';
  // Authentication Endpoints URL
  static const String login = '$baseUrl/auth/login/';
  static const String register = '$baseUrl/auth/register/';
  static const String changePassword = '$baseUrl/auth/change-password/';
  static const String resetPassword = '$baseUrl/auth/reset-password/';

// // Explore Endpoints URL
  static const String getAllPosts = '$baseUrl/explore/posts/?page_size=28';

  static String getSearchPostsByUserName(final String query) => '$baseUrl/explore/search/user-posts/?page_size=40&q=$query';

  //static String forYouPostSearch(String query) => '$baseUrl/explore/search/user-posts/?q=$query';

  static String getTrendingHashtags(final String query) => '$baseUrl/explore/search/hashtag/?q=$query';
  static String getLocationSearch(final String query) => '$baseUrl/explore/search/location/?q=$query';
  static String getUserSearch(final String query) => '$baseUrl/explore/search/user/?q=$query';

  // Profile Endpoints URL
  static const String allProfiles = '$baseUrl/profile/';
  static String profileId(final int id) => '$baseUrl/profile/$id/';

  // Posts Endpoints URL
  static const String allPosts = '$baseUrl/posts/all-posts/';
  static const String addPost = '$baseUrl/posts/create/';
  static String addComment(final int id) => '$baseUrl/posts/$id/comments/';
  static String toggleLikePost(final int id) => '$baseUrl/posts/$id/like/';
  static String getPost(final int id) => '$baseUrl/posts/$id/';
  static String deletePost(final int id) => '$baseUrl/posts/$id/';
  static String updatePost(final int id) => '$baseUrl/posts/$id/';
  static String likeComments(final int id) => '$baseUrl/posts/comments/$id/like';
  static String allPostsUser(final int id) => '$baseUrl/posts/$id/posts/';

  // Notifications Endoipoints URL
  static String allNotifications(final int id) => '$baseUrl/notifications/all/';

  // static const String allPosts = '$baseUrl/posts/all-posts/';
  static String? Nextpage = allPosts;

  static String getnext(final int id) => '$baseUrl//posts/all-posts/?page=$id';
  static void setnext(final String id) {
    Nextpage = id;
  }
}
