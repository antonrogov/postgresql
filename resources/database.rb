actions :create, :drop
default_action :create

attribute :name, name_attribute: true, kind_of: String, required: true
