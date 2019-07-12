require 'test_helper'

class QboChartTest < ActiveJob::TestCase
  test "can interpret result from qbd" do
    response = [{"xml_attributes"=>{"statusCode"=>"0", "statusSeverity"=>"Info", "statusMessage"=>"Status OK"}, "account_ret"=>{"xml_attributes"=>{}, "list_id"=>"8000004C-1562877248", "time_created"=>"2019-07-11T16:34:08-05:00", "time_modified"=>"2019-07-11T16:34:08-05:00", "edit_sequence"=>"1562877248", "name"=>"nmsBank3", "full_name"=>"nmsBank3", "is_active"=>true, "sublevel"=>0, "account_type"=>"Bank", "balance"=>0.0, "total_balance"=>0.0, "cash_flow_classification"=>"NotApplicable"}}, {"xml_attributes"=>{"statusCode"=>"0", "statusSeverity"=>"Info", "statusMessage"=>"Status OK"}, "account_ret"=>{"xml_attributes"=>{}, "list_id"=>"8000004D-1562877248", "time_created"=>"2019-07-11T16:34:08-05:00", "time_modified"=>"2019-07-11T16:34:08-05:00", "edit_sequence"=>"1562877248", "name"=>"nmsInco3", "full_name"=>"nmsInco3", "is_active"=>true, "sublevel"=>0, "account_type"=>"Income", "balance"=>0.0, "total_balance"=>0.0, "cash_flow_classification"=>"None"}}]
    worker = ExportCoaWorker.new
    r0 = response[0]
    puts "r0: #{r0}"
    r0_account_ret = r0["account_ret"]
    puts "r0_account_ret: #{r0_account_ret}"

    puts r0_account_ret
    list_id = r0_account_ret["list_id"]
    puts "list_id: #{list_id}"
    res = worker.handle_response(response, ' ', ' ', ' ', ' ')
    puts QbCoa.last.inspect
  end
end


