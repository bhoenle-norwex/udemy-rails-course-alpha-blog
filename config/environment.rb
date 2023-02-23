# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!


# Removes the additional .form_with_errors wrapper div that is auto generated in forms with an error
#
# Required to prevent the addition of 'field_with_errors' class surrounding the label and input if using bootstrap columns on the label and inputs like so:
# <div class="row">
#   <%= form.label :title, "Title", class: 'col-2 col-form-label' %>   <----- Dont use the column class here and you wont have the style issues
# </div>
# Results in:
# <div class="row">
#   <div class="form_with_errors">  <----- This throws spacing issues with .row > * in the bootstrap css
#     <%= form.label :title, "Title", class: 'col-2 col-form-label' %>
#   </div>
# </div>
#
# This is NOT required if the input / label does not use the column classes like so:
# <div class="row">
#   <div class="col-2 col-form-label text-light">
#     <%= form.label :title, "Title" %>  <----- Not using the 'column' classes inside of the label or inputs
#   </div>
# </div>
# Results in:
# <div class="row">
#   <div class="col-2 col-form-label text-light">
#     <div class="form_with_errors">   <----- This does not throw spacing issues since the column (.col-2) comes directly after the row (.row)
#       <%= form.label :title, "Title" %>
#     </div>
#   </div>
# </div>
#
#ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
#  html_tag.html_safe
#end
