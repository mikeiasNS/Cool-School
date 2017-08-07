var $modal = $('#search-modal');
var $modalContent = $($modal.find('#result'));
var $filter = $($modal.find('#filter'));
var loader = "<div class='ui active inverted dimmer'> <div class='ui active centered inline loader'> </div> </div>";
var $searchButton = $($modal.find('#search'));
var $confirmButton = $($modal.find('#confirm'));

$('.search-responsible').on('click', function() {
  $modal.modal('show');
  callFilter();
});

$searchButton.on('click', function() {
  callFilter();
});

$confirmButton.on('click', function() {
  $modal.modal('toggle');
  var $checkeds = $($modal.find('input:checked'));

  for (var i = $checkeds.length - 1; i >= 0; i--) {
    var id = $($checkeds[i]).val();
    var name = $($($checkeds[i]).parent().parent().next().find('label')).html();
    $('#responsible-list').append('<input type="checkbox" checked value="'+id+'" name="studant[responsible_ids][]" style="display:none;"/>');
    $('#responsible-list').append('<tr><td>' + id + '</td><td>' + name + '</td></tr>');
  }
});

function callFilter() {
  $($modal.find('tr')).hide();
  $($modal.find('tr:regex(class, .*' + $filter.val() + '.*)')).show();
}