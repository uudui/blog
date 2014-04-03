# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
window.Post =
  updateLike: (ids, count = 0) ->
    for id in ids
      likeable = $('#post-'+id+'-like')
      likeable.addClass('btn-success')
      likeable.attr('title', '已赞')
      likeable.attr('href', 'javascript:void(0)')
      if count > 0
        likeCount = likeable.find('.likes_count')
        likeable.find('.fa:visible').addClass('fa-beat')
        likeCount.text((parseInt(likeCount.text()) + count))

  updateUnlike: (ids, count = 0) ->


