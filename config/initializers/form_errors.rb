ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  if html_tag.match?(/class="/)
    html_tag.sub(/class="/, 'class="is-invalid ').html_safe
  else
    html_tag.sub(/(<\w+)/, '\1 class="is-invalid"').html_safe
  end
end