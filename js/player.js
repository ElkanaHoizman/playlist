// player
$(document).on('click', '.View', (event) => {
  let parent = (event.currentTarget.closest('div'))
  let id_playlist = $(parent).find('input').val()
  // api get image playlist
  $.get(`http://localhost/playlist/api/playlist.php?type=playlist&id= ${ id_playlist}`, (playlist) => {
    let image_playlist = playlist['data']['image']
    let name_playlist = playlist['data']['name']
    // title
    let mytitle = () => {
      document.getElementById('yourElementId').innerHTML = name_playlist
    }
    mytitle()

    // api get songs
    $.get(`http://localhost/playlist/api/playlist.php?type=songs&id=${id_playlist}`, (songs) => {
      let num_song = 0
      let name_song = ''
      let url_song = ''
      $(songs['data']['songs']).each(() => {
        let name_songs = songs['data']['songs'][num_song]['name']
        let url_songs = songs['data']['songs'][num_song]['url']
        name_song += `<span data-url=${url_songs} id=${name_songs} class= "click "><i class="fa ply ${name_songs}">&#xf04b</i> &nbsp&nbsp&nbsp${name_songs}</span><br>`

        player = `
            <div class="song play">${name_song}</div>
            <div class="audio">
            </div>
             <i class="fa fa-play f" onclick="playVid ()"></i>
            <i class="fa fa-pause" onclick="pauseVid()"></i>
            <i class="fa fa-times-circle-o delete" data-toggle="modal" data-target="#Modal_delete"></i>
            <i class="material-icons Edit " data-toggle="modal" data-target="#edit_playlist">&#xe22b;</i>
             <input type="hidden" name="id_playlists"  value=${id_playlist}>
            <img class="img_play" src="${image_playlist}"/>`

        $('.player').html(player)
        num_song++

        // Play songs first
        $(`.click:first-child `).click()
        // Play songs
        $(document).on('click', `.click`, (event) => {
          let Play = $(event.currentTarget).attr('data-url')
          let next = $(event.currentTarget).attr('id')
          $('.audio').html(`<audio controls autoplay id="myAudio"> <source src= ${Play}  type="audio/ogg"></audio>`)
          $(`.click`).css({ 'opacity': '0.25' })
          $(`.${next}`).css({'display': 'none' })
          $(`#${next}`).css({ 'opacity': '1.5' })
          $(`.fa-pause`).css({ 'display': 'block' })

          $('.img_play').css({ 'animation': 'r  12s infinite linear' })
          let aud = document.getElementById('myAudio')
          aud.addEventListener('ended', () => {
            // $(`.${next}`).css({'display': 'block' })
            $(`.click`).css({'opacity': '0.25' })
            // play next song
            $(`#${next}`).next().next().click()
          })
          // Stop a song
          $(document).on('click', `.img_play,.SAVE,.delete`, (event) => {
            pauseVid()
            $('.img_play').css({ 'animation': 'r 0s infinite linear' })
            $(`.fa-pause`).css({ 'display': 'none' })
          })
        })
      })
    })
  })
})

// Stop a song
let pauseVid = () => {
  let aud = document.getElementById('myAudio')
  $('.img_play').css({ 'animation': 'r 0s infinite linear' })
  $(`.fa-pause`).css({ 'display': 'none' })
  $(`.f`).css({ 'display': 'block' })
  aud.pause()
}
let playVid = () => {
  $('.img_play').css({ 'animation': 'r  12s infinite linear' })
  let aud = document.getElementById('myAudio')
  aud.play()
  $(`.fa-pause`).css({ 'display': 'block' })
}
