require 'qbwc'

class ExportCoaWorker < QBWC::Worker
  def requests(_job, _session, data_array)
    { account_add_rq: build_account_add_hash(data_array) }
  end

  def handle_response(response, session, job, request, _data)
    byebug
    if response.is_a? Array
      accounts = response
    else
      accounts = [response]
    end
    accounts.each do |account|
      account_ret = account["account_ret"]
      qb_coa = QbCoa.find_or_create_by(
        qb_list_id: account_ret['list_id'],
        edit_sequence: account_ret['edit_sequence'],
        name: account_ret['name'],
        full_name: account_ret['full_name'],
        account_type: account_ret['account_type']
      )
    end
    QBWC.delete_job(job)
  end

  def build_account_add_hash(data_array)
    temp_array = []
    data_array.each do |data|
      temp_array << {
        account_add: {
          name: data[:name],
          is_active: data[:is_active],
          account_type: data[:account_type],
        }
      }
    end
    temp_array
  end
end
