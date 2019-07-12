class ExportQbdAccountsJob < ApplicationJob
  queue_as :default

  def perform(coas)
    coas = [{name: 'nmsBank4', is_active: true, account_type: 'Bank'},
            {name: 'nmsInco4', is_active: true, account_type: 'Income'}]
    QBWC.add_job(:export_coa, true, '', ExportCoaWorker, nil, coas)
  end
end
