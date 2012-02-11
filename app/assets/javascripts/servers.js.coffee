# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
	$('#status_forceupdate').on 'click', () ->
		$('.span4').prepend '<div class="progress progress-info progress-striped active"><div class="bar" style="width:100%;"></div></div>'