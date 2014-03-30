module ClassNameFormatUtility

  def string_to_class_name(class_name)
    class_name.split.map(&:camelize).join('')
  end

  def class_name_to_human_readable(class_name)
    class_name.split(/(?=[A-Z])/).join(" ")
  end

end
