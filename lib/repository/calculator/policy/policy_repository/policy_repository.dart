import 'package:mobile_nsk/models/policy/archive_policy.dart';
import 'package:mobile_nsk/models/policy/policy_entries.dart';

import 'policy_provider.dart';
class PolicyRepository {
  final PolicyProvider _osagoProvider= PolicyProvider();
  Future ogpoCalculate(Policy policie, String validFrom, String validTill) => _osagoProvider.calculateOgpo(policie, validFrom, validTill);
  Future kaskoExpressWrite(Policy policie, int amountId) => _osagoProvider.writeKaskoExpress(policie, amountId);

  Future policyWrite(Policy policyEntries)=> _osagoProvider.writeOgpo(policyEntries);
  Future getInsuranceAmount()=> _osagoProvider.getInsuranceAmount();

  Future getMyActivePolicy() => _osagoProvider.getMyActivePolicy();
  Future<ArchivePolicy> getMyExpiredPolicy() => _osagoProvider.getMyExpiredPolicy();
}