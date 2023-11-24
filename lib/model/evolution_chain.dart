import '../ui/model/ui_chain_entry.dart';
import 'loadable.dart';

class EvolutionChain extends Loadable {
  EvolutionChain({
    required int id,
    required this.chains,
    bool fromDB = false
  }) : super(id, fromDB);

  List<List<UiChainEntry>> chains;
}