require 'rails_helper'

RSpec.describe SnapsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/snaps').to route_to('snaps#index')
    end

    it 'routes to #new' do
      expect(get: '/snaps/new').to route_to('snaps#new')
    end

    it 'routes to #show' do
      expect(get: '/snaps/1').to route_to('snaps#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/snaps/1/edit').to route_to('snaps#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/snaps').to route_to('snaps#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/snaps/1').to route_to('snaps#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/snaps/1').to route_to('snaps#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/snaps/1').to route_to('snaps#destroy', id: '1')
    end
  end
end
