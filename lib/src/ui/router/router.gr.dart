// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    PostListingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PostListingScreen(),
      );
    },
    PostRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<PostRouteArgs>(
          orElse: () => PostRouteArgs(id: pathParams.optInt('id')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PostScreen(
          key: args.key,
          id: args.id,
        ),
      );
    },
  };
}

/// generated route for
/// [PostListingScreen]
class PostListingRoute extends PageRouteInfo<void> {
  const PostListingRoute({List<PageRouteInfo>? children})
      : super(
          PostListingRoute.name,
          initialChildren: children,
        );

  static const String name = 'PostListingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PostScreen]
class PostRoute extends PageRouteInfo<PostRouteArgs> {
  PostRoute({
    Key? key,
    int? id,
    List<PageRouteInfo>? children,
  }) : super(
          PostRoute.name,
          args: PostRouteArgs(
            key: key,
            id: id,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'PostRoute';

  static const PageInfo<PostRouteArgs> page = PageInfo<PostRouteArgs>(name);
}

class PostRouteArgs {
  const PostRouteArgs({
    this.key,
    this.id,
  });

  final Key? key;

  final int? id;

  @override
  String toString() {
    return 'PostRouteArgs{key: $key, id: $id}';
  }
}
