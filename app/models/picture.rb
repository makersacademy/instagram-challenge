class Picture < ApplicationRecord
  has_attached_file :image,
    styles: { thumb: '300x300>' },
    storage: :s3,
    s3_credentials: {
      bucket: 'bens-instagram-clone',
      access_key_id: Rails.application.secrets.s3_secret_access_key,
      secret_access_key: Rails.application.secrets.s3_secret_key
    }
end
