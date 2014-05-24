#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require bootstrap
#= require jquery.timeago
#= require plugins/nprogress
#= require_tree .

$(document).on 'page:update', ->
  $("time[data-behaviors~=timeago]").timeago();
$(document).on 'page:fetch', ->
  NProgress.start()
$(document).on 'page:change', ->
  NProgress.done()
$(document).on 'page:restore', ->
  NProgress.remove()
