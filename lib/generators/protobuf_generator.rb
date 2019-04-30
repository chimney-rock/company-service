class ProtobufGenerator < Rails::Generators::Base
  namespace :protobuf
  source_root File.expand_path('../templates', __FILE__)
  
  argument :type_name, type: :string, required: true, banner: 'TypeName', desc: ''
  argument :attributes, type: :array, default: []

  def create_initializer_file
    create_file "config/initializers/initializer.rb", "# Add initialization content here"
  end

  private

  def prepared_attributes
    @prepared_attributes ||= begin
      results = {}
      attributes.each do |attr|
        attr.split(':', 2)
      end

      results
    end
  end
end
