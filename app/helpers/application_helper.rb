module ApplicationHelper
  # Identify the direction of the Locale language    
  def ltr_or_rtl
    rtlLanguges = ["ar", "dv", "fa", "ha", "he", "ks", "ps", "sd", "ur", "yi"]
    
    if  rtlLanguges.include? I18n.locale.to_s
      'rtl'
    else
      'ltr'
    end
  end

  # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = I18n.t('navigation.app_name')
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

end