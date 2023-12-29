import 'package:floor/floor.dart';

import '../model/evolution_chain_entity.dart';

@dao
abstract class EvolutionChainDao {
  @Query("SELECT * FROM evolution_chain WHERE c_id = :id")
  Future<List<EvolutionChainEntity>> findById(int id);

  @Insert(onConflict: OnConflictStrategy.ignore)
  Future<void> insertEvolutionChain(EvolutionChainEntity chain);
}