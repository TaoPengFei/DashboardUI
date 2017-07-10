/**
 * Observer Pattern javascript implementation [Observer](http://en.wikipedia.org/wiki/Observer_pattern)
 *
 * @module
 * @example
 *  ```js
 *  var observer = $.microObserver.get("test-cafej");
 *
 *  var dog = {
   *    wou: function(text) {
   *      observer.send("wou", text);
   *    }
   *  }
 *
 *  observer.on("wou", function(text) {
   *    $("#man").text(text);
   *  });
 *  ```
 */
(function () {

    let MicroObserver = function () {};
    MicroObserver.prototype = {
        /**
         * Register event by notify
         *
         * @member on
         * @param {string} notify - name of the notification
         * @param {handler} handler - handler of the notification
         * @param {able} able - able to receive notification
         * @example
         *  ```js
         *  MicroObserver.on("Say text", handler, able)
         *  ```
         */
        on: function (notify, handler, able) {
            let self = this;
                self.notifications = this.notifications || {};
                self.notifications[notify] = self.notifications[notify] || [];
                self.notifications[notify].push({handler: handler, able: able});
        },
        /**
         * Unregister event by notify
         *
         * @member off
         * @param {string} notify - Name of the notification
         * @param {handler} handler - Handler of the notification
         * @example
         *  ```js
         *  MicroObserver.off("Say text", handler)
         *  ```
         */
        off: function (notify, handler) {
            let self = this;
            let n = arguments.length;
            if (n === 0) return delete self.notifications;
            if (n === 1) return delete self.notifications[notify];
    
                self.notifications = self.notifications || {};
            let notifies = self.notifications[notify] || [];
            $.each(notifies, function (i, nf) {
                if (nf.handler === handler) {
                    self.notifications[notify].splice(i, 1);
                    return false;
                }
            });
        },
        /**
         * Send will send event by notify
         *
         * @member send
         * @param {string} notify - Name of the notification
         * @param {...any} arguments is passed to registered {MicroObserver~handler}
         * @example
         *  ```js
         *  MicroObserver.send("Say text", "tell me", "something", "to someone")
         *  ```
         */
        send: function (/* arguments... */) {
            let notify = arguments[0];
            let self = this;
                self.notifications = self.notifications || {};
                self.notifications[notify] = self.notifications[notify] || [];
            let notifies = self.notifications[notify];
            let args = Array.prototype.slice.call(arguments, 1);
            $.each(notifies, function (i, nf) {
                let ok = nf.able === undefined || nf.able.apply(null, args);
                ok && nf.handler.apply(null, args);
            });
        }
    }

    let observers = {}
    $.microObserver = {
        create: function (name) {
            observers[name] = new MicroObserver();
            return observers[name];
        },
        get: function (name) {
            let self = this;
            return observers[name] || self.create(name);
        }
    }
})();
/**
 * Handler of the notification
 *
 * @typedef handler
 * @param {...any}
 */
/**
 * Able to receive notification
 *
 * @typedef able
 * @returns {undefined | true} handler is invoked when notification coming <br/>
 * @returns {false} handler is not invoked when notification coming
 */ 