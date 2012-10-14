$(document).ready ->

  # Setup photo panel slider
  $('.fotoPainel').each ->
    panel = $(this)
    this.slider = slider = new Slider panel
    slider.setPhotos(panel.data('photos'))
          .setSize(300, 225)
          .setTheme('no-control')
          .setTransition('transition-opacity');

  # Stopping animation when user hovers the photo panel
  $('#painel').mouseenter ->
    $('.fotoPainel', this).each -> this.slider.stop()

  # Restarting animation when user leaves the photo panel
  $('#painel').mouseleave ->
    $('.fotoPainel', this).each -> this.slider.start()