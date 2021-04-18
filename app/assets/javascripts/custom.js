// $(document).ready(function() {
//     // Setup - add a text input to each footer cell
//     $('#userslist tfoot th').each( function () {
//         var title = $(this).text();
//         $(this).html( '<input type="text" placeholder="Search '+title+'" />' );
//     } );
 
//     // DataTable
//     var table = $('#userslist').DataTable({
//         initComplete: function () {
//             // Apply the search
//             this.api().columns().every( function () {
//                 var that = this;
 
//                 $( 'input', this.footer() ).on( 'keyup change clear', function () {
//                     if ( that.search() !== this.value ) {
//                         that
//                             .search( this.value )
//                             .draw();
//                     }
//                 } );
//             } );
//         }
//     });
 
// } );



$(document).ready(function() {
    // Setup - add a text input to each footer cell
    $('#example tfoot th').each( function () {
        var title = $(this).text();
        $(this).html( '<input type="text" placeholder="Search '+title+'" />' );
    } );
 
    // DataTable
    var table = $('#example').DataTable({

  //    columnDefs: [
     
  //   { orderable: false, targets: 0 }
  // ],
  // order: [[1, 'asc']],


        initComplete: function () {



            // Apply the search
            // debugger
            this.api().columns([0,1,2]).every( function () {
                var that = this;
              
                $( 'input', this.footer() ).on( 'keyup change clear', function () {
                    
                    //if ( that.search() !== this.value ) {
                        that
                            .search( this.value )
                            .draw();
                    //}
                } );
            } );
        },

    });

 
} );