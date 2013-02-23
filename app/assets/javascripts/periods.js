$(function() {

    $("#moreEntryField").click(function() {
      var container = $(".entryFields");
      var howManyExistingFields =  $(".entryFields input").length/2;
      console.log(howManyExistingFields);
      $('<br />').appendTo(container);
      $('<input type="text" size="30" name="entries['+howManyExistingFields+'][visible]" id="entries_'+howManyExistingFields+'_visible" />').appendTo(container);
      container.append(" ");
      $('<input type="text" size="30" name="entries['+howManyExistingFields+'][real]" id="entries_'+howManyExistingFields+'_real" />').appendTo(container);
    });

});
