import 'package:flutter/material.dart';
import 'package:gql_dio_link/gql_dio_link.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import "package:dio/dio.dart";
import "package:gql_link/gql_link.dart";
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:squeeze/app/core/constant/app_constants.dart';

class Client {
  static Dio dio = Dio();
  static Link? link;

  static ValueNotifier<GraphQLClient> getClient() {
    var cookieJar = CookieJar();
    dio.interceptors.add(CookieManager(cookieJar));

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
