"use strict";

$( document ).ready(function(){
  console.log("doc-ready!")
  imageHoverListener();
  sideBarPublicationListener();
  priorityArrowListener();
  deleteArticleListener();


  $(".articles-container .portfolio-item").each(function(index) {
    $(this).delay(150*index).animate({opacity: 1},100);
  });
  // $(".social-icon").each(function(index) {
  //   $(this).delay(800*index).animate({opacity: 1},300);
  // });
  $(".article-title").each(function(index) {
    $(this).delay(50*index).animate({opacity: 1},200);
  });
  $(".publication-name").each(function(index) {
    $(this).delay(100*index).animate({opacity: 1},100);
  });



})





// image hover
function imageHoverListener(){
  $('div.portfolio-item').hover(
    function(){showTitles.call(this)},
    function(){hideTitles.call(this)}
    )
}
function showTitles(){
  $(this).find('.overlay-title').slideDown('medium');
  highlight.call(this);
}
function hideTitles(){
  $(this).find('.overlay-title').slideUp('medium');
  removeHighlight.call(this);
}
function highlight(){
  var id = $(this).attr('dataid');
  $("#article-"+id).addClass('highlight');
}
function removeHighlight(){
  var id = $(this).attr('dataid');
  $("#article-"+id).removeClass('highlight');
}
// end image hover

// sidebar click
function sideBarPublicationListener(){
  $('.sidebar .publication-name').click(function(e){
    e.preventDefault();
    $(this).parent().find('div.pub-titles').toggle('medium')
  })
}
// end sidebar click

// admin controls
function priorityArrowListener(){
  $('span.priority-arrow').click(function(){
    var articleId = $(this).closest('div.portfolio-item').attr('dataid');

    if ( $(this).hasClass('priority-up') ){
      var change = 1;
    } else if ( $(this).hasClass('priority-down') ){
      var change = -1;
    }
    var data = { article: { change: change } }
    $.ajax({
      data: data,
      url: 'articles/'+articleId,
      method: 'put'
    })
    .done(function(response){

      var $portfolioItem = $("div.portfolio-item[dataid="+response.article.id.toString() +"]");
      var $priorityNumberSpan = $portfolioItem.find('span.priority-number');
      var newPriority = ( parseInt($priorityNumberSpan.html()) + parseInt(response['change']) );

      $priorityNumberSpan.html(newPriority);
    })
    .error(function(xhr, unknown, error){
      console.log(error);
    })
  })
}

function deleteArticleListener(){
  $('span.delete-article').click(function(e){
    e.preventDefault();
    var isSure=confirm('Are you sure you want to delete this article?');
    if (isSure) {
      var id = $(this).attr('dataid');
      $.ajax({
        url: ( '/articles/' + id ),
        method: 'delete'
      })
      .done(function(response){

        removeArticle(response.article.id)
      })
      .error(function(xhr, unknown, error){
        console.log(error);
      })
    }
  })
}
function removeArticle(id){
  $('div.portfolio-item[dataid='+id+']').remove();
  $('.sidebar .article-title[dataid='+id+']').remove();
}



// end admin controls