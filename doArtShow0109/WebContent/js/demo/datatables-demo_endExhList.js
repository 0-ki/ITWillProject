// Call the dataTables jQuery plugin
$(document).ready(function() {
  $('#dataTable').DataTable({
	  "lengthChange": false,
	  "info": false,
	  "columnDefs": [
          {
              "targets": [ 0 ],
              "visible": false,
              "searchable": false
          },
          {
              "targets": [ 1 ],
              "visible": false,
              "searchable": false
          },
          
          {
        	  "targets": [ 6 ],
              "visible": false,
              "searchable": false
          },
          {
        	  "targets": [ 7 ],
              "visible": false,
              "searchable": false
          },
          {
        	  "targets": [ 8 ],
              "visible": false,
              "searchable": false
          },
          {
              "targets": [ 9 ],
              "visible": false,
              "searchable": false
          },
          {
              "targets": [ 10 ],
              "visible": false,
              "searchable": false
          },
          {
              "targets": [ 11 ],
              "visible": false,
              "searchable": false
          },
          {
              "targets": [ 12 ],
              "visible": false,
              "searchable": false
          },
          {
              "targets": [ 13 ],
              "visible": false,
              "searchable": false
          },
          {
              "targets": [ 16 ],
              "visible": false,
              "searchable": false
          },
          {
              "targets": [ 17 ],
              "visible": false,
              "searchable": false
          },
          {
              "targets": [ 18 ],
              "visible": false,
              "searchable": false
          },
          {
              "targets": [ 19 ],
              "visible": false,
              "searchable": false
          },
          {
              "targets": [ 20 ],
              "visible": false,
              "searchable": false
          },
          {
              "targets": [ 21 ],
              "visible": false,
              "searchable": false
          },
          {
              "targets": [ 22 ],
              "visible": false,
              "searchable": false
          }
      ]
  });

  var table = $('#dataTable').DataTable();

  var tableData;
  
  $('#dataTable tbody').on( 'click', 'tr', function () {
      tableData = table.row( this ).data()[0];
      
	  $('#exhID').html(table.row( this ).data()[0]);
	  $('#memberID').html(table.row( this ).data()[1]);
	  $('#exhGubun1').html(table.row( this ).data()[2]);
	  $('#exhGubun2').html(table.row( this ).data()[3]);
	  $('#exhGubun4').html(table.row( this ).data()[4]);
	  $('#exhName').html(table.row( this ).data()[5]);
	  $('#artistName').html(table.row( this ).data()[6]);
	  $('#artistInfo').html(table.row( this ).data()[7]);
	  $('#exhContent').html(table.row( this ).data()[8]);
	  $('#exhPlace').html(table.row( this ).data()[9]);
	  $('#exhPlaceZip').html(table.row( this ).data()[10]);
	  $('#exhPlaceAddr1').html(table.row( this ).data()[11]);
	  $('#exhPlaceAddr2').html(table.row( this ).data()[12]);
	  $('#exhUrl').html(table.row( this ).data()[13]);
	  $('#exhStartDate').html(table.row( this ).data()[14]);
	  $('#exhEndDate').html(table.row( this ).data()[15]);
	  $('#opTime').html(table.row( this ).data()[16]);
	  $('#tel').html(table.row( this ).data()[17]);
	  $('#admFee').html(table.row( this ).data()[18]);
	  $('#imageFile').html(table.row( this ).data()[19]);
	  $('#imageFile').append(table.row( this ).data()[20]);
	  $('#imageFile').append(table.row( this ).data()[21]);
	  $('#imageFile').append(table.row( this ).data()[22]);
	  $('#exhReadCount').html(table.row( this ).data()[23]);
	  $('#registerDate').html(table.row( this ).data()[24]);
  });
  
  $('input[type="checkbox"]').change(function(){
	  if($(this).is(":checked")){
		  $.ajax({
			  url: "/doArtShow/updateActiveFlag.do",
			  type: "GET",
			  data: "exhID=" + tableData + "&checked=true",
			  dataType : "html",
			  success: function(data){
				  //console.log("updateActiveFlagTrue success");
			  }
		  });
	  } else {
		  $.ajax({
			  url: "/doArtShow/updateActiveFlag.do",
			  type: "GET",
			  data: "exhID=" + tableData + "&checked=end",
			  success: function(data){
				  //console.log("updateActiveFlagFalse success");
			  }
		  });
	  } 
  });
  
  $('.exhName').click(function() { 
	  $("#myModal").modal();
  });
  
  
}); 
