      $('#submit_review').on('submit', function() {
        $('#exampleModalCenter').modal('hide');
      });
      $(document).ready(function() {

        if(window.location.href.indexOf('#exampleModalCenter') != -1) {
          $('#exampleModalCenter').modal('show');
        }

      });
    
