// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require jquery.ui.widget
//= require z.jquery.fileupload
//= require_tree .

$(function() {
  $('.directUpload').find("input:file").each(function(i, elem) {
    var fileInput = $(elem);
    var form      = $(fileInput.parents('form:first'));
    var submitButton = form.find('input[type="submit"]');
    var photoView = form.find('.photo-view');
    var cropButton = form.find('#crop-it');
    var progressBar  = $("<div class='progress-bar'></div>");
    var barContainer = $("<div class='progress'></div>").append(progressBar);
    fileInput.after(barContainer);
    fileInput.fileupload({
      fileInput:       fileInput,
      url:             form.data('url'),
      type:            'POST',
      autoUpload:      false,
      formData:        form.data('form-data'),
      paramName:       'file', // S3 does not like nested name fields, i.e. name="user[avatar_url]"
      dataType:        'XML',  // S3 returns XML if success_action_status is set to 201
      replaceFileInput: false,
      add: function(e, data) {
        submitButton.prop('disabled', true);
        var fileUrl = window.URL.createObjectURL(data.files[0]);
        crop = photoView.croppie({
          url: fileUrl,
          viewport: { width: 250, height: 250, type: 'square' }
        });
        var $this = $(this);
        cropButton.css('display', 'initial');
        cropButton.on('click', function(e) {
          e.preventDefault();
          crop.croppie('result').then(function(resp){
            blobData = dataURItoBlob(resp);
            imageFile = new File([blobData], data.files[0].name, {type: "image/png", lastModified: Date.now()});
            data.files[0] = imageFile;
            data.submit();
          });
        });
      },
      progressall: function(e, data) {
        console.log(data);
        var progress = parseInt(data.loaded / data.total * 100, 10);
        progressBar.css('width', progress + '%')
      },
      start: function(e) {
        submitButton.prop('disabled', true);

        progressBar.
          addClass('progress-bar-info').
          css('width', '0%').
          text("Loading...");
      },
      done: function(e, data) {
        submitButton.prop('disabled', false);
        progressBar.text("Uploading done");
        progressBar.addClass('progress-bar-success').
                    removeClass('progress-bar-info');

        // extract key and generate URL from response
        var key = $(data.jqXHR.responseXML).find("Key").text();
        var url = '//' + form.data('host') + '/' + key;

        // create hidden field
        var input = $("<input />", { type: 'hidden', name: fileInput.attr('name'), value: url });
        form.append(input);
      },
      fail: function(e, data) {
        submitButton.prop('disabled', false);

        progressBar.
          addClass('progress-bar-danger').
          removeClass('progress-bar-info').
          text('Failed');
      }
    });
  });

  function dataURItoBlob(dataURI, callback) {
    // convert base64 to raw binary data held in a string
    // doesn't handle URLEncoded DataURIs - see SO answer #6850276 for code that does this
    var byteString = atob(dataURI.split(',')[1]);

    // separate out the mime component
    var mimeString = dataURI.split(',')[0].split(':')[1].split(';')[0]

    // write the bytes of the string to an ArrayBuffer
    var ab = new ArrayBuffer(byteString.length);
    var ia = new Uint8Array(ab);
    for (var i = 0; i < byteString.length; i++) {
        ia[i] = byteString.charCodeAt(i);
    }

    // write the ArrayBuffer to a blob, and you're done
    var bb = new Blob([ab]);
    return bb;
  }
});
