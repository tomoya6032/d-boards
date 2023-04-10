import $ from 'jquery'
import axios from 'modules/axios'
import {
  listenInactiveHeratEvent,
  listenActiveHeratEvent
} from 'modules/handle_heart'

const handleHeartDisplay = (hasLiked) => {
  if (hasLiked) {
    $('.active-heart').removeClass('hidden')
  } else {
    $('.inactive-heart').removeClass('hidden')
  }
}

const handleCommentForm = () => {
  $('.show-comment-form').on('click', () => {
    $('.show-comment-form').addClass('hidden')
    $('.comment-text-area').removeClass('hidden')
  })
}

//ここを直すとうまく表示されるはず↓

const appendNewComment = (comment) => {
  const avatarUrl = comment.user.avatar_url || '/path/to/default/avatar.png';
  const nickname = comment.user.nickname || 'no-name'; // デフォルトのニックネームを設定

  $('.comments-container').append(
    `<div class="comment">
        <img class="avatar" src="${avatarUrl}" alt="アバター">
        <div>
          <strong>${nickname}</strong>
          <p>${comment.content}</p>
        </div>
     </div>`
  )
}

document.addEventListener('DOMContentLoaded', () => {
  const dataset = document.getElementById('article-show').dataset;
  const articleId = dataset.articleId

  axios.get(`/articles/${articleId}/comments`)
    .then((response) => {
      const comments = response.data
      comments.forEach((comment) => {
        appendNewComment(comment)
        $('#comment_content').val('')
      });
    })
  handleCommentForm()

  $('.add-comment-button').on('click', () => {
    const content = $('#comment_content').val()
    if (!content) {
      window.alert('コメントを入力してください')
    } else {
      axios.post(`/articles/${articleId}/comments`, {
        comment: {content: content}
      })
      .then((res) => {
        const comment = res.data
        appendNewComment(comment)
        $('#comment_content').val('')
      })
    }
  })

  axios.get(`/articles/${articleId}/like`)
    .then((response) => {
      const hasLiked = response.data.hasLiked
      handleHeartDisplay(hasLiked)
    })

  listenInactiveHeratEvent(articleId)
  listenActiveHeratEvent(articleId)
})
