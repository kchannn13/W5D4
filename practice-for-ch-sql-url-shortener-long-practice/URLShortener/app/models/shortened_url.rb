class ShortenedUrl < ApplicationRecord
    validates :short_url, presence: true, uniqueness: true

    def self.random_code
        random = SecureRandom.urlsafe_base64

        until !ShortenedUrl.exists?(short_url: random)
            random = SecureRandom.urlsafe_base64
        end
        random
    end

    after_initialize do |shortened_url|
        generate_short_url
    end
end