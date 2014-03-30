module DonationsHelper

  include ::ClassNameFormatUtility

  def donable_type_names
    Donation.all_polymorphic_types(:donable).map do |model_class|
      [class_name_to_human_readable(model_class), model_class]
    end
  end

  def donable_class_name_form(donable_class)
    "donations/donables/#{string_to_class_name(donable_class).underscore}_form"
  end

  def donable_class_name_show(donable_class)
    "donations/donables/#{string_to_class_name(donable_class).underscore}_show"
  end
end
