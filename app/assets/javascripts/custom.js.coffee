jQuery ->
  $("a[rel~=popover], .has-popover").popover()
  $("a[rel~=tooltip], .has-tooltip").tooltip()

  # $.fn.dataTable.ext.search.push ->
  #   ( settings, data, dataIndex ) ->


  table = $('.datatable').dataTable
    bProcessing: true
    bServerSide: true
    sAjaxSource: $('#data').data('source')
    sServerMethod: "post"
    fnServerParams: (aoData) ->
      aoData.push( { "name": "skill_query", "value": $('#skill_form').serialize() } )


  $('.skill').click ->
    table.fnClearTable(0)
    table.fnDraw()
