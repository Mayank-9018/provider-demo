# Provider Demo App

__For better understanding State Mangement, watch this video on [Pragmatic State Mangement at Google IO 2019](https://www.youtube.com/watch?v=d_m5csmrf7I) by Matt Sullivan and Filip Hracek.__

A simple example of using [provider](https://pub.dev/packages/provider) for moving between screens.
## Layout
The App consists of three screens defines inisde the `pages/` subdirectory and each page is just a blank container with color and these pages can be switched between with the help of `BottomNavigationBar`.
## Key Terms:
**ChangeNotifier:** Is extended by a class and provides change notifications to listeners.

**ChangeNotifierProvider:** Listens for changes from a ChangeNotifier. Widgets below it can access the state object(created using the `create` property) and listen to state changes.

**Consumer:** Consumes the _Provider_ and listens to changes. Wrapped around part of the widget tree which gets rebuilt from change notification provided by the ChangeNotifier.

**Provider.of\<T>(context)** is used when you want to access the State object but not listen to changes.

## Working

The `MaterialApp` is wrapped inside `ChangeNotifierProvider` and an instance on `PageManager` is available throughout the app which can be accessed by either a `Consumer<PageManager>` or `Provider.of<PageManager>(context)`.

The `Scaffold` is wrapped inside a `Consumer<PageManager>` and on change notifications from `PageManager` the `Scaffold` gets rebuilt.

On clicking an item in the `BottomNavigationBar`, the `changePage(int n)` method of `PageManager` is called which chages the `_activePage` and notifies the listeners(`Scaffold` in this case).