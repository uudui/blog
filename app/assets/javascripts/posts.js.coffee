# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
window.Post =
  updateLike: (ids, count = 0) ->
    for id in ids
      likeable = $('#post-'+id+'-like')
      likeable.addClass('btn-danger')
      @disabledLike(likeable)
      @disabledUnlike($('#post-'+id+'-unlike'))
      if count > 0
        likeCount = likeable.find('.likes-count')
        likeable.find('.fa:visible').addClass('fa-beat')
        likeCount.text((parseInt(likeCount.text()) + count))

  updateUnlike: (ids, count = 0) ->
    for id in ids
      unlikeable = $('#post-'+id+'-unlike')
      unlikeable.addClass('btn-warning')
      @disabledUnlike(unlikeable)
      @disabledLike($('#post-'+id+'-like'))
      if count > 0
        unlikeCount = unlikeable.find('.unlikes-count')
        unlikeable.find('.fa:visible').addClass('fa-beat')
        unlikeCount.text((parseInt(unlikeCount.text()) - count))

  disabledLike: (likeable) ->
    likeable.attr('title', '已赞')
    likeable.attr('href', 'javascript:void(0)')

  disabledUnlike: (unlikeable) ->
    unlikeable.attr('href', 'javascript:void(0)')

