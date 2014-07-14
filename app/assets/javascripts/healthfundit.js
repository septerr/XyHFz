//= require_self
//= require_tree ../../templates
//= require_tree ./models
//= require_tree ./views
//= require_tree ./collections
//= require_tree ./routers

window.Healthfundit = {
    Models: {},
    Collections: {},
    Routers: {},
    Views: {},
    csrfToken: $("meta[name='csrf-token']").attr('content')
}
// Override Backbone.sync to add CSRF-TOKEN HEADER
Backbone.sync = (function(original) {
    return function(method, model, options) {
        options.beforeSend = function(xhr) {
            xhr.setRequestHeader('X-CSRF-Token', Healthfundit.csrfToken);
        };
        original(method, model, options);
    };
})(Backbone.sync);
