var Localization;
Localization = (function() {
    function Localization() {}
    Localization.initialize = function(fallback_language) {
       Localization.fallback_language = fallback_language;
       Localization.dictionnary = { English: 'en.json', español: 'es.json' };
       return navigator.globalization.getPreferredLanguage(Localization.get_preferred_language_callback, Localization.get_preferred_language_error_callback);
    };
    Localization.get_preferred_language_callback = function(language) {
       Localization.language = language.value;
       console.log("Phone language is " + Localization.language);
       if (Localization.language in Localization.dictionnary) {
          console.log("It is supported.");
       } else {
          Localization.language = Localization.fallback_language;
          console.log("It is unsupported, so we chose " + Localization.language + " instead.");
       }
       return Localization.apply_to_current_html();
    };
    Localization.get_preferred_language_error_callback = function() {
       Localization.language = Localization.fallback_language;
       return Localization.apply_to_current_html();
    };
    Localization.apply_to_current_html = function() {
       var key, value, _ref, _results;
       _ref = Localization.getjson();
       _results = [];
       $.each(_ref.translations[0], function(key, value) {
          if (key.indexOf("Button") >= 0) {
              $("#" + key + " .ui-btn-text").text(value);
          } else {
              $("#" + key).text(value);
          }
 
       });
       return _results;
    };

    Localization.getjson = function () {
       var langjson = undefined;
       $.ajax({
           dataType: "json",
           crossDomain: true,  
           async: false,
           url: 'lang/' + Localization.dictionnary[Localization.language],
           error: function (textStatus, errorThrown) {
                 showAlert("Error downloading the lang file." + errorThrown + textStatus,exitapp, "Error, please try again", "Close");
           },
           success: function (data){
                 langjson = data;
           },
       });
       return langjson;
    };
    return Localization;
})();
