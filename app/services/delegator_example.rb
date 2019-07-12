class UserDecorator < SimpleDelegator
  require 'delegate'
  User = Struct.new(:first_name, :last_name)
  def fullname
    "#{firstname} #{lastname}"
    end


              

