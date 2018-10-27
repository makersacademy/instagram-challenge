# RSpec.describe User, type: :model do
#
#   describe "#self.from_omniauth" do
#     it "creates or updates a user from google_oauth2 hash" do
#       auth = {
#         provider: "google",
#         uid: "12345678910",
#         info: {
#           email: "test@email.com",
#           first_name: "Miss",
#           last_name: "Tester"
#         },
#         credentials: {
#         token: "abcdefg12345",
#         refresh_token: "12345abcdefg",
#         expires_at: DateTime.now
#         }
#       }
#       User.from_omniauth(auth)
#       new_user = User.first
#       expect(new_user.provider).to eq("google")
#     end
#   end
#
# end
