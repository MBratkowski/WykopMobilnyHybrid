import 'package:owmflutter/store/store.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:redux/redux.dart';
import 'package:redux/redux.dart';
import 'package:owmflutter/api/normalizers.dart';
import 'package:owmflutter/store/store.dart';

class SetEntryAction {
  final List<int> ids;
  final String screenId;
  SetEntryAction({this.screenId, this.ids});
}

ThunkAction<AppState> loadEntry(String screenId, int entryId) {
  return (Store<AppState> store) async {
    var entry = await api.getEntry(entryId);
    var result = normalizeEntry(entry);
    
    store.dispatch(AddEntitiesAction(entities: result.state));
    store.dispatch(SetEntryAction(ids: result.result, screenId: screenId));
  };
}