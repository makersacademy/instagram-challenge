require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the PostsHelper. For example:
#
# describe PostsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe PostsHelper, type: :helper do
  context "#format_time"
  it "times less than an hour ago should be formatted as 'xx minutes ago'" do
    time = (Time.now - 120).to_s
    expect(format_time(time)).to eq "2 minutes ago"
  end
  it "minutes should be singular if exactly one minute" do
    time = (Time.now - 60).to_s
    expect(format_time(time)).to eq "1 minute ago"
  end
  it "posts less than a minute ago should say less than a minute ago" do
    time = (Time.now - 59).to_s
    expect(format_time(time)).to eq "Less than a minute ago"
  end
  it "posts more than an hour and less than a day ago should say xxh" do
    time = (Time.now - 3602).to_s
    expect(format_time(time)).to eq "1h"
  end
  it "posts more than a day and less than a week ago should say 'xxd'" do
    time = (Time.now - 172802).to_s
    expect(format_time(time)).to eq "2d"
  end
  it "posts more than a week ago should say 'xxw'" do
    time = (Time.now - 604800).to_s
    expect(format_time(time)).to eq "1w"
  end
end
