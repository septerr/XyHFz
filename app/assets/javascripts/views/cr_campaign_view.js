/**
 * Required properties that should be passed to the constructor:
 * el
 * model
 */
Healthfundit.Views.CrCampaignView = Backbone.View.extend({
    template: SMT['crcampaign'],
    tagName: 'div',
    events: {
        'click .upvote-button': 'upvoteClicked'
    },
    initialize: function(){
        this.listenTo(this.model, 'sync', this.updateView);
        if(this.model.get('upvoted')) this.$('.upvote-button').addClass('active');
    },
    render: function(){
        this.$el.html(this.template(this.model.attributes));
    },
    upvoteClicked: function(){
//        this.model.set('upvoted', !this.model.get('upvoted')); //toggle upvoted status
        var upvoteCount = this.model.get('upvote_count');
        var newUpvoteCount = !this.model.get('upvoted')?upvoteCount+1:upvoteCount-1;
//        this.model.set('upvote_count', upvoteCount);
        this.model.save({upvoted: !this.model.get('upvoted'), upvote_count: newUpvoteCount}, {wait: true});
    },
    updateView: function(){
        if(this.model.get('upvoted'))
            this.$('.upvote-button').addClass('active');
         else
            this.$('.upvote-button').removeClass('active');
        this.$('.upvote-count').html(this.model.get('upvote_count'));
    }

});