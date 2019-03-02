# frozen_string_literal: true

json.array! @resources, partial: 'resources/resource', as: :resource
