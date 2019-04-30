$(function () {
	   
	               var offset;
	               var x, y, top, left;  //放大区域的div位置记录计算
	   
	   
	               var EnlargeImg_width, EnlargeImg_height; //要放大图片的高和宽
	   
	              var Movediv_width, Movediv_height;
	              $(".small-img").mouseout(function(e){
	            	  $("#EnlargeImg").css({
	            		  'display':'none'
	            	  });
	              })
	              $(".small-img").mousemove(function (e) {
	  
	            	  $("#EnlargeImg").css({
	            		  'display':'block'
	            	  });
	                  var children_dom; //要放大图片的doc
	  
	                  var parent = $(this);
	  
	                  children_dom = parent.children('.a-img');
	  
	                  EnlargeImg_width = children_dom.width();
	                  EnlargeImg_height = children_dom.height();
	  
	                  Movediv_width = EnlargeImg_width / 3;
	                 Movediv_height = EnlargeImg_height / 3;
	  
	                  children_dom = parent.children('.img-div-area');
	  
	                  children_dom.css({
	                      'width': Movediv_width + 'px',
	                     'height': Movediv_height + 'px',
	                      'display': 'block'
	                  });
	                  move(e);
	              });
	  
	              function move(e) {
	                  offset = $(".small-img").offset();
	                  top = offset.top;
	                  left = offset.left;
	                  x = e.pageX - 4;
	                  y = e.pageY - 4;
	                  top = y - top - Movediv_height / 2;
	                  left = x - left - Movediv_width / 2;
	                  if (top < 0) {
	                      top = 0;
	                  }
	                  if (left < 0) {
	                      left = 0;
	                  }
	                  if (top + Movediv_height >= EnlargeImg_height) {
	                      top = $(".a-img").height() - Movediv_height - 4;
	                  }
	                  if (left + Movediv_width >= EnlargeImg_width) {
	                      left = $(".a-img").width() - Movediv_width - 4;
	                  }
	                  $(".img-div-area").css(
	                                          { 'top': top + "px",
	                                           'left': left + "px"
	                                         }
	                                     );
	                  var position_x, position_y;
	 
	                  $('#EnlargeImg').css({
	                      'background-position': (-(1024 / EnlargeImg_height) * left) + 'px ' + (-(768 / EnlargeImg_width) * top) + 'px '
	                 });
	           }
	  
	              $(".img-div-area").mousemove(function (e) {
	                  move(e);
	              });
         });
