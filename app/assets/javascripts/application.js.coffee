#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require bootstrap
#= require jquery.timeago
#= require_tree .

$(document).on 'page:update', ->
  $("time[data-behaviors~=timeago]").timeago();
