module UseCase
  extend ActiveSupport::Concern
  include ActiveModel::Validations
  include ActiveModel::Model

  module ClassMethods
    def perform(*args)
      new(*args).tap { |use_case| use_case.perform }
    end
  end

  def perform
    raise NotImplementedError
  end

  def success?
    errors.none?
  end
end
