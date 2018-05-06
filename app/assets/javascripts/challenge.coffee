# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $(".js-challenge__submit-skill").click ->
    element = $(".js-challenge__skill-text")
    text = "##{element.val()} "
    $(".js-challenge__skill-area").append(text)
    element.val("")

  $(".js-challenge__submit-leader").click ->
    element = $(".js-challenge__leader-text")
    text = "@#{element.val()} "
    $(".js-challenge__leader-area").append(text)
    element.val("")

  $(".js-skill-dropdown li a").click ->
    text = "##{$(this).data('skill')}; "
    $(".js-challenge__skill-area").append(text)
    removeFromSelect(this)

  $(".js-user-dropdown li a").click ->
    text = "##{$(this).data('user')}; "
    $(".js-challenge__user-area").append(text)
    removeFromSelect(this)

  $(".js-submit").click ->
    description = $('.js-description').val()
    

removeFromSelect = (item) ->
  $(item).remove()

buildPostData = () ->
