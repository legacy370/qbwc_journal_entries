require 'test_helper'

class JournalEntryTest < ActiveJob::TestCase
  test "can format je request" do
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
    worker = AddJournalEntriesWorker.new
    res = worker.build_journal_entry_hash(journal_entries)
    puts res
  end
end

