module DonationsHelper
  def donable_type_names
    Donation.all_polymorphic_types(:donable).map do |model_class|
      model_class.split(/(?=[A-Z])/).join(" ")
    end
  end

  def model_type_name_to_class_name(model_type_name)
    model_type_name.gsub( /\W/, "")
  end
end
