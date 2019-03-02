# frozen_string_literal: true

json.array! @follows, partial: 'follows/follow', as: :follow
