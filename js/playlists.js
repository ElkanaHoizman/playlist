$(document).ready(() => {
  // api get ajax playlists
  let playlists = () => {
    $.get('http://localhost/playlist/api/playlist.php?type=playlist', (result) => {
      $('.disk').remove()
      $(result['data']).each((i) => {
        let id = result['data'][i]['id']
        let name = result['data'][i]['name']
        let image = result['data'][i]['image']
        let playlists = `
              <div class="col-lg-4  col-md-6 col-sm-12 disk">
                <svg viewBox="0 -150 500 500">
                  <path id="curve"  fill="transparent" d="M73.2,148.6c4-6.1,65.5-96.8,178.6-95.6c111.3,1.2,170.8,90.3,175.1,97" />
                  <text width="500">
                    <textPath xlink:href="#curve">
                      playlist ${name}
                    </textPath>
                  </text>
                </svg>
               
                <i class="fa fa-pencil-square Edit" data-toggle="modal" data-target="#edit_playlist"></i>
                <i class="fa fa-times delete"  data-toggle="modal" data-target="#Modal_delete"></i>
                <i class="fa fa-play View"></i>
                <img class="img_playlist" src="${image}" />
                <input type="hidden" name="id_playlists"  value=${id}>
              </div>`

        $('.row').append(playlists)
      })
    })
  }
  playlists()
  // Edit playlist
  // hide playlist songs (edit)
  $('.edit_Songs').hide()
  $(document).on('click', '.Edit', (event) => {
    let parent = (event.currentTarget.closest('div'))
    let id_playlist = $(parent).find('input').val()

    $.get(`http://localhost/playlist/api/playlist.php?type=playlist&id= ${id_playlist}`, (playlist) => {
      let image_playlist = playlist['data']['image']
      let playlist_name = playlist['data']['name']
      let playlist_edit = `
            <div class="form-group">
              <label for="Playlist"> Playlist New:</label>
              <br>
              <input type="text" class="form edit_New" id="Playlist New" placeholder="Playlist New" value="${playlist_name}" name="${playlist_name}">
            </div>
            <div class="form-group">
              <label for="Playlist URL">Playlist URL:</label>
              <br>
              <input type="text" class="form edit_URL " id="Playlist URL" value="${image_playlist}" placeholder="Playlist URL" name="${image_playlist}">
            </div>
            <br>
            <button type="text" class="btn btn-primary Update" >Update</button>&nbsp;&nbsp;&nbsp
            <input class="btn btn-primary reset" type="reset" value="RESET FIELDS">
            <div class='img_new'><img class="img_new_playlist" src=${image_playlist} /></div>`

      $('.display').html(playlist_edit)
      //  text reset
      $(document).on('click', '.reset', () => {
        $('input:text').val('')
      })
    })

    // Update playlist
    $(document).on('blur', '.edit_URL, .Update', (event) => {
      let Playlist_Update = $('.edit_New').val()
      let url_Update = $('.edit_URL').val()
      if (validateUrl(url_Update)) {
        let img = `<img class='img_new_playlist' src=${url_Update}>`
        $('.img_new').html(img)
        $(`.edit_URL`).css('background-color', 'white')
        // hide edit playlist,show playlist songs edit
        $(document).on('click', '.Update', () => {
          $.post(`http://localhost/playlist/api/playlist.php?type=playlist&id= ${id_playlist}`,
            {
              name: Playlist_Update,
              image: url_Update
            },
            (data) => {
              // alert('Update')
              $('.img_new').html('')
              playlists()
            })
          $('.edit').hide()
          $('.edit_Songs').show()
        })
      }else {
        $('.edit_URL').css('background-color', 'red')
        alert('Please enter a valid url')
      }
    })

    // Edit songs
    $.get(`http://localhost/playlist/api/playlist.php?type=songs&id=${id_playlist}`, (songs) => {
      // console.log(songs)
      var num_song = 2
      let name_song = ''
      // let url_song = ''
      let edit_song = ''
      $(songs['data']['songs']).each((i) => {
        let name_songs = songs['data']['songs'][i]['name']
        let url_songs = songs['data']['songs'][i]['url']
        // name_song += `<span data-url=${url_songs} class= "${num_song} click ">${name_songs}</span><br>`
        edit_song += `
       <div class="Editing_songs url">
          <label for="Song ">Song URL:</label>
          <input type="text" class="form Song  validat  URL_${ num_song}" placeholder="Song URL" value="${url_songs}" name="Song_URL">
          <label for="Name ">Name:</label>
          <input type="text" class="form Name_${ num_song} " placeholder="Name" value="${name_songs}" name="Neme_URL">
        </div> `

        $('.Editing_songs').html(edit_song)
        num_song++
      })
    })

    let e = 1
    $(document).on('blur', '.validat', (event) => {
      let parent = (event.currentTarget.closest('div'))
      let validate_songs = $(parent).find('.validat').val()

      if (validatemp3(validate_songs) && validateUrl(validate_songs)) {
        let valid = $(parent).find('input.validat')
        $(valid).addClass(`valid_${e}`)
        $(`.valid_${e}`).css('background-color', 'white')
      } else {
        let valid = $(parent).find('input.validat')
        $(valid).addClass(`validt_${e}`)
        $(`.validt_${e}`).css('background-color', 'red')
      }
      e++
    })
    $(document).on('click', '.SAVE_edit', () => {
      let num_songs = 2
      let Song_json = []
      $(`.url`).each(() => {
        let song_URL = $(`.URL_${num_songs}`).val()
        let song_Name = $(`.Name_${num_songs}`).val()
        Song_json.push({
          'name': song_Name,
          'url': song_URL
        })

        num_songs++
      })
      $.post(`http://localhost/playlist/api/playlist.php?type=songs&id=${id_playlist}`,
        {
          songs: Song_json
        },
        (data) => {
          $('.edit').show()
          $('.edit_Songs').hide()

          $('#edit_playlist').modal('toggle')
          playlists()
        })
    })
  })

  // delete playlist
  $(document).on('click', '.delete', (event) => {
    let parent = (event.currentTarget.closest('div'))
    let id_playlist = $(parent).find('input').val()
    // alert(id_playlist)
    $('.btn-danger').click(() => {
      // alert(id_playlist)
      $.ajax({
        url: `http://localhost/playlist/api/playlist.php?type=playlist&id= ${id_playlist}`,
        type: 'DELETE',
        success: () => {
          playlists()
        }
      })
    })
  })

  // create new playlists
  // hide playlist songs
  $('.New_Songs').hide()
  $(document).on('blur', '.Playlist_URL', () => {
    let Playlist_New = $('.Playlist_New').val()
    let Playlist_url = $('.Playlist_URL').val()

    // validat
    if (validateUrl(Playlist_url)) {
      let img = `<img class='img_new_playlist' src=${Playlist_url}>`
      $('.img_new').html(img)
      $(`.Playlist_URL`).css('background-color', 'white')
      //   // hide Add playlist,show  playlist songs
      $('.next').click(() => {
        $('.New').hide()
        $('.New_Songs').show()
        // Clear
        $('input:text').val('')
        $('.img_new').html('')
      })
    }else {
      $('.Playlist_URL').css('background-color', 'red')
      alert('Please enter a valid url')
      $('.next').click(() => {
        $('.New').show()
      })
    }

    let h = 1
    $(document).on('blur', '.validat', (event) => {
      let parent = (event.currentTarget.closest('div'))
      let validate_songs = $(parent).find('.validat').val()

      if (validatemp3(validate_songs) && validateUrl(validate_songs)) {
        let valid = $(parent).find('input.validat')
        $(valid).addClass(`valid_${h}`)
        $(`.valid_${h}`).css('background-color', 'white')
      }else {
        let valid = $(parent).find('input.validat')
        $(valid).addClass(`validt_${h}`)
        $(`.validt_${h}`).css('background-color', 'red')
      }
      h++
    })

    $(document).on('click', '.create', () => {
      let num_songs = 0
      let Song_json = []

      $(`.URL`).each(() => {
        let song_URL = $(`.URL_${ num_songs}`).val()
        let song_Name = $(`.Name_URL_${ num_songs}`).val()
        Song_json.push({
          'name': song_Name,
          'url': song_URL
        })

        num_songs++
      })
      // console.log(Song_json)
      $.post('http://localhost/playlist/api/playlist.php?type=playlist',
        {
          name: Playlist_New,
          image: Playlist_url,
          songs: Song_json
        },
        (data) => {
          $('.New').show()
          $('.New_Songs').hide()

          $('#new_playlist').modal('toggle')
          playlists()
        })

      // reset input
      $(document).on('click', '.reset', () => {
        $('input:text').val('')
      })
    })
  })
  // add songs
  let song = 0
  $('.song').click(() => {
    song++
    if (song < 20) {
      let son = ` <div class="form-group New_Songs  URL">
            <label for="Song URL">Song URL:</label>
            <input type="text" data-num= ${song}  class="form Song URL_${song} validat URL" placeholder="Song URL mp3" name="Song URL" >
            <label for="Name URL">Name:</label>
            <input type="text" class="form Song Name_URL_${song}" placeholder="Name" name="Name URL">
          </div>`

      $('.add').append(son)
    }
  })
  // player Off
  $('.player').hide()
  // Open player
  $(document).on('click', '.fa-play', () => {
    // $('.player').slideDown()
    setTimeout(() => {
      $('.player').slideDown()}, 100)

    $('.disk').css({ 'position': 'relative', 'top': '315px'})
    $('.player').css({ 'z-index': '1'})
    // jump to top of browser page
    $('html,body').scrollTop(0)
  })

  // Close Player
  $(document).on('click', '.btn-danger, .SAVE', () => {
    $('.player').slideUp('slow')
    setTimeout(() => {
      $('.disk').css({ 'position': 'relative', 'top': '20px'})}, 200)
  })

  // Search
  $('#Search').on('keyup', function () {
    var value = $(this).val().toLowerCase()
    $(' .disk').filter(function () {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    })
  })
})
// validate Url Playlist
let validateUrl = (Url) => // return true or false.
  {
  let urlregex = new RegExp(
    '^(http:\/\/www.|https:\/\/www.|ftp:\/\/www.|www.){1}([0-9A-Za-z]+\.)')
  return urlregex.test(Url)
}
// validate mp3 songs
let validatemp3 = (mp) => // return true or false.
  {
  mp3 = /\.(?:wav|mp3)$/i
  return mp3.test(mp)
}
