(function() {
  function uploader(url, file, callback) {
    var fd = new FormData();
    fd.append("file", file);

    $.ajax({
      url: url,
      method: "POST",
      dataType: "json",
      data: fd,
      processData: false,
      contentType: false
    }).done(function (data, status, xhr) {
      if (callback) {
        callback(data);
      }
      renderMessage("File uploaded successfully");
    }).fail(function (xhr, status, error) {
      return console.info(error);
      renderMessage("Error uploading file: " + error);
    }).always(function (data, status, xhr) {

    });

  }

  function getData(form, callback) {
    var $form = $(form)
    $.ajax({
      url: $form[0].action,
      method: "GET",
      dataType: "json",
      data: $form.serialize(),
    }).done(function (data, status, xhr) {
      if (callback) {
        callback(data);
      }
      console.info(data);

    }).fail(function (xhr, status, error) {
      return console.info(error);
      renderMessage("Error uploading file: " + error);
    }).always(function (data, status, xhr) {

    });
  }

  function renderData(data) {
    $("#table tbody > tr").remove()
    $(data).each(function(index, item) {
      $("#table tbody").append(`<tr>
        <td>${item.name}</td>
        <td>${item.date}</td>
        <td>${item.number}</td>
        <td>${item.description}</td>
        </tr>`);
    });
  }

  function renderMessage(message) {
    $("#message").html(message);
  }

  $(document).ready(function() {
    $("#upload_form").on("submit", function(e) {
      e.preventDefault();
      uploader(this.action, $("#file")[0].files[0], renderData);
    });
    $("#filter_form").on("submit", function(e) {
      console.log(this);
      e.preventDefault();
      getData(this, renderData);
    });
  });
})(this);