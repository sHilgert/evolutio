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
    $(".js-skill-field").val($(".js-skill-field").val().concat($(this).data('id'), "; "))
    removeFromSelect(this)

  $(".js-user-dropdown li a").click ->
    text = "##{$(this).data('user')}; "
    $(".js-challenge__user-area").append(text)
    $(".js-user-field").val($(".js-user-field").val().concat($(this).data('id'), "; "))
    removeFromSelect(this)

  $(".js-submit").click ->
    description = $('.js-description').val()
    skills = $(".js-skill-field").val().split('; ')
    users = $(".js-user-field").val().split('; ')
    buildPostData(description, skills, users)

removeFromSelect = (item) ->
  $(item).remove()

buildPostData = (description, skills, users) ->
  header = {
    "X_CSRF_TOKEN": $("meta[name='csrf-token']").attr("content"),
    "Content-Type": "application/json"
  }

  $.ajax({
    type: 'POST',
    url: '/abc',
    headers: header,
    dataType: 'json',
    data: JSON.stringify({ description: description, skills: skills[0], users: 4 }),
    success: () ->
      alert('Enviado!')
  })
