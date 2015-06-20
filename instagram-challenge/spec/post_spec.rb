describe Post, type: :model do
	it{should have_many(:likes).dependent(:destroy)}

	it 'is invalid if the caption is longer than 40 characters' do
		over_40_chars = "123456789012345678901234567890123456789012345"
		expect(Post.new(caption: over_40_chars)).to have(1).error_on(:caption)
	end
end