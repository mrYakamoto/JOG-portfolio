"use strict";

$( document ).ready(function(){
  console.log("doc-ready!")
  imageHoverListener();
  sideBarPublicationListener();
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

  var $articleTitle = getMatchingArticleTitle.call(this);
  $articleTitle.closest('div.pub-titles').toggle('slow');
  $articleTitle.addClass('highlight');
}

function hideTitles(){
  $(this).find('.overlay-title').slideUp('medium');

  var $articleTitle = getMatchingArticleTitle.call(this);
  $articleTitle.closest('div.pub-titles').toggle('fast');
  $articleTitle.removeClass('highlight');
}

function getMatchingArticleTitle(){
  var articleId = $(this).find('img').attr('dataid');

  return $(".article-title[dataid="+articleId+"]");
}
// end image hover

// sidebar hover

function sideBarPublicationListener(){
  $('div.publication-container').hover(
    function(){ $(this).find('div.pub-titles').toggle('fast') },
    function(){ $(this).find('div.pub-titles').toggle('fast') }
    )
}


// end sidebar hover
