class ImportQbdAccountsJob < ApplicationJob
  queue_as :default

  def perform()
    QBWC.add_job(:import_coa, true, '', ImportCoaWorker, nil, nil)
  end
end
