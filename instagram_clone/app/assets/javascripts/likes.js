$(document).ready(() => {
  $('a[data-remote]').on('ajax:success', (e, data) => {
    const likeCount = data.like_count
    $('[data-like-count]').text(likeCount)
  })
})
