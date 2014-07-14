/**
 *
 * Required Properties: collection, el.
 */
Healthfundit.Views.CrCampaignCollectionView = Backbone.View.extend({
    render: function(){
       this.$el.html('');
       this.collection.each(this.renderCampaign, this);
    },

    renderCampaign: function(c){
     this.$el.append(new CrCampaignView({
         model: c
     }).el);
    }
});