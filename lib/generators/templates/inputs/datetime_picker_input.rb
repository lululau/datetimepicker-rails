class DatetimePickerInput < SimpleForm::Inputs::StringInput
  def input
    value = object.send(attribute_name) if object.respond_to? attribute_name
    display_pattern = I18n.t('datepicker.dformat', :default => '%Y-%m-%d') + ' ' + I18n.t('timepicker.dformat', :default => '%R')
    input_html_options[:value] ||= I18n.localize(value, :format => display_pattern) if value.present?

    input_html_options[:type] = 'text'
    picker_pettern = I18n.t('datepicker.pformat', :default => 'YYYY-MM-DD') + ' ' + I18n.t('timepicker.pformat', :default => 'HH:mm')
    input_html_options[:data] ||= {}
    input_html_options[:data].merge!({ format: picker_pettern, language: I18n.locale.to_s,
                                       date_weekstart: I18n.t('datepicker.weekstart', :default => 0) })

    template.content_tag :div, class: 'input-group date datetime-picker' do
      input = super # leave StringInput do the real rendering
      input += template.content_tag :span, class: 'input-group-addon' do
        template.content_tag :span, '', :class => 'glyphicon glyphicon-calendar'      
      end      
      input
    end
  end

  def input_html_classes
    super.push 'form-control'
  end
end

#class DatetimePickerInput < SimpleForm::Inputs::StringInput
#  def input
#    value = object.send(attribute_name) if object.respond_to? attribute_name
#    # text_field_options['data-date-format'] = I18n.t('date.datepicker')
#    input_html_options[:value] ||= I18n.localize(value, :format => '%Y/%m/%d %R') if value.present?
#    input_html_classes << "datetimepicker"
#
#    super # leave StringInput do the real rendering
#  end
#end
