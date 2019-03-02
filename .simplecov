SimpleCov.start 'rails' do
  add_filter '/bin/'
  add_filter '/db/'
  add_filter '/spec/' # for rspec
  add_filter '/test/' # for minitest
  add_filter '/app/channels/'
  add_filter '/app/mailers/'
  add_filter '/app/jobs'
end
