class BaseCommand
  attr_reader :result

  def self.call(*args)
    new(*args).call
  end

  def call
    @result = nil
    payload
    self
  end

  def success?
    errors.empty?
  end

  def errors
    @errors ||= []
  end

  private

  def initialize(*_)
    not_implemented
  end

  def payload
    not_implemented
  end
end
