class <%= ActiveSupport::Inflector.camelize(singular_name.to_s) %> < ApplicationRecord
	 validates :name,:email ,presence: true
end
