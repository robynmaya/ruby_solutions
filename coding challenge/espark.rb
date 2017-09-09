require 'sinatra'
load 'study_plan.rb'

get '/' do
  puts final_csv
end
