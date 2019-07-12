require 'qbwc'

class AddJournalEntriesWorker < QBWC::Worker
  def requests(_job, _session, data_array)
   #the_add_request = build_journal_entry_hash(data_array)
    #puts "the add request: #{the_add_request}"
    {
      journal_entry_add_rq: {
        journal_entry_add: {
          txn_date: '2019-07-02',
          journal_debit_line: {
            account_ref: {
              full_name: 'Operating Funds:Undeposited cash'
            },
            amount: '301.00'
          },
          journal_credit_line: {
            account_ref: {
              full_name: 'nmsInco4'
            },
            amount: '301.00'
          }
        }
      }
    }
    #Supposedly we can pass in a string.  Not working.
    #string_request = ""
    #string_request << "{journal_entry_add_rq: {journal_entry_add: {"
    #string_request << "txn_date: '2019-07-02', journal_debit_line: {"
    #string_request << "account_ref: { full_name: 'nmsBank4' }, amount: 234.56 },"
    #string_request << "journal_credit_line: { account_ref: { full_name: 'nmsInco4' },"
    #string_request << "amount: 234.56 } } } }" 
  end

  def handle_response(response, session, job, request, _data)
    byebug
    if response.is_a? Array
      my_response = response
    else
      my_response = [response]
    end
    QBWC.delete_job(job)
  end

  def build_journal_entry_hash(data_array)
    journal_line = Array.new
    my_entry = {}
    temp_array = []
    type_of_line = ""
    data_array.each do |data|
      if data[:dr_or_cr] == "dr"
        type_of_line = "journal_debit_line"
      else
        type_of_line = "journal_credit_line"
      end
      jad = {journal_entry_add: {
              txn_date: data[:txn_date],
              "#{type_of_line}": {
                account_ref: {
                  full_name: data[:full_name]
                },
              amount: data[:amount]
              }
            }
      }
      journal_lines << jad
    end
    return journal_lines
  end

  def build_debit_hash (data)
    @line_id += 1
    item = {
      journal_entry_add: {
        txn_date: data[:txn_date],
        journal_debit_line: {
          account_ref: {
            full_name: data[:full_name]
          },
          amount: data[:amount]
        }
      }
    }
    return item
  end
  def build_credit_hash (data)
    @line_id += 1
    item = {
      journal_entry_add: {
        txn_date: data[:txn_date],
        journal_credit_line: {
          account_ref: {
            full_name: data[:full_name]
          },
          amount: data[:amount]
        }
      }
    }
    return item
  end
end
