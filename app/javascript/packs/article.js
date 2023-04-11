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

// const appendNewComment = (comment) => {
 
//   $('.comments-container').append(
//     `<div class="article_comment"><p>${comment.content}</p></div>`
//   )
// }

const appendNewComment = (comment) => {
  
  // const avatarUrl = comment.user.avatar_url;
  const avatarAlt = comment.user.name || 'No name';
  
  
  $('.comments-container').append(`
  <div class="article_comment">
    <p>${comment.content}</p>
  </div>
`);

}

// const appendNewComment = (comment) => {
//   // user_idから該当するユーザー情報を取得
//   const userId = comment.user_id;
//   const userUrl = '/users/' + userId + '.json';
//   axios.get(userUrl)
//     .then(response => {
//       const userData = response.data;
//       const avatarUrl = userData.avatar_url;
//       const avatarAlt = userData.username;

//       // HTMLにコメントとアバター画像を追加
//       $('.comments-container').append(`
//         <div class="article_comment">
//           <img src="${avatarUrl}" alt="${avatarAlt}">
//           <p>${comment.content}</p>
//         </div>
//       `);
//     })
//     .catch(error => console.log(error));
// }




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