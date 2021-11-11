class WID {
  int id;
  String group_name;
  String sub_county;
  String parish;
  late String gd_formed;
  int num_members;
  int times_shared_out;
  double share_value;
  int num_children;
  double amnt_highest_saver;
  double amnt_saved;
  double amnt_social_fund;
  double amnt_loans_taken;
  int num_loans_accessed;
  num loan_repayment;
  double amnt_loans_writtenoff;
  WID(
    this.id,
    this.group_name,
    this.sub_county,
    this.parish,
    this.num_members,
    this.times_shared_out,
    this.share_value,
    this.num_children,
    this.amnt_highest_saver,
    this.amnt_saved,
    this.amnt_social_fund,
    this.amnt_loans_taken,
    this.num_loans_accessed,
    this.loan_repayment,
    this.amnt_loans_writtenoff,
  );
}
