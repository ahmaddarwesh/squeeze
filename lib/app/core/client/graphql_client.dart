import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gql_dio_link/gql_dio_link.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import "package:dio/dio.dart";
import "package:gql_link/gql_link.dart";
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:squeeze/app/core/constant/app_constants.dart';
import 'package:squeeze/app/core/logger/logger.dart';

class Client {
  Dio dio = Dio();
  Link? link;

  ValueNotifier<GraphQLClient> getClient() {
    var cookieJar = CookieJar();
    dio.interceptors.add(CookieManager(cookieJar));
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        var data = await cookieJar.loadForRequest(Uri.parse(GQL_LINK));
        l(verbose: "Request: " + options.data.toString());

        return handler.next(options);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
      onError: (DioError e, handler) {
        return handler.next(e);
      },
    ));

    link = Link.from([
      DioLink(GQL_LINK, client: dio),
    ]);

    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        link: link!,
        // The default store is the InMemoryStore, which does NOT persist to disk

        cache: GraphQLCache(store: HiveStore()),
      ),
    );
    return client;
  }
}

printDioError(DioError dioError) {
  if (dioError.response != null) {
    l(error: json.encode(dioError.response!.data!));
    l(error: dioError.response!.statusMessage);
  } else {
    l(error: dioError.message);
    l(error: dioError.error);
  }
}
