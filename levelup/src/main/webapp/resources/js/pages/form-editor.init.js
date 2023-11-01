$(document).ready(function () {
   0 < $("#elm1").length && tinymce.init({
//      language: "ko",
      selector: "textarea#elm1",
      height: 300,
      plugins: ["advlist autolink link lists charmap print preview hr anchor pagebreak spellchecker", "searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking", "save table directionality emoticons template paste"],
      toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link | print preview media fullpage | forecolor backcolor emoticons",
      style_formats: [{
         title: "굵은 텍스트",
         inline: "b"
      }, {
         title: "빨간 텍스트",
         inline: "span",
         styles: {
            color: "#ff0000"
         }
      }, {
         title: "빨간 헤더",
         block: "h1",
         styles: {
            color: "#ff0000"
         }
      }
      ]
   })
});