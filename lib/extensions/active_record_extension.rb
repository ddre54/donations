# Extension added to ActiveRecord::Base
# based on ActiveSupport::Concern
# http://api.rubyonrails.org/classes/ActiveSupport/Concern.html#method-i-included

module ActiveRecordExtension

  extend ActiveSupport::Concern

  # add your instance methods here
  # def foo
  #    "foo"
  # end

  # add your static(class) methods here
  module ClassMethods

    def all_polymorphic_types(polymorphic_class_name)
      @polymorphic_classes_hash ||= {}.tap do |hash|
        Dir.glob(File.join(Rails.root, "app", "models", "**", "*.rb")).each do |file|
          model_class = (File.basename(file, ".rb").camelize.constantize rescue nil)
          next if model_class.nil? or !model_class.ancestors.include?(ActiveRecord::Base)
          model_class.reflect_on_all_associations.select{|r| r.options[:as] }.each do |reflection|
            (hash[reflection.options[:as]] ||= []) << model_class.name
          end
        end
      end
      @polymorphic_classes_hash[polymorphic_class_name.to_sym] || []
    end

  end
end

# include the extension
ActiveRecord::Base.send(:include, ActiveRecordExtension)
