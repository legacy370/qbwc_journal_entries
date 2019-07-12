class AddJournalEntriesQbdJob < ApplicationJob
  queue_as :default

  def perform(jes)
    journal_entries = [
      {dr_or_cr: 'dr',
       txn_date: '2019-07-10',
       full_name: 'nmsBank4',
       amount: 123.45
      },
      {dr_or_cr: 'cr',
       txn_date: '2019-07-10',
       full_name: 'nmsInco4',
       amount: 123.45
      }
    ]
    QBWC.add_job(:add_journal_entries, true, '', AddJournalEntriesWorker, nil, journal_entries)
  end
end
