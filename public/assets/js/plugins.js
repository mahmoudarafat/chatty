



      var headerHeight = $(".header").height();
      var footerHeight = $(".footer").height();
      var windowHeight = $(window).height();

      //alert(headerHeight);
      //var departmentHeight = $(".department").height();

      var departmentHeight = windowHeight - (footerHeight + headerHeight )-45;
      var departmentHeight1 = windowHeight - (footerHeight + headerHeight )-8;
      //var departmentHeight2 = windowHeight - (footerHeight + headerHeight )-45;

      $(".height-dep").css("min-height",departmentHeight);
      $(".height-dep1").css("min-height",departmentHeight1);
     // $(".height-dep2").css("min-height",departmentHeight2);

         
  


       $(".search-form").submit(function (e) {
        // alert(inputSearch);
        var inputSearch = $('.search-input').val().length;

        // alert(inputSearch);

        if(inputSearch > 0){

        }else{
            e.preventDefault();
            $('.error-search').fadeIn(500).delay(4000).fadeOut(500);

        }
    })
    
//------  multi File Upload ------

$("#fileUpload").on('change', function () {
    //Get count of selected files
    var countFiles = $(this)[0].files.length;
    var imgPath = $(this)[0].value;
    var extn = imgPath.substring(imgPath.lastIndexOf('.') + 1).toLowerCase();
    var image_holder = $("#image-holder");
  
    // image_holder.empty();
    if (extn == "gif" || extn == "png" || extn == "jpg" || extn == "jpeg") {
        if (typeof(FileReader) != "undefined") {
            //loop for each file selected for uploaded.
            for (var i = 0; i < countFiles; i++) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    var divContent = $("<div></div>");
                    var spanClose = $("<span class='close_icon'>X</span>");
  
                    var img =$("<img />", {
                        "src": e.target.result,
                        "class": "thumb-image p-1",
                        "width": "128",
                        "height": "100"
                    });
                    img.appendTo(divContent);
                    spanClose.appendTo(divContent);
                    divContent.appendTo(image_holder);
  
  
                };
                image_holder.show();
                $(document).on("click",".close_icon",function(){
                    $("#image-holder").closest("div").hide();
                  })
                reader.readAsDataURL($(this)[0].files[i]);
            }
        } else {
            alert("This browser does not support FileReader.");
        }
    } else {
        alert("Pls select only images");
    }
  });