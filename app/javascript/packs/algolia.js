
var client = algoliasearch('M8XUWMDBTD', '9aea5dbfc14ab8155424c91c8c573f90');
var index = client.initIndex('dev_nationall');
var myAutocomplete = autocomplete('#search-input', {hint: false}, [
    {
      source: autocomplete.sources.hits(index, {hitsPerPage: 5}),
      displayKey: 'title',
      templates: {
        suggestion: function(suggestion) {
          var sugTemplate = "<div><img src='"+ suggestion.image +"'><p>"+ suggestion._highlightResult.title.value +"</p></div>"
          return sugTemplate;
        }
      }
    }
  ]).on('autocomplete:selected', function(event, suggestion, dataset) {
    console.log(suggestion, dataset);
  });
