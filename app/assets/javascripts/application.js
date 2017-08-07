//= require turbolinks
//= require jquery
//= require jquery_ujs
//= require jquery.mask
//= require semantic

$('.ui.dropdown').dropdown();
$('[id$=birthday]').mask('99/99/9999');
$('[id$=cpf]').mask('999.999.999-99');

jQuery.expr[':'].regex = function(elem, index, match) {
  var matchParams = match[3].split(','),
    validLabels = /^(data|css):/,
    attr = {
        method: matchParams[0].match(validLabels) ? 
                    matchParams[0].split(':')[0] : 'attr',
        property: matchParams.shift().replace(validLabels,'')
    },
    regexFlags = 'ig',
    regex = new RegExp(matchParams.join('').replace(/^\s+|\s+$/g,''), regexFlags);
  return regex.test(jQuery(elem)[attr.method](attr.property));
}