# frozen_string_literal: true

# app/workers/import_coa_worker.rb
# Imports the chart of accounts from QuickBooks desktop,
# and populates a local table with pertinent details.
class ImportCoaWorker < QBWC::Worker
  def requests(_job, _session, _data_array)
    { account_query_rq: {} }
  end

  def handle_response(response, _session, job, _request, _data)
    gl_accounts = response['account_ret'].present? ? response['account_ret'] : []
    QbCoa.delete_all if gl_accounts.size > 10
    gl_accounts.each do |gl_account|
      handle_chart_record(gl_account)
    end
    QBWC.delete_job(job)
  end

  def handle_chart_record(gl_account)
    QbCoa.find_or_create_by(
      qb_list_id: gl_account['list_id'],
      edit_sequence: gl_account['edit_sequence'],
      name: gl_account['name'],
      full_name: gl_account['full_name'],
      account_type: gl_account['account_type'],
      is_active: gl_account['is_active']
    )
  end
end
