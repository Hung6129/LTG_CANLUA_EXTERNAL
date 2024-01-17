import 'dart:io';

import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:path_provider/path_provider.dart';

// class CacheInterceptor extends Interceptor {
//   CacheInterceptor();

//   final _cache = <Uri, Response>{};

//   @override
//   void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
//     var response = _cache[options.uri];
//     if (options.extra['refresh'] == true) {
//       print('${options.uri}: force refresh, ignore cache! \n');
//       return handler.next(options);
//     } else if (response != null) {
//       print('cache hit: ${options.uri} \n');
//       return handler.resolve(response);
//     }
//     super.onRequest(options, handler);
//   }

//   @override
//   void onResponse(Response response, ResponseInterceptorHandler handler) {
//     _cache[response.requestOptions.uri] = response;
//     super.onResponse(response, handler);
//   }

//   @override
//   void onError(DioError err, ErrorInterceptorHandler handler) {
//     print('onError: $err');
//     super.onError(err, handler);
//   }
// }

// Global options

Future<CacheOptions> getCacheOption({CachePolicy? policy}) async {
  Directory tempDir = await getTemporaryDirectory();
  return CacheOptions(
    // A default store is required for interceptor.
    // store: MemCacheStore(),
    store: HiveCacheStore(tempDir.path),

    // All subsequent fields are optional.

    // Default.
    policy: CachePolicy.refresh,
    // Returns a cached response on error but for statuses 401 & 403.
    // Also allows to return a cached response on network errors (e.g. offline usage).
    // Defaults to [null].
    hitCacheOnErrorExcept: [401, 403],
    // Overrides any HTTP directive to delete entry past this duration.
    // Useful only when origin server has no cache config or custom behaviour is desired.
    // Defaults to [null].
    maxStale: const Duration(days: 7),
    // Default. Allows 3 cache sets and ease cleanup.
    priority: CachePriority.normal,
    // Default. Body and headers encryption with your own algorithm.
    cipher: null,
    // Default. Key builder to retrieve requests.
    keyBuilder: CacheOptions.defaultCacheKeyBuilder,
    // Default. Allows to cache POST requests.
    // Overriding [keyBuilder] is strongly recommended when [true].
    allowPostMethod: false,
  );
}
