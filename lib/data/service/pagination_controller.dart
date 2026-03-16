import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';

class PaginatedScrollViewController extends ScrollController {
  /// handle data fetching and must return true if has more data.
  /// null if request failed and page must be unchanged
  Future<bool?> Function(int page)? onPageRequest;

  void Function(bool isFetching)? onFetchStatusChanged;

  void Function(bool canFetch)? onCanFetchStatusChanged;

  /// debounce fetch request for rapid scroll movement
  Duration debouceInterval;

  int page;

  PaginatedScrollViewController({
    this.onPageRequest,
    this.debouceInterval = const Duration(milliseconds: 300),

    /// initial page to fetch the request. default to 1
    int initialPage = 1,
  })  : assert(initialPage > 0, "initial page must be non-negative number"),
        page = initialPage {
    addListener(_handleScroll);
  }

  Future<void> fetch() async => await _onFetch();

  void reset() {
    page = 1;
    _hasMore = true;
    onCanFetchStatusChanged?.call(true);
  }

  bool _hasMore = true;
  bool get hasMore => _hasMore;

  void _handleScroll() {
    if(!_hasMore) return;
    if (!hasClients || onPageRequest == null) return;

    if (offset >= position.maxScrollExtent - 100 && !position.outOfRange) {
      onFetchStatusChanged?.call(true);
      EasyDebounce.debounce(
        "$hashCode",
        debouceInterval,
        _onFetch,
      );
    }
  }

  Future<void> _onFetch() async {
    if (!_hasMore) return;

    onFetchStatusChanged?.call(true);
    final hasMore = await onPageRequest!(page);
    onFetchStatusChanged?.call(false);

    if (hasMore == null) return;

    if (_hasMore != hasMore) onCanFetchStatusChanged?.call(hasMore);
    _hasMore = hasMore;

    if (_hasMore) page++;
  }
}