var app = {
    // Application Constructor
    initialize: function() {
        var self = this;

        if(self.isCordova()) {
            document.addEventListener("deviceReady", function() {
                self._deviceReady();
            }, false);
        } else {
            self._deviceReady();
        }

        $(document).ready(function() {
            self._isJqmReady = true;
            self._isLoadComplete();
        });
    },
    _deviceReady : function() {
        this._isDeviceReady = true;
        this._isLoadComplete();
    },
    _isLoadComplete : function() {
        var self = this;
        if(this._isDeviceReady && this._isJqmReady) {
            onFullyLoaded();
        }
    },
    isCordova : function() {
        if(document.URL.indexOf('http://') === -1 && document.URL.indexOf('https://') === -1) {
            return true;
        } else {
            return false;
        }
    },
    successHandler: function(result) {
        console.log("Push Notification Callback Success: " + result);
    },
    errorHandler:function(error) {
        console.log("Push Notification Callback Error: " + error);
    },
    onNotificationGCM: function(e) {
        switch( e.event )
        {
        case 'registered':
            if ( e.regid.length > 0 ) {
                    var oldregid = window.localStorage.getItem('pushreg');
                    if(oldregid === null || oldregid != e.regid ) {
                          console.log("Send regid to server");
                          jQuery.post( "http://hashmessenger.com/api-ugly/push_reg.php", { user: device.uuid , id: e.regid, app: "justinbieber"}, function() { window.localStorage.setItem('pushreg', e.regid); });
                    }
            }
            break;
        case 'message':
            if(e.foreground) {
                    console.log("Got message from foreground");
                    update();
            } else {
                    if(e.coldstart) {
                         console.log("Got message from coldstart");
                    } else {
                         console.log("Got message");
                         update();
                    }
            }
            break;
        case 'error':
            alert('GCM error = '+e.msg);
            break;
        default:
            alert('An unknown GCM event has occurred');
            break;
        }
    },
    addBanner: function() {
        var successCreateBannerView = function() { console.log("addBanner Success"); admob.requestAd({'isTesting': true},success,error); };
        var success = function() { console.log("requestAd Success"); };
        var error = function(message) { console.log("Oopsie! " + message); };
        
        var options = {
            'publisherId': 'ca-app-pub-3978385903327524/4461321295',
            'adSize': admob.AD_SIZE.BANNER
        }
        admob.createBannerView(options,successCreateBannerView,error);
    },

};

jQuery(document).on("pageinit", "#aboutpage", function() {
    console.log("Si entro");
    Localization.initialize('English');
    $('a#linkmail').text($("#infoPageCopyrightLink").text());
});

