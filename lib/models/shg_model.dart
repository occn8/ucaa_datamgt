class SHG {
  int id;
  String shg_name;
  String location;
  String shg_formed;
  int num_member;
  int per_attendance_wk;
  int num_children;
  double wk_savings;
  double wk_saving_per_member;
  double total_saving;
  double shg_funds;
  double amount_loan_taken;
  int num_loans_accessed;
  num loan_repayment;
  String loan_saving_ratio;

  SHG(
    this.id,
    this.shg_name,
    this.location,
    this.shg_formed,
    this.num_member,
    this.per_attendance_wk,
    this.num_children,
    this.wk_savings,
    this.wk_saving_per_member,
    this.total_saving,
    this.shg_funds,
    this.amount_loan_taken,
    this.num_loans_accessed,
    this.loan_repayment,
    this.loan_saving_ratio,
  );
}
