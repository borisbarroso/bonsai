# Use this setup block to configure all options available in SimpleForm.
SimpleForm.setup do |config|

  # Components used by the form builder to generate a complete input. You can
  # remove any of them, change the order, or even add your own components in the
  # stack. By inheriting your component from SimpleForm::Components::Base you'll
  # have some extra helpers for free.
  # config.components = [
  #  SimpleForm::Components::Wrapper, SimpleForm::Components::Label,
  #  SimpleForm::Components::Input, SimpleForm::Components::Hint,
  #  SimpleForm::Components::Error
  #]

  # Default tag used in components (hints and errors basically). When using one
  # of these components, this tag will be used to render it.
  # config.component_tag = :span

  # You can wrap all inputs in a pre-defined tag. By default is nil.
  config.wrapper_tag = :div

  # How the label text should be generated altogether with the required text.
  config.label_text = lambda { |label, required| "#{label} #{required}" }

  # Series of attemps to detect a default label method for collection
  config.collection_label_methods = [ :to_s, :to_a, :name, :title, :to_label ]

  # Series of attemps to detect a default value method for collection
  config.collection_value_methods = [ :id, :to_s ]

  # Collection of methods to detect if a file type was given.
  # config.file_methods = [ :file?, :public_filename ]

  # Default priority for time_zone inputs.
  # config.time_zone_priority = nil

  # Default priority for country inputs.
  # config.country_priority = nil

  # Default size for text inputs
  config.default_input_size = 35
end
